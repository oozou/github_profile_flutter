import 'package:flutter/material.dart';
import 'package:github_profile_flutter/app/pages/home_provider.dart';
import 'package:provider/provider.dart';

import '../data/model/github/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey.shade100,
          child: _githubProfileList(context),
        ),
      ),
    );
  }

  Widget _githubProfileList(BuildContext context) {
    return FutureBuilder<List<Profile>>(
      future: Provider.of<HomeProvider>(context).getGithubProfiles(),
      builder: (BuildContext context, AsyncSnapshot<List<Profile>> snapshot) {
        return Consumer<HomeProvider>(builder: (context, homeProvider, child) {
          return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return _githubProfileItem(context, snapshot.data?[index]);
              });
        });
      },
    );
  }

  Widget _githubProfileItem(BuildContext context, Profile? profile) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24.0,
              backgroundImage: NetworkImage(
                  profile?.avatarUrl ?? ""),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(profile?.login ?? "")
          ],
        ),
      ),
    );
  }
}
