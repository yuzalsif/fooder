import 'package:flutter/material.dart';
import './models.dart';
import '../components/components.dart';

class FriendPostListView extends StatelessWidget {
  final List<Post> friendPost;

  const FriendPostListView({Key? key, required this.friendPost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Social Chefs 🧑‍🍳',
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 10,),
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: ((context, index) {
              final post = friendPost[index];
              return FriendTile(post: post);
            }),
            separatorBuilder: ((context, index) {
              return const SizedBox(
                height: 16,
              );
            }),
            itemCount: friendPost.length,
          )
        ],
      ),
    );
  }
}
