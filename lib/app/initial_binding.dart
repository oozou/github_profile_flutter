import 'package:get_it/get_it.dart';
import 'package:github_profile_flutter/app/data/repository/github_repository.dart';
import 'package:github_profile_flutter/app/pages/home_provider.dart';

import 'data/remote/api_client.dart';
import 'data/remote/github_api.dart';

const baseUrl = "https://api.github.com";

final getIt = GetIt.instance;

void initBinding() {
  getIt.registerSingleton(ApiClient(baseUrl));

  // Api
  getIt.registerFactory(() => GithubApi(getIt.get()));

  // Repository
  getIt.registerFactory(() => GithubRepository(getIt.get()));

  // Provider
  getIt.registerFactory(() => HomeProvider(getIt.get()));
}