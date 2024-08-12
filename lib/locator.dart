import 'package:flash_chat_starting_project/features/auth/data/repository/authentication_repositoryimpl.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {

  /// Repositories
  locator.registerSingleton<AuthenticationRepositoryImpl>(AuthenticationRepositoryImpl());
}
