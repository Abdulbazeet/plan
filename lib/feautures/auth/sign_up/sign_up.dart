import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plan/constants/variables.dart';
import 'package:plan/feautures/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:sizer/sizer.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _nameCotroller = TextEditingController();
  final _emailCotroller = TextEditingController();
  final _passwordCotroller = TextEditingController();
  final _spasswordCotroller = TextEditingController();
  bool obscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.sp),

              Text(
                'Create New Account',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.sp),
              Text(
                'Sign up now and get exclusive features!',
                style: TextStyle(fontSize: 15.sp, color: Colors.black),
              ),
              SizedBox(height: 20.sp),

              //**
              //username
              // */
              Text(
                'Username',
                style: TextStyle(fontSize: 15.sp, color: Colors.black),
              ),
              SizedBox(height: 10.sp),
              TextField(
                controller: _nameCotroller,
                keyboardType: TextInputType.name,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: AppVariables.lightGreen,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.sp),
                    borderSide: BorderSide(color: Colors.black45),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.sp),
                    borderSide: BorderSide(color: Colors.black45),
                  ),
                ),
              ),

              //**
              //email
              // */
              SizedBox(height: 15.sp),
              Text(
                'Email',
                style: TextStyle(fontSize: 15.sp, color: Colors.black),
              ),
              SizedBox(height: 10.sp),
              TextField(
                controller: _emailCotroller,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.mail_outline,
                    color: AppVariables.lightGreen,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.sp),
                    borderSide: BorderSide(color: Colors.black45),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.sp),
                    borderSide: BorderSide(color: Colors.black45),
                  ),
                ),
              ),

              //**
              //password
              // */
              SizedBox(height: 15.sp),
              Text(
                'Password',
                style: TextStyle(fontSize: 15.sp, color: Colors.black),
              ),
              SizedBox(height: 10.sp),
              TextField(
                controller: _passwordCotroller,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                obscureText: obscured,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: AppVariables.lightGreen,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscured = !obscured;
                      });
                    },
                    icon:
                        obscured
                            ? Icon(
                              Icons.visibility_outlined,
                              color: AppVariables.lightGreen,
                            )
                            : Icon(
                              Icons.visibility_off_outlined,
                              color: AppVariables.lightGreen,
                            ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.sp),
                    borderSide: BorderSide(color: Colors.black45),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.sp),
                    borderSide: BorderSide(color: Colors.black45),
                  ),
                ),
              ),

              //**
              //confirm password
              // */
              SizedBox(height: 15.sp),
              Text(
                'Confirm password',
                style: TextStyle(fontSize: 15.sp, color: Colors.black),
              ),
              SizedBox(height: 10.sp),
              TextField(
                controller: _spasswordCotroller,
                //  keyboardType: TextInputType.name,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                obscureText: obscured,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: AppVariables.lightGreen,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscured = !obscured;
                      });
                    },
                    icon:
                        obscured
                            ? Icon(
                              Icons.visibility_outlined,
                              color: AppVariables.lightGreen,
                            )
                            : Icon(
                              Icons.visibility_off_outlined,
                              color: AppVariables.lightGreen,
                            ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.sp),
                    borderSide: BorderSide(color: Colors.black45),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.sp),
                    borderSide: BorderSide(color: Colors.black45),
                  ),
                ),
              ),

              //**
              //sign up botton
              // */
              SizedBox(height: 20.sp),
              BlocConsumer<SignUpBloc, SignUpState>(
                listener: (context, state) {
                  if (state is SignUpSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Sign up successful')),
                    );
                    context.go('/sign-in');
                  } else if (state is SignUpFailure) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                  }
                },
                builder: (context, state) {
                  if (state is SignUpLoading) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppVariables.lightGreen.withValues(
                          alpha: .05,
                        ),
                        fixedSize: Size(100.w, 30.sp),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                      ),
                      onPressed: () {},
                      child: CircularProgressIndicator.adaptive(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppVariables.lightGreen,
                        ),
                      ),
                    );
                  }

                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppVariables.lightGreen,
                      fixedSize: Size(100.w, 30.sp),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                    onPressed: () {
                      if (_nameCotroller.text.isEmpty ||
                          _emailCotroller.text.isEmpty ||
                          _passwordCotroller.text.isEmpty ||
                          _spasswordCotroller.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please fill in all fields')),
                        );
                        return;
                      }

                      if (_passwordCotroller.text != _spasswordCotroller.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Passwords do not match')),
                        );
                        return;
                      }

                      context.read<SignUpBloc>().add(
                        NormalSignUp(
                          email: _emailCotroller.text,
                          password: _passwordCotroller.text,
                          username: _nameCotroller.text,
                        ),
                      );
                      SignUpSuccess();
                    },
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),

              //**
              //divider
              // */
              SizedBox(height: 20.sp),
              Row(
                children: [
                  Expanded(child: Divider()),
                  SizedBox(width: 10.sp),
                  Text('OR'),
                  SizedBox(width: 10.sp),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 20.sp),

              //**
              //google signin button
              // */
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.black45, width: .5),
                  //    backgroundColor: AppVariables.lightGreen,
                  fixedSize: Size(100.w, 30.sp),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/google.png', height: 20.sp),
                    SizedBox(width: 15.sp),
                    Text(
                      'SIGN UP WITH GOOGLE',
                      style: TextStyle(color: Colors.black, fontSize: 15.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.sp),

              //**
              //sign up with facebook
              // */
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.black45, width: .5),
                  //    backgroundColor: AppVariables.lightGreen,
                  fixedSize: Size(100.w, 30.sp),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/facebok.jpg', height: 25.sp),
                    SizedBox(width: 15.sp),
                    Text(
                      'SIGN UP WITH FACEBOOK',
                      style: TextStyle(color: Colors.black, fontSize: 15.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.sp),

              //**
              //signin option
              // */
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Already have an account?',
                      style: TextStyle(color: Colors.black, fontSize: 15.sp),
                    ),
                    TextSpan(
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              context.go('/sign-in');
                            },
                      text: ' Sign in',
                      style: TextStyle(
                        color: AppVariables.lightGreen,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.sp),
            ],
          ),
        ),
      ),
    );
  }
}
