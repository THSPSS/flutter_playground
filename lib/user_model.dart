// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_model.g.dart';

@immutable
class User {
  final String name;
  final String email;

  const User({
    required this.name,
    required this.email,
  });

  User copyWith({
    String? name,
    String? email,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name, email: $email)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}

//update user model
class UserNotifier extends StateNotifier<User> {
  //constructor
  UserNotifier() : super(const User(name: '', email: ''));

  void updateName(String value) {
    state = state.copyWith(name: value);
  }

  void updateEmail(String value) {
    state = state.copyWith(email: value);
  }
}

class UserNotifierChange extends ChangeNotifier {
  User user = const User(name: '', email: '');

  void updateName(String value) {
    user = user.copyWith(name: value);
    notifyListeners();
  }

  void updateEmail(String value) {
    user = user.copyWith(email: value);
    notifyListeners();
  }
}

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository(ref);
}

// final userRepositoryProvider =
//     Provider.autoDispose((ref) => UserRepository(ref));

class UserRepository {
  //check loading
  // UserRepository() : super(false);
  // final TextEditingController controller = TextEditingController();

  final Ref ref;
  UserRepository(this.ref);
  Future<User> fetchUserData(String input) {
    var url = 'https://jsonplaceholder.typicode.com/users/$input';
    return http.get(Uri.parse(url)).then(
          (value) => User.fromJson(value.body),
        );
  }
}
