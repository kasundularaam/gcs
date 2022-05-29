import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gcs/core/components/components.dart';
import 'package:sizer/sizer.dart';

import '../../core/themes/app_colors.dart';
import '../../logic/cubit/auth_cubit/auth_cubit.dart';
import '../router/app_router.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController nicCtrl = TextEditingController();

  TextEditingController codeCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightElv1,
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        children: [
          SizedBox(
            height: 5.h,
          ),
          BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
            log(state.toString());
            if (state is AuthFailed) {
              SnackBar snackBar = SnackBar(content: Text(state.errorMsg));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else if (state is AuthInvalidOTP) {
              SnackBar snackBar = SnackBar(content: Text(state.errorMsg));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else if (state is AuthSucceed) {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRouter.landingPage, (route) => false);
            }
          }, builder: (context, state) {
            if (state is AuthCodeSent) {
              return Column(
                children: [
                  Text(
                    "Verifying your number",
                    style: TextStyle(
                      color: AppColors.darkElv0,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "We have sent an verification SMS to",
                          style: TextStyle(
                              color: AppColors.darkElv0, fontSize: 12.sp),
                        ),
                        TextSpan(
                          text: "\n${state.phone}",
                          style: TextStyle(
                              color: AppColors.darkElv0, fontSize: 12.sp),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => BlocProvider.of<AuthCubit>(context)
                                .changeNumber(),
                          text: "\nChange",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: " if it is wrong",
                          style: TextStyle(
                            color: AppColors.darkElv0,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  inputText(codeCtrl),
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: buttonFilledP(
                        "Ok",
                        () => BlocProvider.of<AuthCubit>(context).verifyOTP(
                            smsCode: codeCtrl.text,
                            verificationId: state.verificationId,
                            phone: state.phone,
                            nic: nicCtrl.text),
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Did not recive an SMS?",
                      style:
                          TextStyle(color: AppColors.darkElv0, fontSize: 10.sp),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    height: 0.1.h,
                    width: 100.w,
                    color: AppColors.darkElv0,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.message_rounded,
                            size: 18.sp,
                            color: AppColors.darkElv0,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            "Resend SMS",
                            style: TextStyle(
                                color: AppColors.darkElv0, fontSize: 12.sp),
                          ),
                        ],
                      ),
                      Text(
                        state.timeLeft,
                        style: TextStyle(
                            color: AppColors.darkElv0, fontSize: 12.sp),
                      ),
                    ],
                  ),
                ],
              );
            } else if (state is AuthLoading || state is AuthInvalidOTP) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            } else if (state is AuthTimeOut) {
              return Column(
                children: [
                  Text(
                    "Verifying your number",
                    style: TextStyle(
                      color: AppColors.darkElv0,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "We have sent an verification SMS to",
                          style: TextStyle(
                              color: AppColors.darkElv0, fontSize: 12.sp),
                        ),
                        TextSpan(
                          text: "\n${state.phone}",
                          style: TextStyle(
                              color: AppColors.darkElv0, fontSize: 12.sp),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => BlocProvider.of<AuthCubit>(context)
                                .changeNumber(),
                          text: "\nChange",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: " if it is wrong",
                          style: TextStyle(
                            color: AppColors.darkElv0,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  inputText(codeCtrl),
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: buttonFilledP(
                        "Ok",
                        () => BlocProvider.of<AuthCubit>(context).verifyOTP(
                            smsCode: codeCtrl.text,
                            verificationId: state.verificationId,
                            phone: state.phone,
                            nic: nicCtrl.text),
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Did not recive SMS?",
                      style:
                          TextStyle(color: AppColors.darkElv0, fontSize: 10.sp),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    height: 0.1.h,
                    width: 100.w,
                    color: AppColors.darkElv0.withOpacity(0.5),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.message_rounded,
                            size: 18.sp,
                            color: AppColors.darkElv0,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            "Resend SMS",
                            style: TextStyle(
                              color: AppColors.darkElv0,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () =>
                            BlocProvider.of<AuthCubit>(context).requestAuth(
                          nic: state.phone,
                        ),
                        child: const Text(
                          "RESEND",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  textP("GCS", 22, bold: true),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Enter your nic",
                    style: TextStyle(
                        color: AppColors.darkElv0,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "We will need to verify your  phone number",
                    style: TextStyle(
                      color: AppColors.darkElv0.withOpacity(0.6),
                      fontSize: 10.sp,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  inputText(nicCtrl),
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: buttonFilledP(
                        "Next",
                        () => BlocProvider.of<AuthCubit>(context)
                            .requestAuth(nic: nicCtrl.text),
                      )),
                ],
              );
            }
          }),
        ],
      )),
    );
  }
}
