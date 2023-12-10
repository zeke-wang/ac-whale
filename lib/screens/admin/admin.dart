import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => {context.go("/login")}, child: const Text("退出登录"));
  }
}
