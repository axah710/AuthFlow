import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_auth_system/features/auth/data/firestore_service.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final FirestoreService _firestoreService = FirestoreService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  String? _selectedUserId;
  String? _selectedUserEmail;
  String? _selectedUserRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard'),),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: _firestoreService.usersCollection.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return const CircularProgressIndicator();
                var users = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    var user = users[index];
                    return ListTile(
                      title: Text(user['email']),
                      subtitle: Text(user['role']),
                      onTap: () {
                        setState(() {
                          _selectedUserId = user.id;
                          _selectedUserEmail = user['email'];
                          _selectedUserRole = user['role'];
                          _emailController.text = _selectedUserEmail!;
                          _roleController.text = _selectedUserRole!;
                        });
                      },
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () async {
                              await _firestoreService.deleteUser(
                                  user.id, context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          _userForm(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _selectedUserId = null;
            _emailController.clear();
            _roleController.clear();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _userForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: _roleController,
            decoration: const InputDecoration(labelText: 'Role'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () async {
                  if (_emailController.text.isNotEmpty &&
                      _roleController.text.isNotEmpty) {
                    if (_selectedUserId == null) {
                      // Create new user
                      String uid = _firestoreService.usersCollection.doc().id;
                      await _firestoreService.createUser(
                          uid, _emailController.text, _roleController.text);
                    } else {
                      // Update existing user
                      await _firestoreService.updateUser(_selectedUserId!, {
                        'email': _emailController.text,
                        'role': _roleController.text,
                      });
                    }
                    setState(() {
                      _selectedUserId = null;
                      _emailController.clear();
                      _roleController.clear();
                    });
                  }
                },
                child: Text(_selectedUserId == null ? 'Create' : 'Update'),
              ),
              if (_selectedUserId != null)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedUserId = null;
                      _emailController.clear();
                      _roleController.clear();
                    });
                  },
                  child: const Text('Cancel'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
