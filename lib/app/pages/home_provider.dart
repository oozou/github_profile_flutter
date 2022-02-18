import 'package:flutter/widgets.dart';
import 'package:github_profile_flutter/app/data/model/github/profile.dart';
import 'package:github_profile_flutter/app/data/repository/github_repository.dart';

class HomeProvider extends ChangeNotifier {

  final GithubRepository _repository;

  HomeProvider(this._repository);

  final List<Profile> profiles = [];

  getGithubProfiles() async {
    profiles.addAll(await _repository.getProfiles());
    notifyListeners();
  }
}