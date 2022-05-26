import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/components/components.dart';
import '../../../logic/cubit/auth_cubit/auth_cubit.dart';
import '../../../logic/cubit/auth_submit_nic_cubit/auth_submit_nic_cubit.dart';

class AuthInitView extends StatefulWidget {
  const AuthInitView({Key? key}) : super(key: key);

  @override
  State<AuthInitView> createState() => _AuthInitViewState();
}

class _AuthInitViewState extends State<AuthInitView> {
  final TextEditingController nicCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            textP("Sign In", 18, bold: true),
            vSpacer(5),
            inputText(nicCtrl, hint: "Nic number"),
            vSpacer(5),
            BlocConsumer<AuthSubmitNicCubit, AuthSubmitNicState>(
              listener: (context, state) {
                if (state is AuthSubmitNicFailed) {
                  showSnackBar(context, state.errorMsg);
                }
                if (state is AuthSubmitNicSucceed) {
                  BlocProvider.of<AuthCubit>(context)
                      .otpSent(phone: state.phone);
                }
              },
              builder: (context, state) {
                if (state is AuthSubmitNicLoading) return viewSpinner();
                return buttonFilledP(
                    "get OTP",
                    () => BlocProvider.of<AuthSubmitNicCubit>(context)
                        .submit(nic: nicCtrl.text));
              },
            )
          ],
        ),
      ),
    );
  }
}
