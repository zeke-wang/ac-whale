import 'package:acwhale/config/sp_keys.dart';
import 'package:acwhale/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _usernameCtl = TextEditingController();
  final _pwdCtl = TextEditingController();

  @override
  void initState() {
    _prefs.then((SharedPreferences prefs) {
      setState(() {
        _usernameCtl.text =
            prefs.getString(SharedPreferencesKeys.userName) ?? "";
      });
    });
    _usernameCtl.addListener(_userNameEtChange);
    _pwdCtl.addListener(_passwordEtChange);
    super.initState();
  }

  @override
  void dispose() {
    _usernameCtl.dispose();
    _pwdCtl.dispose();
    super.dispose();
  }

  // 用户改变输入内容 回调
  void _userNameEtChange() async {
    final SharedPreferences prefs = await _prefs;
    final text = _usernameCtl.text;
    prefs.setString(SharedPreferencesKeys.userName, text);
    LoggerUtil.i(_usernameCtl.text);
  }

  // 用户改变输入内容 回调
  void _passwordEtChange() {
    LoggerUtil.i(_pwdCtl.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _usernameCtl,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _pwdCtl,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // 处理登录逻辑
                context.go("/");
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                // 处理注册逻辑
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
