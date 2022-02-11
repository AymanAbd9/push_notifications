import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class GeneralUser extends ChangeNotifier {
  String uid;
  String token;
  GeneralUser({
    required this.uid,
    required this.token,
  });
  

  GeneralUser copyWith({
    String? uid,
    String? token,
  }) {
    return GeneralUser(
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

  factory GeneralUser.fromMap(Map<String, dynamic> map) {
    return GeneralUser(
      uid: map['uid'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GeneralUser.fromJson(String source) => GeneralUser.fromMap(json.decode(source));

  @override
  String toString() => 'GeneralUser(uid: $uid, token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is GeneralUser &&
      other.uid == uid &&
      other.token == token;
  }

  @override
  int get hashCode => uid.hashCode ^ token.hashCode;
}
