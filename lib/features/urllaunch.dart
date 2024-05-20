import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// This is a stateless widget that displays an icon and launches a phone call
class CallIcon extends StatelessWidget {
  final String phoneNumber;

  const CallIcon({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchCall(phoneNumber);
      },
      child: Image.asset("assets/images/call.png")
    );
  }

  // Method to launch a phone call
  void _launchCall(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
