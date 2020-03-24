import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  void _onEmailChanged() {}

  void _onPasswordChanged() {}

  void _onFormSubmitted() {}

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: Form(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text('WELCOME',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          fontFamily: 'Poppins-Bold')),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Image.asset(
                    'assets/images/image_login.png',
                    width: 235,
                    height: 249,
                  )),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                      labelText: 'Username',
                    ),
                    controller: _emailController,
                  ),
                  width: 315,
                  height: 35,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  width: 315,
                  height: 35,
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "enter";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _isHidePassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _togglePasswordVisibility();
                        },
                        child: Icon(
                          _isHidePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: _isHidePassword ? Colors.grey : Colors.grey,
                        ),
                      ),
                      labelText: 'Password',
                    ),
                    controller: _passwordController,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  width: 315,
                  height: 35,
                  child: RaisedButton(
                      color: Colors.purple,
                      elevation: 2,
                      textColor: Colors.white,
                      child: Text('LOGIN'),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      onPressed: _onFormSubmitted),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
