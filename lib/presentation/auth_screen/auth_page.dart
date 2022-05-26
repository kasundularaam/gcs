import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../core/themes/app_colors.dart';
import '../../logic/cubit/auth_cubit/auth_cubit.dart';
import '../../logic/cubit/auth_submit_nic_cubit/auth_submit_nic_cubit.dart';
import '../../logic/cubit/auth_submit_otp_cubit/auth_submit_otp_cubit.dart';
import 'views/auth_init_view.dart';
import 'views/otp_sent_view.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightElv1,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Center(
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is AuthOtpSent) {
                    return BlocProvider(
                      create: (context) => AuthSubmitOtpCubit(),
                      child: OtpSentView(
                        phone: state.phone,
                      ),
                    );
                  }
                  return BlocProvider(
                    create: (context) => AuthSubmitNicCubit(),
                    child: const AuthInitView(),
                  );
                },
              ),
            )),
      ),
    );
  }
}
