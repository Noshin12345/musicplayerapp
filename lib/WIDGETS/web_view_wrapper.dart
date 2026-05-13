import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../core/app_colors.dart';
import '../core/youtubeappcolors.dart';
import 'full_screen_loading_overlay.dart';


class WebViewWrapper extends StatefulWidget {
  const WebViewWrapper({
    super.key,
    required this.url,
    required this.title,
  });

  final String url;
  final String title;

  @override
  State<WebViewWrapper> createState() => _WebViewWrapperState();
}

class _WebViewWrapperState extends State<WebViewWrapper> {
  final ValueNotifier<bool> _isLoading = ValueNotifier(true);

  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)

      ..setNavigationDelegate(
        NavigationDelegate(

          // Loading started
          onProgress: (progress) {
            _isLoading.value = true;
          },

          // Page finished loading
          onPageFinished: (String url) async {
            _isLoading.value = false;

            // Hide YouTube top bar
            await _controller.runJavaScript('''
              var navBar = document.querySelector(
                'ytm-mobile-topbar-renderer'
              );

              if (navBar) {
                navBar.style.display = 'none';
              }
            ''');
          },
        ),
      )

      ..loadRequest(
        Uri.parse(widget.url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isLoading,

      builder: (context, isLoading, child) {
        return FullScreenLoadingOverlay(
          isLoading: isLoading,

          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors1.backgroundDark,

              title: Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),

              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },

                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),

            body: WebViewWidget(
              controller: _controller,
            ),
          ),
        );
      },
    );
  }
}