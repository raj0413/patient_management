

import 'package:flutter/material.dart';
import 'package:patient_management_app/Button.dart';
import 'package:patient_management_app/homepage.dart';
import 'package:patient_management_app/my_textfield.dart';
import 'package:patient_management_app/register_page.dart';
// import 'package:test/homepage.dart';
// import 'package:test/my_textfield.dart';
// import 'package:test/Button.dart';
// import 'package:test/register_page.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({super.key , });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _pwController = TextEditingController();
     final _formKey = GlobalKey<FormState>();

      String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 
 'Please enter an email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) 
 {
      return 'Please enter a password'; 

    } else if (value.length < 8) { // Minimum password length of 8 characters
      return 'Password must be at least 8 characters long';
    }
    return null;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: const Color.fromARGB(255, 126, 126, 236),
      body: Stack(
        children: [

          // Positioned(
          //     top: 0,
          //     left: 0,
          //     right: 0,
          //     bottom: 0,
          //     child: Image.asset(
          //       "lib/asset/loginbg12.jpg",
          //       fit: BoxFit.cover,
          //     )),
        
          Center(
            child: Form(
                key: _formKey,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //logo
              
                  const Icon(
                    size: 80,
                    Icons.person_3_outlined,
                    color: Color.fromARGB(255, 254, 254, 255),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
              
                  const Text(
                    'Pateint Login >>',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
              
                  const SizedBox(
                    height: 20,
                  ),
              
                  //emailtextfield
              
                  MyTextfield(
                    hintText: 'Email',
                    obscureText: false,
                    controller: _emailController,
                    hintColor: Colors.white,
                    color: Colors.white,
                    validator: _validateEmail,
                  ),
              
                  const SizedBox(
                    height: 8,
                  ),
              
                  //pwtextfield
              
                  MyTextfield(
                    hintText: 'Password',
                    obscureText: true,
                    controller: _pwController,
                    hintColor: Colors.white,
                    color: Colors.white,
                    validator: _validatePassword ,
                  ),
              
                  const SizedBox(
                    height: 30,
                  ),
              
                  // login
                  Button(text: 'Login', onTap: () {
                    if(_formKey.currentState!.validate()){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Homepage()));
          } 
                  }),
              
                  const SizedBox(
                    height: 30,
                  ),
              
                  //register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Not member?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 254, 254, 255),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                        },
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                            color: Color.fromARGB(255, 254, 255, 255),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}