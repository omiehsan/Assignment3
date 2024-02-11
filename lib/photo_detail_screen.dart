import 'package:assignment_3/photo.dart';
import 'package:flutter/material.dart';

class PhotoDetailScreen extends StatefulWidget {
  final Photo photo;

  const PhotoDetailScreen({Key? key, required this.photo}) : super(key: key);

  @override
  _PhotoDetailScreenState createState() => _PhotoDetailScreenState();
}

class _PhotoDetailScreenState extends State<PhotoDetailScreen> {
  late Future<void> _future;

  @override
  void initState() {
    super.initState();
    _future = Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.photo.title),
      ),
      body: FutureBuilder<void>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(widget.photo.imageUrl),
                    const SizedBox(height: 20),
                    Text('ID: ${widget.photo.id}'),
                    const SizedBox(height: 10),
                    Text('Title: ${widget.photo.title}'),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
