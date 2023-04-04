class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String? profilePhoto;
  final String? phoneNumber;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.profilePhoto,
    this.phoneNumber,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map["id"],
      name: map["name"],
      username: map["username"],
      email: map["email"],
      profilePhoto: map["profile_photo"],
      phoneNumber: map["phone_number"],
    );
  }

  factory User.dummy() {
    return User(
      id: 001,
      name: "Ade Iskandar Zulkarnaen",
      username: "azul",
      email: "adeiskandarzulkarnaen@gmail.com",
      profilePhoto:
          "https://avatars.githubusercontent.com/u/90956034?s=400&u=a23a7893533056ba50657f33016b32e2209f15b0&v=4",
      phoneNumber: "085123456789",
    );
  }
}
