class EndUser {
  final String userID;
  final String username;
  final int followingCount;

  EndUser({
    this.userID,
    this.username,
    this.followingCount});

  factory EndUser.fromMap(data) {
    return EndUser(
        userID: data['UID'],
        username: data['username'],
        followingCount: data['followingCount']);
  }

  Map<String, dynamic> toMap () {
    return {
      'UID' : userID,
      'username' : username,
      'followingCount' : followingCount,
    };
  }
}
