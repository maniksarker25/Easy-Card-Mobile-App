import 'package:flutter/material.dart';
import 'package:my_app/root.dart';
import 'services/auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = ''; // State variable to store email
  String password = ''; // State variable to store password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        color: Colors.grey[200],
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset('assets/images/TopCurve.png'),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Text(
                      "Welcome",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFCCCCCC),
                          blurRadius: 20,
                          spreadRadius: 0,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    width: 350,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              email = value; // Update the email state variable
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: 'Enter your email',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFCCCCCC),
                          blurRadius: 20,
                          spreadRadius: 0,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    width: 350,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              password =
                                  value; // Update the password state variable
                            });
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Enter your password',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const Text("Forget your password?"),
                  ),
                  Container(
                    width: 350,
                    margin: const EdgeInsets.only(top: 30, bottom: 20),
                    child: SizedBox(
                      width: 700,
                      child: ElevatedButton(
                        // onPressed: () {
                        //   print(email);
                        //   print(password);
                        // },
                        onPressed: () {
                          // Navigate to the NewComponent page when the login button is pressed
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyComponent()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF23233C)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(vertical: 15),
                          ),
                        ),
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Center(
                    child: Text.rich(
                      TextSpan(
                        text: 'By continuing you agree to the ',
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Privacy Policy &\nTerms of Service.',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.black,
                              decorationThickness: 1.5,
                            ),
                          ),
                        ],
                      ),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              AuthService().signInWithGoogle();
                            },
                            // onTap: () async {
                            //   // Add your Google button tap logic here
                            //   // This function will be executed when the Google image is tapped.
                            //   String? accessToken =
                            //       await AuthService().signInWithGoogle();
                            //   if (accessToken != null) {
                            //     print(accessToken);
                            //   } else {
                            //     // Handle the case where the user canceled the Google sign-in.
                            //   }
                            // },
                            child: Image.asset('assets/images/google.png'),
                          ),
                          Image.asset('assets/images/facebook.png'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/images/BottomCurv.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
