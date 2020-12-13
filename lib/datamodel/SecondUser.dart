// class location{
//   final String city;
//   final String address;
//
//   location({this.city, this.address});
//
//   factory location.fromMap(Map data){
//     return location(
//       city: data["city"],
//       address: data["address"]
//     );
//   }
//
//   Map<String, String> toMap(){
//     return {
//       'city': city,
//       'address': address
//     };
//   }
// }

class SecondUser{
  final String userID;
  final String profilePhotoURL;
  final String username;
  final String about;
  final String address;
  final int followerCount;

  SecondUser({
    this.userID,
    this.profilePhotoURL,
    this.username,
    this.about,
    this.address,
    this.followerCount});

  factory SecondUser.fromMap(data) {
    return SecondUser(
        userID: data['UID'],
        profilePhotoURL: data['profilePhotoURL'],
        username: data['username'],
        about: data['about'],
        address: data['address'],
        followerCount: data['followerCount']);
  }

  Map<String, dynamic> toMap () {
    return {
      'UID' : userID,
      'profilePhotoURL' : profilePhotoURL,
      'username' : username,
      'about': about,
      'address': address,
      'followerCount' : followerCount,
    };
  }

}