import 'package:flutter/material.dart';
import 'package:quizapp/Services/api_service.dart';
import 'package:quizapp/models/user_model.dart';
import 'Navigation.dart';
import 'signup_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SingleChildScrollView(

        child: Padding(
          padding: EdgeInsets.all(20),

          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [

                SizedBox(height: 80),

                // 🔹 LOGO
                Icon(
                  Icons.quiz,
                  size: 90,
                  color: Colors.indigo,
                ),

                SizedBox(height: 20),

                Text(
                  "Welcome Back",
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  "Login to continue your quiz journey",
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: 40),

                // 🔹 EMAIL FIELD
                TextFormField(

                  controller: emailController,

                  decoration: InputDecoration(

                    labelText: "Email",

                    prefixIcon: Icon(Icons.email),

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),

                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter email";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20),

                // 🔹 PASSWORD FIELD
                TextFormField(

                  controller: passwordController,

                  obscureText: isPasswordHidden,

                  decoration: InputDecoration(

                    labelText: "Password",

                    prefixIcon: Icon(Icons.lock),

                    suffixIcon: IconButton(

                      icon: Icon(
                        isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),

                      onPressed: () {

                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                    ),

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),

                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter password";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 30),

                // 🔹 LOGIN BUTTON
                ElevatedButton(

                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 18),
                  ),

                    onPressed: () async {

                      User? success = await ApiService.login(
                        emailController.text,
                        passwordController.text,
                      );

                      if (success != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => MainNavigation()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Login Failed")),
                        );
                      }
                    }
                        ),


                SizedBox(height: 20),

                // 🔹 SIGNUP OPTION
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Text("Don't have an account? "),

                    GestureDetector(

                      onTap: () {

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) => SignupScreen(),
                          ),
                        );
                      },

                      child: Text(
                        "Sign Up",

                        style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}