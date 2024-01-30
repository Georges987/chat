import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 3),
      decoration: BoxDecoration(
        color: const Color(0xFFE6EEFA),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15, left: 15, right: 15, bottom: 0),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/content/avatar.png",
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Anais KPADE',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 0, left: 13, right: 13, bottom: 13),
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/images/content/image2.png'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 200),
                        Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(73, 10, 10, 10),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                            child: const Icon(Icons.favorite,
                                                size: 25, color: Colors.white),
                                            onTap: () {
                                              // Going new Like
                                            },
                                          ),
                                          const Text(
                                            "120",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 15),
                                      Row(
                                        children: [
                                          InkWell(
                                            child: const Icon(
                                              Icons.comment,
                                              size: 25,
                                              color: Colors.white,
                                            ),
                                            onTap: () {
                                              // Going to comment page
                                            },
                                          ),
                                          const Text(
                                            "120",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}