// // lib/machine_a_screen.dart
// import 'package:flutter/material.dart';
// import 'youtube_video_player.dart'; // Import the reusable YouTube video player

// class MachineAScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Machine A Details'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Machine A',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'This is a detailed description of Machine A, explaining its features and capabilities.',
//             ),
//             SizedBox(height: 20),
//             // Use the YouTubeVideoPlayer widget, and pass the YouTube video ID for Machine A
//             YouTubeVideoPlayer(videoId: 'jlMMIRufIZM'), // Replace with actual video ID
//           ],
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:logger/logger.dart';

class MachineAScreen extends StatelessWidget {
  final String videoUrl = "https://www.youtube.com/watch?v=jlMMIRufIZM"; // YouTube video URL
  final Logger logger = Logger(); // Create a logger instance

  // Removed const keyword from the constructor
  MachineAScreen({super.key}); // Pass key to super constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Machine A Details'), // Made title const
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Machine A',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'This is a detailed description of Machine A, explaining its features and capabilities.',
            ),
            const SizedBox(height: 20),
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: WebUri(videoUrl), // Use WebUri to create the URL
                ),
                onWebViewCreated: (InAppWebViewController controller) {
                  // Optionally store the controller if needed
                },
                onReceivedError: (InAppWebViewController controller, WebResourceRequest request, WebResourceError error) {
                  // Use the logger instead of print
                  logger.e("Error loading: ${error.description}");
                },
                onLoadStop: (InAppWebViewController controller, Uri? url) async {
                  // Optionally do something after the page loads
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
