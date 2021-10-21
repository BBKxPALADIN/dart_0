import 'package:flutter/material.dart';

class ProfileConst {
  final fullName;
  final email;
  final phone;
  final image;

  ProfileConst(
    this.fullName,
    this.email,
    this.phone,
    this.image,
  );

  String getName() => fullName;

  String getEmail() => email;

  String getPhone() => phone;

  AssetImage getImage() => image;
}
