class UserModel {
  String? fullName;
  String? email;
  String? password;
  String? phoneNumber;
  String? address;
  String? city;
  int? profileProgress;
  String? sId;
  String? id;
  String? updatedOn;
  String? createdOn;
  int? iV;

  UserModel(
      {this.fullName,
        this.email,
        this.password,
        this.phoneNumber,
        this.address,
        this.city,
        this.profileProgress,
        this.sId,
        this.id,
        this.updatedOn,
        this.createdOn,
        this.iV});

  UserModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    city = json['city'];
    profileProgress = json['profileProgress'];
    sId = json['_id'];
    id = json['id'];
    updatedOn = json['updatedOn'];
    createdOn = json['createdOn'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    data['address'] = this.address;
    data['city'] = this.city;
    data['profileProgress'] = this.profileProgress;
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['updatedOn'] = this.updatedOn;
    data['createdOn'] = this.createdOn;
    data['__v'] = this.iV;
    return data;
  }
}
