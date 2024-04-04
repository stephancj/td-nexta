import 'package:flutter/material.dart';

class PostDetailsPage extends StatefulWidget {
  final String text;
  final String imageUrl;
  const PostDetailsPage({super.key, required this.text, required this.imageUrl});

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.text),
            Image.network(widget.imageUrl, width: 200, height: 200, fit: BoxFit.cover),
          ],
        ),
      )
    );
  }
}