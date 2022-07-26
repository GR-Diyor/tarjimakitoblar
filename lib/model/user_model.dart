
class Users{
  @override
  int get hashCode => uid.hashCode;

  String uid = "";
  String password = "";
  String img_url = "";
  String fullname = '';
  String email = '';

  String device_id = "";
  String device_type = "";
  String device_token = "";

  Users({required this.fullname, required this.email, required this.password});

  Users.fromJson(Map<String, dynamic> json)
      : uid = json["uid"],
        fullname = json["fullname"],
        email = json["email"],
        password = json["password"],
        img_url = json["img_url"],
        device_id = json["device_id"],
        device_type = json["device_type"],
        device_token = json["device_token"];

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "fullname": fullname,
    "email": email,
    "password": password,
    "img_url": img_url,
    "device_id": device_id,
    "device_type": device_type,
    "device_token": device_token,
  };

  @override
  bool operator ==(other) {
    return (other is Users) && other.uid == uid;
  }


}

