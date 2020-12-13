import 'package:flutter/material.dart';
import 'package:ezzy/datamodel/Post.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PostListItem extends StatelessWidget {
  final Post post;

  PostListItem({
    Key key,
    this.post
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(post.authorUID),
        post.photoURL != null
        ? SizedBox(
          height: 250,
          child: CachedNetworkImage(
            imageUrl: post.photoURL,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        )
        : Container(),
        GestureDetector(
          onTap: () {},
          child: Icon(Icons.announcement_outlined),
        ),
        Text(post.title),
        Text(post.body)
      ],
    );
  }
}
