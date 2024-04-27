// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:queuec/about.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.only(top: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutPage()),
                        //change to forms (?) or List.dart
                      );
                    },
                    child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.hourglass_bottom_rounded,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "Assisting Now:",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                //fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.visible,
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "09",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ))),
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutPage()),
                      );
                    },
                    child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.add_to_queue_outlined,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "View Queue",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "here",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                          ],
                        ))),
              ],
            ),
            Column(children: [
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Latest News: ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () async {
                        final url =
                            'https://www.tip.edu.ph/home/tip-develops-hand-rehabilitation-device/';

                        if (await canLaunch(url)) {
                          await launch(
                            url,
                            forceSafariVC: false,
                            forceWebView: true,
                            enableJavaScript: true,
                          );
                        }
                      },
                      child: Image.asset(
                        'images/sample.jpg',
                        width: 100,
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ]), //end ng column pls
            const SizedBox(height: 20),
            CarouselSlider(
              options: CarouselOptions(
                height: 100.0,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: [
                // Add your carousel items here (e.g., Image.asset, Container, etc.)
                Image.asset('images/ayos.png'),
                Image.asset('images/ayos.png'),
                Image.asset('images/ayos.png'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutPage()),
                    );
                  },
                  child: Container(
                    width: 150,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    padding: const EdgeInsets.all(5.0),
                    child: const Row(
                      children: [
                        Icon(Icons.info, color: Colors.black, size: 45),
                        SizedBox(width: 8),
                        Flexible(
                            child: Text(
                          "About the Developers",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.visible,
                        )),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(2.0)),
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    'images/abet_logo.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
