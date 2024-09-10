import 'package:riverpod_dio_get_it_shared_preferences/posts_model.dart';
import 'package:riverpod_dio_get_it_shared_preferences/remote_data_source.dart';

abstract class Repository {
  Future<List<PostsModel>> getPosts();
}

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;

  RepositoryImpl(this.remoteDataSource);

  @override
  Future<List<PostsModel>> getPosts() async {
    final response = await remoteDataSource.fetchPosts();
    final data = response.data as List<dynamic>;
    return data.map((json) => PostsModel.fromJson(json)).toList();
  }
}
