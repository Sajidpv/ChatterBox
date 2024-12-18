class UserModel {
  int? id;
  String? email;
  String? password;
  String? name;
  String? lastMessage;
  String? image;
  String? time;
  bool? isActive;

  UserModel(
      {this.id,
      this.email,
      this.password,
      this.name,
      this.lastMessage,
      this.image,
      this.time,
      this.isActive});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    lastMessage = json['lastMessage'];
    image = json['image'];
    time = json['time'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    data['lastMessage'] = lastMessage;
    data['image'] = image;
    data['time'] = time;
    data['isActive'] = isActive;
    return data;
  }
}
