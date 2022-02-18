class Profile {

  final String? avatarUrl;
  final String login;

  Profile(this.avatarUrl, this.login);

  Profile.fromJson(Map<String, dynamic> json)
      : avatarUrl = json['avatar_url'],
        login = json['login'];

  Map<String, dynamic> toJson() => {
    'avatar_url': avatarUrl,
    'login': login,
  };

}