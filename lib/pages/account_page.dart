import 'package:flutter/material.dart';
import 'package:khata_app/widgtes/text_icon.dart';
import 'package:khata_app/widgtes/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Future<SharedPreferences>? _prefsFuture;

  @override
  void initState() {
    super.initState();
    _prefsFuture = SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: _prefsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        final String userName = snapshot.data?.getString('userName') ?? '';
        final String userEmail = snapshot.data?.getString('userEmail') ?? '';
        final String userImage =
            snapshot.data?.getString('userProfilePic') ?? '';

        return SingleChildScrollView(
          child: Column(
            children: [
              UserProfile(
                userName: userName,
                userEmail: userEmail,
                userImage: userImage,
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextIcon(
                    title: const Text('Visiting cards'),
                    icon: const Icon(
                      Icons.credit_card,
                      color: Colors.orange,
                    ),
                  ),
                  TextIcon(
                    title: const Text('Wasooli'),
                    icon: const Icon(
                      Icons.money_outlined,
                      color: Colors.blue,
                    ),
                  ),
                  TextIcon(
                    title: const Text('Cashbook'),
                    icon: const Icon(
                      Icons.book_sharp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const ExpansionTile(
                title: Text('Business Information'),
                leading: Icon(
                  Icons.store_outlined,
                  color: Colors.grey,
                ),
                children: [
                  ListTile(
                    title: Text('Business Name'),
                    leading: Icon(
                      Icons.storefront_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(
                    title: Text('Business Type'),
                    leading: Icon(
                      Icons.add_business_sharp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const ExpansionTile(
                title: Text('App Settings'),
                leading: Icon(
                  Icons.settings_outlined,
                  color: Colors.grey,
                ),
                children: [
                  ListTile(
                    title: Text('Backup Information'),
                    leading: Icon(
                      Icons.backup_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(
                    title: Text('App Lock'),
                    leading: Icon(
                      Icons.lock_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(
                    title: Text('Privacy and Policy'),
                    leading: Icon(
                      Icons.privacy_tip_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const ListTile(
                title: Text('Deleted Items'),
                leading: Icon(
                  Icons.auto_delete_outlined,
                  color: Colors.grey,
                ),
              ),
              const ListTile(
                title: Text('Share it'),
                leading: Icon(
                  Icons.share_outlined,
                  color: Colors.grey,
                ),
              ),
              const ListTile(
                title: Text('Rate this app'),
                leading: Icon(
                  Icons.star_rate_outlined,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
