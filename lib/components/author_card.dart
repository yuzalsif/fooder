import 'package:flutter/material.dart';
import './circular_image.dart';

class AuthorCard extends StatefulWidget {
  final ImageProvider imageProvider;
  final String title;
  final String authorName;

  const AuthorCard({
    Key? key,
    required this.imageProvider,
    required this.title,
    required this.authorName,
  }) : super(key: key);

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

var _isFavorited = false;

class _AuthorCardState extends State<AuthorCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              CircularImage(
                imageProvider: widget.imageProvider,
                imageRadius: 28,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  widget.authorName,
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(widget.title,
                    style: Theme.of(context).textTheme.headline3),
              ])
            ],
          ),
          IconButton(
            icon: Icon(_isFavorited ? Icons.favorite : Icons.favorite_border),
            color: Colors.red,
            iconSize: 30,
            onPressed: () {
              setState(() {
                _isFavorited = !_isFavorited;
              });
              (){
                 const snackBar = SnackBar(content: Text('You liked this card!'));
                 ScaffoldMessenger.of(context).showSnackBar(snackBar);
              };
            },
          ),
        ],
      ),
    );
  }
}
