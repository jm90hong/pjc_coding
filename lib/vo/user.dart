

class User {

  int userIdx;
  String id;
  String pw;
  String nickname;
  String address;
  String interSubject;
  String createdDate;


  User({
    this.userIdx=0,
    this.id='',
    this.pw='',
    this.nickname='',
    this.address='',
    this.interSubject='',
    this.createdDate=''
  });


  factory User.fromJson(Map<String, dynamic> map){
    return User(
      userIdx: map['user_idx'],
      id: map['id'],
      pw: map['pw'],
      nickname: map['nickname'],
      address: map['address'],
      interSubject: map['inter_subject'],
      createdDate: map['created_date']
    );
  }

}