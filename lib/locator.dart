import 'package:get_it/get_it.dart';

import 'features/auth/repository/auth_repository.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {

  /// Repositories
  locator.registerSingleton<AuthenticationRepository>(AuthenticationRepository());
}
