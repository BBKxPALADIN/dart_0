import 'package:flutter/material.dart';
import './models/constants.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  final ProfileConst profile;
  String id;

   Profile({
    Key key,
    this.profile,
    this.id
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile  $id'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/personal_photo.png'),
            maxRadius: 70,
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: Icon(
              Icons.person_outline,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(profile.fullName),
          ),
          const SizedBox(height: 15),
          ListTile(
            leading: Icon(
              Icons.email_outlined,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(profile.email),
          ),
          const SizedBox(height: 15),
          ListTile(
            leading: Icon(
              Icons.phone_outlined,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(profile.phone),
          ),
        ],
      ),
    );
  }
}
