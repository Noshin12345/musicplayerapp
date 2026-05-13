

import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/youtubeappcolors.dart';

class FullScreenLoadingOverlay extends StatelessWidget {
  const FullScreenLoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.loadingWidget
  });

  final bool isLoading;
  final Widget child;
  final Widget? loadingWidget;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if(isLoading)
          Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors1.surfaceDark,
              child: Center(
              child: loadingWidget??CircularProgressIndicator(),
            ),
          )
      ],
    );
  }
}
