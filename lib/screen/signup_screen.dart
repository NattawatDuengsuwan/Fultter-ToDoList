import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/component/my_botton.dart';
import 'package:onboarding_screen/component/my_textfield.dart';
import 'package:onboarding_screen/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameControllre = TextEditingController();

  final emaillControllre = TextEditingController();

  final PasswordController = TextEditingController();

  final repasswordController = TextEditingController();

  signupWinthEmail() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emaillControllre.text,
        password: PasswordController.text,
      );
     print('Create successfully');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('the password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email');
      }
    } catch (e) {
      print(e);
    }

    // print('Failure : ${er.code}');
    // print(e.message);
  }
  void _showMyDialog(String txtMsg) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: AlertDialog(
              backgroundColor: Colors.amberAccent,
              title: const Text('AlertDialog Title'),
              content: Text(txtMsg),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Ok'))
              ],
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: Column(
        children: [
          const Spacer(),
          Text(
            'Welcome to our community',
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
          Text(
            '\nTo get started, please provide your information to create an accout\n',
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MyTextField(
            controller: nameControllre,
            hintText: 'Enter your name',
            obscureText: false,
            labelText: 'Name',
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextField(
            controller: emaillControllre,
            hintText: 'Enter youe email',
            obscureText: false,
            labelText: 'Email',
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextField(
            controller: PasswordController,
            hintText: "Enter you password",
            obscureText: true,
            labelText: "Password",
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextField(
            controller: repasswordController,
            hintText: "Re-password",
            obscureText: true,
            labelText: "Enter your Password again",
          ),
          const SizedBox(
            height: 20,
          ),
          MyButton(onTap: signupWinthEmail , hinText: 'Sing up'),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 8.0,
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Have a member',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displaySmall,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  width: 1,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign In',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.displaySmall,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      )),
    );
  }
}
