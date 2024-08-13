import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat_starting_project/features/auth/data/repository/authentication_repositoryimpl.dart';
import 'package:get_it/get_it.dart';

import 'features/chat/data/data_source/remote/chat_api_provider.dart';
import 'features/chat/data/repository/chat_repositoryimpl.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {

  locator.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  /// Api Providers
  locator.registerSingleton<ChatApiProvider>(ChatApiProvider(locator()));

  /// Repositories
  locator.registerSingleton<AuthenticationRepositoryImpl>(AuthenticationRepositoryImpl());
  locator.registerSingleton<ChatRepositoryImpl>(ChatRepositoryImpl(locator()));
}
