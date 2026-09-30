import 'package:latkuis_mobile_124240085/root.dart';
import 'package:latkuis_mobile_124240085/models/data.dart';
import 'package:flutter/material.dart';

// Widget Class
class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// State Class
class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoggedIn = false;

  void _login({required String username, required String password}) {
    if (username == user1.username && password == user1.password) {
      setState(() {
        _isLoggedIn = true;
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Root(user: user1)),
      );

      // Memanggil snackbar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green, content: Text("Login Berhasil!")));
    } else {
      setState(() {
        _isLoggedIn = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor: Colors.red, content: Text("Login Gagal!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Screen"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                spacing: 10,
                children: [
    
                    Image.asset(
                      'lib/assets/logo.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                    TextField(
                        controller: _usernameController,
                      decoration: InputDecoration(
                          // suffix: Icon(Icons.email),
                          hintText: "Username",
                          border: OutlineInputBorder()),
                    ),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          // suffix: Icon(Icons.email),
                          hintText: "*********",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  _isLoggedIn ? Colors.green : Colors.red),
                          onPressed: () {
                            _login(
                              username: _usernameController.text,
                              password: _passwordController.text,
                            );
                          },
                          child: Text("Login")),
                      ),
                    ],
            ),
          ),
        )
        ),
      );
  }
}
