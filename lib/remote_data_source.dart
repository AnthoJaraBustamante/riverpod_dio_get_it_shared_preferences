import 'package:dio/dio.dart';

abstract class RemoteDataSource {
  Future<Response> fetchPosts();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;
  RemoteDataSourceImpl(this.dio);

  @override
  Future<Response> fetchPosts() async {
    try {
      final response = await dio.get('/posts');
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
