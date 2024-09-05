import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_api_projects/api_service.dart';
import 'package:rest_api_projects/create_user_model.dart';
import 'package:rest_api_projects/user_model.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

final userListProvider = FutureProvider<List<User>>((ref) async {
  return ref.watch(apiServiceProvider).fetchUser();
});

final userProvider = StateNotifierProvider<UserNotifier, CreateUser?>((ref) {
  return UserNotifier(ref.read(apiServiceProvider));
});

class UserNotifier extends StateNotifier<CreateUser?> {
  final ApiService apiService;

  UserNotifier(this.apiService) : super(null);

  Future<void> createUser(String name, String job) async {
    try {
      final user = await apiService.createUser(name, job);
      state = user;
    } catch (e) {
      state = null;
    }
  }
}
