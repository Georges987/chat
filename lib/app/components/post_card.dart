import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  const PostCard(
      {super.key,
      required this.uid,
      required this.image,
      required this.post,
      required this.time});
  final String uid;
  final String image;
  final String post;
  final Timestamp time;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  String username = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: widget.uid)
        .get()
        .then((value) => value.docs.forEach((element) {
              debugPrint(element.data()['name']);
              setState(() {
                username = element.data()['name'];
              });
            }));
  }

  String _formatTimeDifference(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      return DateFormat('dd MMM').format(
          timestamp); // Affiche la date si la différence est d'au moins un jour
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 3),
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
                InkWell(
                  onTap: () => Get.toNamed('/status-show', parameters: {
                    'image': widget.image,
                    'post': widget.post,
                    'postId': widget.uid,
                  }),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 0),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/content/avatar.png",
                          height: 50,
                          width: 50,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              username,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              _formatTimeDifference(widget.time.toDate()),
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
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
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.image,
                        ),
                        fit: BoxFit.cover,
                      ),
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
                                  child: Column(
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
