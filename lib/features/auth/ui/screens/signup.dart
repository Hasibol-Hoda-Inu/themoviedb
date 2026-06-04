import 'package:flutter/material.dart';

import '../../../../auth_service.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Text("SignUp"),
            Text("data"),
            Form(
              key: _formKey,
              child: Column(
                children: [TextFormField(), TextFormField(), TextFormField()],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: _signUp,
                  child: Text("Sign Up"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void>_signUp()async{
    try{
      final user = await _auth.signUp(_email.text, _pass.text);
      if(user != null) {
        debugPrint("✅ Signed up success");
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }
}
