import 'package:github_profile_flutter/app/data/model/github/profile.dart';

import 'api_client.dart';


class GithubApi {
  final ApiClient _apiClient;

  GithubApi(this._apiClient);

  Future<List<Profile>> getProfiles() async {
    var response = await _apiClient.client.get("/users");
    Iterable profilesIterable = response.data;
    List<Profile> profiles = List<Profile>.from(
        profilesIterable.map((model) => Profile.fromJson(model)));
    return profiles;
  }
}
