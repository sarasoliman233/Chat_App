import 'package:chat_app/constants.dart';
import 'package:chat_app/screens/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/showSnackBar.dart';
import '../widgets/appButton.dart';
import '../widgets/appText.dart';
import '../widgets/appTextField.dart';

class SignUpScreen extends StatefulWidget {
   SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
 String? email;
 String? password;
 bool isLoading =false;

 GlobalKey<FormState> formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,

      child: Scaffold(
        backgroundColor: Colors.white,
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

                appText(text: 'Register', fontSize: 22, color: Color(0xFF000000), fontFamily: 'circular', fontWeight: FontWeight.w600, textAlign: TextAlign.start, ),
                SizedBox(height: 22,),
                AppTextFormField(
                  errorMessage: "Email is Required",
                  onChanged: (data){
                    email=data;
                  },
                  hintText: 'Email',),
                SizedBox(height: 15,),
                AppTextFormField(
                  errorMessage: "Password is Required",
                  onChanged: (data){
                    password=data;
                  },
                  hintText: 'Password',),

            //    AppTextField(hintText: 'Confirm Password',),
                SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    appText(text: 'Already have an account ', fontSize: 14, color: Colors.black, fontFamily: 'caros', fontWeight: FontWeight.w500, ),
                    GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: appText(text: 'LogIn', fontSize: 16, color: kPrimaryColor, fontFamily: 'caros', fontWeight: FontWeight.w600))
                  ],
                ),
                SizedBox(height: 45,),
                AppButton(
                  onTap: () async{
                   if (formKey.currentState!.validate()) {
                     isLoading=true;
                     setState(() {

                     });
                     try {
                       await registerUser();
                       showSnackBar(context,'Email Created');
                       Navigator.pushNamed(context, 'LoginScreen');
                     }on FirebaseAuthException catch (e) {
                       if (e.code == 'weak-password') {
                         showSnackBar(context,'Weak Password');
                       } else if (e.code == 'email-already-in-use') {
                         showSnackBar(context,'Email Already use');
                       }
                     }catch (e){
                       showSnackBar(context,'There was an error');
                     }
                     isLoading=false;
                     setState(() {

                     });

                   }
                  },
                  text: 'Register',),


              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> registerUser() async {
     UserCredential user= await FirebaseAuth.instance.createUserWithEmailAndPassword (
         email: email!, password: password!);
  }
}

