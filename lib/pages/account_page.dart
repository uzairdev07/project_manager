import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khata_app/widgtes/text_icon.dart';
import 'package:khata_app/widgtes/user_profile.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const UserProfile(),
          const SizedBox(
            height: 8.0,
          ),
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
                  FontAwesomeIcons.businessTime,
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
  }
}
