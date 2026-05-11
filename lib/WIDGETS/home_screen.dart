import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaplayer_app/WIDGETS/player_controller.dart';
import 'package:mediaplayer_app/WIDGETS/song_list_item.dart';
import 'package:provider/provider.dart';

import '../core/app_colors.dart';
import '../core/appstrings.dart';
import '../presentation/provider/media_provider.dart';

class HomeScreen extends StatelessWidget {
const HomeScreen({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: AppColors.background,
appBar: AppBar(
title: Text(
AppStrings.appName,
style: TextStyle(color: AppColors.textPrimary),
),
backgroundColor: AppColors.surface,
),
body: Column(
children: [
PlayerController(),
Expanded(
child: Consumer<MediaProvider>(
builder: (context, provider, child) {
final playlist = provider.playlist;
return ListView.builder(
itemCount: playlist.length,
itemBuilder: (context, index) {
final song = playlist[index];

//Chceks if the item is currently playing song
final isSelected = index == provider.currentIndex;

return SongListItem(
song: song,
index: index,
isPlaying: provider.isPlaying,
isSelected: isSelected,
onTap: () {
provider.playSongAtIndex(index);
},
);
},
);
},
),
),
],
),
);
}
}