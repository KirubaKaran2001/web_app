// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class WebApp extends StatefulWidget {
  const WebApp({super.key});

  @override
  State<WebApp> createState() => _WebAppState();
}

class _WebAppState extends State<WebApp> {
  String whatsAppNumber = '9345596517';
  String myEmail = 'Kirubap01@gmail.com';
  String phoneNumber = '9345596517';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Web App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('KirubaKaran'),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://media.istockphoto.com/photos/galaxy-outer-space-starry-sky-purple-red-abstract-star-pattern-picture-id1347283792?s=2048x2048'),
                  maxRadius: 50,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  const Text('Contact Me'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            _launchPhoneCalls();
                          },
                          icon: const Icon(Icons.call)),
                      IconButton(
                          onPressed: () {
                            _launchEmailURL();
                          },
                          icon: const Icon(Icons.email)),
                      IconButton(
                          onPressed: () {
                            launchWhatsApp();
                          },
                          icon: const Icon(Icons.whatsapp)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  launchWhatsApp() async {
    String text = 'Hi, I\'ve got some feedback to share. Anybody there ?';
    String whatsAppUrl =
        'https://wa.me/91$whatsAppNumber?text=${Uri.encodeComponent(text)}';
    await launch(whatsAppUrl);
  }

  launchCall() {}
  void _launchEmailURL() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: myEmail,
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  _launchPhoneCalls() async {
    String telephoneNo = 'tel:+91$phoneNumber';
    if (await canLaunch(telephoneNo)) {
      await launch(telephoneNo);
    } else {
      throw 'Could not launch $telephoneNo';
    }
  }
}
