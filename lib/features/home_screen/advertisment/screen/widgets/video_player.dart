import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  VideoPlayerScreen({required this.videoUrl});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _youtubeController;
  bool isYoutube = false;

  @override
  void initState() {
    super.initState();
    initializeVideo();
  }

  void initializeVideo() {
    if (widget.videoUrl.contains('youtu.be') || widget.videoUrl.contains('youtube.com')) {
      isYoutube = true;
      String? videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
      if (videoId != null) {
        initializeYoutubePlayer(videoId);
      } else {
        print('Invalid YouTube URL');
      }
    } else {
      isYoutube = false;
    }
  }

  void initializeYoutubePlayer(String id) {
    _youtubeController = YoutubePlayerController(
      initialVideoId: id,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    if (isYoutube) {
      _youtubeController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Center(
        child: buildVideoPlayer(),
      ),
    );
  }

  Widget buildVideoPlayer() {
    if (isYoutube) {
      return YoutubePlayer(
        controller: _youtubeController,
        showVideoProgressIndicator: true,
      );
    } else {
      // Launch the URL immediately
      WidgetsBinding.instance.addPostFrameCallback((_) {
        launchURL(widget.videoUrl);
      });
      return Container();
    }
  }
}
Future<void> launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}