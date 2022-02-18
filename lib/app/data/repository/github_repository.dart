
import 'package:github_profile_flutter/app/data/model/github/profile.dart';

import '../remote/github_api.dart';


class GithubRepository {

  final GithubApi _api;

  GithubRepository(this._api);

  Future<List<Profile>> getProfiles() async {
    return await _api.getProfiles();
  }
}