import 'package:flutter/material.dart';
import 'package:fooderlich/components/circular_image.dart';
import 'package:fooderlich/models/models.dart';

class FriendTile extends StatelessWidget {
  final Post post;

  const FriendTile({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircularImage(
            imageProvider: AssetImage(post.profileImageUrl),
            imageRadius: 20,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.comment),
                Text(
                  '${post.timestamp} mins ago',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
