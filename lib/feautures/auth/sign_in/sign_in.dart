import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plan/constants/variables.dart';
import 'package:plan/feautures/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:sizer/sizer.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool obscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: ListView(
            shrinkWrap: true,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.sp),

              Text(
                'Sign in',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.sp),
              Text(
                'Welcome back! Continue where you left!',
                style: TextStyle(fontSize: 15.sp, color: Colors.black),
              ),
              SizedBox(height: 20.sp),

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
                controller: _emailController,
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
                controller: _passwordController,
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
              BlocConsumer<SignInBloc, SignInState>(
                listener: (context, state) {
                  if (state is SignInSuceess) {
                    context.go('/homescreen');
                  } else if (state is SignInFailure) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                  }
                },

                builder: (BuildContext context, Object? state) {
                  if (state is SignInLoading) {
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
                      if (_emailController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty) {
                        context.read<SignInBloc>().add(
                          NormalSignIn(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please fill in all fields')),
                        );
                      }
                    },
                    child: Text(
                      'SIGN IN',
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
                      'SIGN IN WITH GOOGLE',
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
                      'SIGN IN WITH FACEBOOK',
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
                      text: 'Don\'t have an account?',
                      style: TextStyle(color: Colors.black, fontSize: 15.sp),
                    ),
                    TextSpan(
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              context.go('/sign-up');
                            },
                      text: ' Register',
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
