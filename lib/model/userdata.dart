
class User{
  String _name,_email,_about,_profile,_pwd;

  //Getter
  String get name=>this._name;
  String get email=>this._email;
  String get about=>this._about;
  String get pwd=>this._pwd;
  String get profile=>this._profile;

  User(this._name,this._email,this._pwd,this._about,this._profile);

  json(User data){
    return {
      'name':data.name,
      'email':data.email,
      'about':data.about,
      'profile':data.profile,
    };
  }

}