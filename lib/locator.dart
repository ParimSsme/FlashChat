import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat_starting_project/features/auth/data/repository/authentication_repositoryimpl.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/bloc/app_bloc.dart';
import 'common/utils/shared_oprator.dart';
import 'features/auth/domain/repository/authentication_repository.dart';
import 'features/chat/data/data_source/remote/chat_api_provider.dart';
import 'features/chat/data/repository/chat_repositoryimpl.dart';
import 'features/chat/domain/repository/chat_repository.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {

  locator.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  locator.registerSingleton<SharedPrefOperator>(SharedPrefOperator(await SharedPreferences.getInstance()));

  /// Api Providers
  locator.registerLazySingleton<ChatApiProvider>(() => ChatApiProvider(locator()));

  /// Repositories
  locator.registerSingleton<AuthenticationRepository>(AuthenticationRepositoryImpl());
  locator.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(locator()));

  locator.registerSingleton<AppBloc>(AppBloc(authenticationRepository: locator(),));
}
