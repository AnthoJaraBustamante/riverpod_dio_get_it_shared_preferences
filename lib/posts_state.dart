import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_dio_get_it_shared_preferences/posts_model.dart';
import 'package:riverpod_dio_get_it_shared_preferences/repository.dart';
import 'package:riverpod_dio_get_it_shared_preferences/service_locator.dart';

part 'posts_state.g.dart';

@riverpod  
class PostsState extends _$PostsState {
  @override
  FutureOr<List<PostsModel>> build()async {
    final repository = getIt<Repository>();
    return await repository.getPosts();
  }
}
