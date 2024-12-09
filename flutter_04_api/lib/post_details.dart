import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/api_service.dart';

class PostDetails extends StatelessWidget {
  final int postId;

  const PostDetails({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết bài viết'),
      ),
      body: FutureBuilder<Post>(
        future: apiService.fetchPost(postId), // Lấy bài viết dựa vào postId
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Lỗi: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('Không tìm thấy bài viết.'),
            );
          }

          final Post post = snapshot.data!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (post.title != null) // Hiển thị tiêu đề nếu có
                  Text(
                    post.title!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(height: 16),
                if (post.body != null) // Hiển thị nội dung nếu có
                  Text(
                    post.body!,
                    style: const TextStyle(fontSize: 16),
                  ),
                const SizedBox(height: 16),
                if (post.base64Image != null) // Hiển thị hình ảnh nếu có
                  Image.memory(
                    base64Decode(post.base64Image!),
                    fit: BoxFit.cover,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
