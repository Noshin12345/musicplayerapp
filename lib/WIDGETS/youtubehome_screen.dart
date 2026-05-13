import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaplayer_app/WIDGETS/youtube_screen.dart';
import 'package:mediaplayer_app/WIDGETS/youtubenav_title.dart';
import '../../core/youtube_urls.dart';
import '../core/app_colors.dart';
import '../core/appstrings.dart';
import '../core/youtubeapp_strings.dart';
import '../core/youtubeappcolors.dart';


class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen1> {
  void _openUrl(String title, String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => YoutubeScreen(title: title, url: url),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors1.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors1.backgroundDark,
        title: Row(
          spacing: 8,
          children: [
            Container(
              width: 35,
              height: 25,
              decoration: BoxDecoration(
                color: AppColors1.youtubePrimary,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(Icons.play_arrow, color: Colors.white),
            ),
            Text(
              AppStrings.appName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: Colors.white),
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildSectionHeader(AppStrings1.sectionBrowse),
          YoutubeNavTile(
            icon: Icons.home_rounded,
            label: AppStrings1.navHome,
            onTap: () => _openUrl(AppStrings1.navHome, YoutubeUrls.home),
          ),
          YoutubeNavTile(
            icon: Icons.slideshow_rounded,
            label: AppStrings1.navShorts,
            onTap: () => _openUrl(AppStrings1.navShorts, YoutubeUrls.shorts),
          ),
          YoutubeNavTile(
            icon: Icons.subscriptions_rounded,
            label: AppStrings1.navSubscriptions,
            onTap: () => _openUrl(
              AppStrings1.navSubscriptions,
              YoutubeUrls.subscriptions,
            ),
          ),
          YoutubeNavTile(
            icon: Icons.explore_rounded,
            label: AppStrings1.navExplore,
            onTap: () => _openUrl(AppStrings1.navExplore, YoutubeUrls.explore),
          ),
          YoutubeNavTile(
            icon: Icons.trending_up_rounded,
            label: AppStrings1.navTrending,
            onTap: () => _openUrl(AppStrings1.navTrending, YoutubeUrls.trending),
          ),
          Divider(
            color: AppColors1.divider,
            height: 1,
            indent: 16,
            endIndent: 16,
          ),
          _buildSectionHeader(AppStrings1.sectionLibrary),
          YoutubeNavTile(
            icon: Icons.history_rounded,
            label: AppStrings1.navHistory,
            onTap: () => _openUrl(AppStrings1.navHistory, YoutubeUrls.history),
          ),
          YoutubeNavTile(
            icon: Icons.watch_later_outlined,
            label: AppStrings1.navWatchLater,
            onTap: () =>
                _openUrl(AppStrings1.navWatchLater, YoutubeUrls.watchLater),
          ),
          YoutubeNavTile(
            icon: Icons.thumb_up_outlined,
            label: AppStrings1.navLikedVideos,
            onTap: () =>
                _openUrl(AppStrings1.navLikedVideos, YoutubeUrls.likedVideos),
          ),
          Divider(
            color: AppColors1.divider,
            height: 1,
            indent: 16,
            endIndent: 16,
          ),
          _buildSectionHeader(AppStrings1.sectionMore),
          YoutubeNavTile(
            icon: Icons.settings_outlined,
            label: AppStrings1.navSettings,
            onTap: () => _openUrl(AppStrings1.navSettings, YoutubeUrls.settings),
          ),
          YoutubeNavTile(
            icon: Icons.help_outline_rounded,
            label: AppStrings1.navHelp,
            onTap: () => _openUrl(AppStrings1.navHelp, YoutubeUrls.help),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors1.textHint,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}