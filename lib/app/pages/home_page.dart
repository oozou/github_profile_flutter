import 'package:flutter/material.dart';
import 'package:github_profile_flutter/app/pages/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey.shade100,
          child: FutureBuilder(
            future: homeProvider.getGithubProfiles(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: homeProvider.profiles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 24.0,
                              backgroundImage: NetworkImage(
                                  homeProvider.profiles[index].avatarUrl ?? ""),
                              backgroundColor: Colors.transparent,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(homeProvider.profiles[index].login)
                          ],
                        ),
                      ),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
