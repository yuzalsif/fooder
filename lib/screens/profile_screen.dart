import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fooderlich/components/circular_image.dart';
import 'package:fooderlich/models/models.dart';
import 'package:fooderlich/navigation/app_navigation.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<AppStateManager>(context, listen: false);
    final navigation = Provider.of<AppNavigation>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildProfile(),
              buildMenu(manager, navigation),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfile() {
    return Column(
      children: const [
        CircularImage(
          imageProvider: AssetImage('assets/profile_pics/person_stef.jpeg'),
          imageRadius: 60,
        ),
        SizedBox(height: 16.0),
        Text(
          'Stefania',
          style: TextStyle(fontSize: 21),
        ),
        Text(
          'Pythonista',
        ),
        Text(
          '100 points',
          style: TextStyle(fontSize: 30, color: Colors.green),
        ),
      ],
    );
  }

  Widget buildDarkMode(AppStateManager manager) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Dark Mode'),
          Switch(
              value: manager.darkMode,
              onChanged: (bool newValue) {
                setState(() {
                  manager.darkMode = newValue;
                });
              }),
        ],
      ),
    );
  }

  Widget buildMenu(AppStateManager manager, AppNavigation navigation) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildDarkMode(manager),
          ListTile(
            title: const Text('View Raywenderlich.com'),
            trailing: const Icon(FontAwesomeIcons.book),
            onTap: () async {
              if (kIsWeb) {
                await launchUrl(
                  Uri.parse('https://www.raywenderlich.com/'),
                );
              } else {
                navigation.router.goNamed('raywenderlich');
              }
            },
          ),
          ListTile(
            title: const Text('Log Out'),
            trailing: const Icon(Icons.logout_outlined),
            onTap: () {
              manager.logout();
            },
          ),
        ],
      ),
    );
  }
}
