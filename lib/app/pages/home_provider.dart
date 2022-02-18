import 'package:flutter/widgets.dart';
import 'package:github_profile_flutter/app/data/model/github/profile.dart';
import 'package:github_profile_flutter/app/data/repository/github_repository.dart';

class HomeProvider extends ChangeNotifier {
  final GithubRepository _repository;

  HomeProvider(this._repository);

  Future<List<Profile>> getGithubProfiles() async {
    return await _repository.getProfiles();
  }
}
