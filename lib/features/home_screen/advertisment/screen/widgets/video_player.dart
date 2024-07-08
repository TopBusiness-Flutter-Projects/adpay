import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
<<<<<<< HEAD
import 'package:url_launcher/url_launcher.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
=======
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  VideoPlayerScreen({required this.videoUrl});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _youtubeController;
<<<<<<< HEAD
  bool isYoutube = false;
=======
  late VideoPlayerController _videoPlayerController;
  String? videoId;
  bool isYoutube = false;
  bool videoError = false;
  String errorMessage = '';
>>>>>>> origin/main

  @override
  void initState() {
    super.initState();
    initializeVideo();
  }

  void initializeVideo() {
<<<<<<< HEAD
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
=======
    videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    if (videoId != null) {
      isYoutube = true;
      initializeYoutubePlayer(videoId!);
    } else {
      isYoutube = false;
      initializeVideoPlayer();
>>>>>>> origin/main
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

<<<<<<< HEAD
  Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

=======
  void initializeVideoPlayer() {
    try {
      _videoPlayerController = VideoPlayerController.network(widget.videoUrl)
        ..initialize().then((_) {
          setState(() {});
          _videoPlayerController.play();
        }).catchError((error) {
          setVideoError('Video player initialization error: $error');
        });
    } catch (error) {
      setVideoError('Video player error: $error');
    }
  }

  void setVideoError(String message) {
    setState(() {
      videoError = true;
      errorMessage = message;
    });
    print(message);
  }

>>>>>>> origin/main
  @override
  void dispose() {
    if (isYoutube) {
      _youtubeController.dispose();
<<<<<<< HEAD
=======
    } else {
      _videoPlayerController.dispose();
>>>>>>> origin/main
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
<<<<<<< HEAD
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
=======
    } else if (videoError) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Failed to load video'),
          SizedBox(height: 10),
          Text(errorMessage, style: TextStyle(color: Colors.red)),
        ],
      );
    } else if (!isYoutube && _videoPlayerController.value.isInitialized) {
      return AspectRatio(
        aspectRatio: _videoPlayerController.value.aspectRatio,
        child: VideoPlayer(_videoPlayerController),
      );
    } else {
      return CircularProgressIndicator();
    }
  }
>>>>>>> origin/main
}