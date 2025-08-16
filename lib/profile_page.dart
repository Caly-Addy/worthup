import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/woman.jpg"),
            ),
          ),
          SizedBox(height: 7,),
           Center(
             child: Text("Skyler Bradshaw",
             style: TextStyle(fontWeight: FontWeight.w600), 
             ),
           ),
          SizedBox(height: 40,),
          TextButton(onPressed: () {},
           child: Padding(
             padding: const EdgeInsets.only(left: 20.0),
             child: Text("Email",
             style: TextStyle(
              color: Colors.black
             ),
             ),
           ),
           ),
           SizedBox(height: 30),
          TextButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("Edit profile", style: TextStyle(color: Colors.black)),
            ),
          ),
          SizedBox(height: 30),
          TextButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("Favourites", style: TextStyle(color: Colors.black)),
            ),
          ),
           SizedBox(height: 30),
          TextButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("Settings", style: TextStyle(color: Colors.black)),
            ),
          ),
          SizedBox(height: 30),
          TextButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("Log out", style: TextStyle(color: Color.fromARGB(255, 79, 121, 66))),
            ),
          ),
        ],
      ),
    );
  }
}