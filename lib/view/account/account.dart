import 'package:digitalsalt_assignment/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:digitalsalt_assignment/view/auth_screen/login_page.dart'; 

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final AuthViewModel _authViewModel = Get.find<AuthViewModel>(); 

// firebase signOut 
Future<void> _logout() async {
    try {
      await _authViewModel.signOut();
      Get.offAll(() => const LogInPage()); 
    } catch (e) {
      Get.snackbar('Error', 'Logout failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Account"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout, 
          ),
        ],
      ),
      body: const Center(
        child: Text("Coming Soon"),
      ),
    );
  }
}
