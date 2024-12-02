import 'package:flutter/material.dart';
import 'examples.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final String defaultEmail = "a";
  final String defaultPassword = "1";

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Đăng nhập'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Builder(
          builder: (BuildContext innerContext) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Trường Email
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // Trường Mật khẩu
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Mật khẩu',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập mật khẩu';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  // Nút Đăng nhập
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (emailController.text == defaultEmail &&
                            passwordController.text == defaultPassword) {
                          // Đăng nhập thành công
                          ScaffoldMessenger.of(innerContext).showSnackBar(
                            const SnackBar(content: Text('Đăng nhập thành công!')),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => BottomNavigationBarExample()),
                          );
                        } else {
                          // Đăng nhập thất bại
                          ScaffoldMessenger.of(innerContext).showSnackBar(
                            const SnackBar(content: Text('Email hoặc mật khẩu không đúng')),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      'Đăng nhập',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

