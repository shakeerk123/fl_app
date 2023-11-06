import 'package:fl_app/widgets/text1.dart';
import 'package:flutter/material.dart';




class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text1(
          text: 'Profile',
          fontSize: 22,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 40,
                      backgroundImage:
                          const AssetImage('assets/images/cinemaven.png'),
                    ),
                    const SizedBox(width: 20),
                    const Text1(
                      text: 'user',
                      fontSize: 25,
                    ),
                  ],
                ),
               
              ],
            ),
          ),
          const Divider(),
         
        ],
      ),
    );
  }
}
