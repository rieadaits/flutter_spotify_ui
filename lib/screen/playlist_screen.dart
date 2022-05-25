
import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:flutter_spotify_ui/widgets/widgets.dart';

class PlaylistScreen extends StatefulWidget {
  final Playlist playlist;

  const PlaylistScreen({Key? key, required this.playlist}) : super(key: key);

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 140,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              AppBarChevronIcon(
                iconData: Icons.chevron_left,
                onTap: () {},
              ),
              SizedBox(
                width: 16,
              ),
              AppBarChevronIcon(
                iconData: Icons.chevron_right,
                onTap: () {},
              ),
            ],
          ),
        ),
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(
              primary: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {},
            icon: Icon(
              Icons.account_circle,
              size: 30,
            ),
            label: Text('shuvo'),
          ),
          SizedBox(
            width: 8,
          ),
          IconButton(
            padding: EdgeInsets.only(),
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 30,
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFAF1018),
              Theme.of(context).backgroundColor,
            ],
            stops: [0.0, 0.3],
          ),
        ),
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            children: [
              PlaylistHeader(playlist: widget.playlist),
              TracksList(tracks: widget.playlist.songs)
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarChevronIcon extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onTap;

  const AppBarChevronIcon(
      {Key? key, required this.iconData, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.black26,
          shape: BoxShape.circle,
        ),
        child: Icon(
          iconData,
          size: 28,
        ),
      ),
    );
  }
}
