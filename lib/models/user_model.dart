class User {
  final String name;
  final String email;
  final String phone;
  final String thumb;
  final String picture;
  final String nation;

  User({
    this.name,
    this.email,
    this.phone,
    this.thumb,
    this.picture,
    this.nation,
  });

  factory User.fromMap(Map<String, dynamic> user) {
    return User(
      name: '${user['name']['first']} ${user['name']['last']}',
      email: user['email'],
      phone: user['phone'],
      thumb: user['picture']['medium'],
      picture: user['picture']['large'],
      nation: user['nat'],
    );
  }
}
