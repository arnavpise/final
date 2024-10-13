

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'; // For controlling system UI
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class YouTubeVideoPlayer extends StatefulWidget {
//   final String videoId;

//   YouTubeVideoPlayer({required this.videoId});

//   @override
//   _YouTubeVideoPlayerState createState() => _YouTubeVideoPlayerState();
// }

// class _YouTubeVideoPlayerState extends State<YouTubeVideoPlayer> {
//   late YoutubePlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: widget.videoId,
//       flags: YoutubePlayerFlags(
//         autoPlay: false,
//         mute: false,
//         forceHD: true, // Forces HD video when available
//         enableCaption: true,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return YoutubePlayerBuilder(
//       player: YoutubePlayer(
//         controller: _controller,
//         showVideoProgressIndicator: true,
//         progressIndicatorColor: Colors.blueAccent,
//       ),
//       builder: (context, player) {
//         return Column(
//           children: [
//             // YouTube player widget (this will handle full screen transitions)
//             player,
//           ],
//         );
//       },
//       onEnterFullScreen: () {
//         // Hides the status bar and navigation controls for Android and iOS
//         SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
//       },
//       onExitFullScreen: () {
//         // Restores the system UI when exiting full-screen mode for both platforms
//         SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//       },
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:logger/logger.dart';

class YouTubeVideoPlayer extends StatefulWidget {
  final String videoId;

  const YouTubeVideoPlayer({Key? key, required this.videoId}) : super(key: key);

  @override
  _YouTubeVideoPlayerState createState() => _YouTubeVideoPlayerState();
}

class _YouTubeVideoPlayerState extends State<YouTubeVideoPlayer> {
  InAppWebViewController? webViewController;
  final Logger logger = Logger(); // Create a logger instance

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: InAppWebView(
            initialUrlRequest: URLRequest(
              url: WebUri('https://www.youtube.com/embed/${widget.videoId}?autoplay=1&rel=0'), // Use WebUri
            ),
            onWebViewCreated: (controller) {
              webViewController = controller;
              logger.i("WebView created"); // Log WebView creation
            },
            onLoadStart: (controller, url) {
              logger.i("Loading started: $url"); // Log when loading starts
            },
            onLoadStop: (controller, url) async {
              logger.i("Loading stopped: $url"); // Log when loading stops
            },
            onReceivedError: (controller, request, error) {
              logger.e("Error loading: ${error.description}"); // Log errors
            },
            onReceivedHttpError: (controller, request, response) {
              logger.e("HTTP error: ${response.statusCode} - ${response.reasonPhrase}"); // Log HTTP errors
            },
          ),
        ),
      ],
    );
  }
}
