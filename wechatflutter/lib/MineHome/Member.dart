class Member{

  final String login;
  final String avatar_url;

  Member(this.login,this.avatar_url){
    if (login == null){
      throw new ArgumentError("login of Member cannot be null. "
          "Received: '$login'");
    }
    if (avatar_url == null){
      throw new ArgumentError("login of Member cannot be null. "
          "Received: '$avatar_url'");
    }
  }


}