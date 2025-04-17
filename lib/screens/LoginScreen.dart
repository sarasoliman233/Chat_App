import 'package:chat_app/constants.dart';
import 'package:chat_app/screens/SignUpScreen.dart';
import 'package:chat_app/widgets/appText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/showSnackBar.dart';
import '../widgets/appButton.dart';
import '../widgets/appTextField.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading =false;
  String? email;
  String? password;
   GlobalKey<FormState> formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 16),
          child: Form(
            key: formKey,
            child: ListView(
              children: [

                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 65),
                      child: Image.asset('assets/images/chatLogo.png', width: 120, height: 100),
                    )),

                appText(text: 'Login In', fontSize: 22, color: Color(0xFF000000), fontFamily: 'circular', fontWeight: FontWeight.w600, textAlign: TextAlign.start, ),
                SizedBox(height: 22,),
                AppTextFormField(
                  onChanged: (data){
                    email=data;
                  },
                  errorMessage: 'Email is required',
                  hintText: 'Enter Email',),
                SizedBox(height: 15,),
                AppTextFormField(
                  obscureText: true,
                  onChanged: (data){
                    password=data;
                  },
                  errorMessage: 'Password is required',
                  hintText: 'Enter Password',),
                SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    appText(text: 'Don`t have an account? ', fontSize: 14, color: Colors.black, fontFamily: 'caros', fontWeight: FontWeight.w500, ),
                    GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, 'SignUpScreen');
                        },
                        child: appText(text: 'Register', fontSize: 16, color: kPrimaryColor, fontFamily: 'caros', fontWeight: FontWeight.w600))
                  ],
                ),
                SizedBox(height: 50,),
                AppButton(
                  onTap: () async{
                    if (formKey.currentState!.validate()) {
                      isLoading=true;
                      setState(() {

                      });
                      try {
                        await loginUser();
                        showSnackBar(context,'Success');
                        Navigator.pushNamed(
                            context, 'ChatScreen',
                            arguments: email
                        );
                      }on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(context,'User not found');
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context,'Wrong Password');
                        }else{
                          showSnackBar(context,'Authentication error');
                        }
                      }catch (e){
                        showSnackBar(context,'There was an error');
                      }
                      isLoading=false;
                      setState(() {

                      });

                    }
                  },
                  text: 'Login',),


              ],
            ),
          ),
        ),
      ),
    );
  }



   Future<void> loginUser() async {
     UserCredential user= await FirebaseAuth.instance.signInWithEmailAndPassword (
         email: email!, password: password!);
   }
}

