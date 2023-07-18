import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactList extends StatefulWidget {
  final String? searchQuery;
  final Function(Contact) onAddCustomer;

  const ContactList({Key? key, this.searchQuery, required this.onAddCustomer})
      : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<Contact> _contacts = [];
  int _currentPage = 1;
  int _contactsPerPage = 15;
  bool _isLoading = false;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _requestContactsPermission();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _requestContactsPermission() async {
    Map<Permission, PermissionStatus> status = await [
      Permission.contacts,
      Permission.storage,
    ].request();

    if (status[Permission.contacts]!.isGranted) {
      _fetchContacts();
    } else {
      print("Contacts permission denied");
    }
  }

  Future<void> _fetchContacts() async {
    try {
      setState(() {
        _isLoading = true;
      });

      int skip = (_currentPage - 1) * _contactsPerPage;
      Iterable<Contact> contacts = await ContactsService.getContacts(
        query: '',
        withThumbnails: false,
        photoHighResolution: false,
      );

      contacts = contacts.skip(skip).take(_contactsPerPage);

      if (contacts.isNotEmpty) {
        setState(() {
          _contacts.addAll(contacts);
        });
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (!_isLoading) {
        _currentPage++;
        _fetchContacts();
      }
    }
  }

  List<Contact> _getFilteredContacts(String query) {
    return _contacts.where((contact) {
      final displayName = contact.displayName?.toLowerCase() ?? '';
      final searchLower = query.toLowerCase();
      return displayName.contains(searchLower);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Contact> filteredContacts =
        widget.searchQuery != null && widget.searchQuery!.isNotEmpty
            ? _getFilteredContacts(widget.searchQuery!)
            : _contacts;
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: filteredContacts.length + 1,
        itemBuilder: (context, index) {
          if (index == filteredContacts.length) {
            return _isLoading
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : const SizedBox.shrink();
          } else {
            final contact = filteredContacts[index];
            return ListTile(
              title: Text(contact.displayName.toString()),
              onTap: () {},
              trailing: TextButton.icon(
                onPressed: () {
                  // Call the onAddCustomer function when the "Add" button is pressed
                  widget.onAddCustomer(contact);
                },
                icon: const Icon(
                  Icons.add,
                ),
                label: const Text('Add'),
              ),
              leading: const CircleAvatar(
                child: Icon(
                  Icons.person,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
