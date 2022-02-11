import 'dart:convert';

class ThisUser {
  String? uid;
  String? token;
  ThisUser({
    this.uid,
    this.token,
  });

  ThisUser copyWith({
    String? uid,
    String? token,
  }) {
    return ThisUser(
      uid: uid ?? this.uid,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'token': token,
    };
  }

  factory ThisUser.fromMap(Map<String, dynamic> map) {
    return ThisUser(
      uid: map['uid'],
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ThisUser.fromJson(String source) => ThisUser.fromMap(json.decode(source));

  @override
  String toString() => 'ThisUser(uid: $uid, token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ThisUser &&
      other.uid == uid &&
      other.token == token;
  }

  @override
  int get hashCode => uid.hashCode ^ token.hashCode;
}
