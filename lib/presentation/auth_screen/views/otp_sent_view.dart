import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gcs/logic/cubit/auth_cubit/auth_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../core/components/components.dart';
import '../../../logic/cubit/auth_submit_otp_cubit/auth_submit_otp_cubit.dart';
import '../../router/app_router.dart';

class OtpSentView extends StatefulWidget {
  final String phone;
  const OtpSentView({
    Key? key,
    required this.phone,
  }) : super(key: key);

  @override
  State<OtpSentView> createState() => _OtpSentViewState();
}

class _OtpSentViewState extends State<OtpSentView> {
  final TextEditingController otpCtrl = TextEditingController();
  String get phone => widget.phone;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            textP("Verify OTP", 18, bold: true),
            vSpacer(2),
            textD("Verification OTP sent to", 12),
            vSpacer(1),
            textD(phone, 12),
            vSpacer(1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => BlocProvider.of<AuthCubit>(context).initial(),
                  child: textP("Change", 12, bold: true),
                ),
                textD(" if wrong", 12),
              ],
            ),
            vSpacer(3),
            inputText(otpCtrl, hint: " * * * * ", align: TextAlign.center),
            vSpacer(5),
            BlocConsumer<AuthSubmitOtpCubit, AuthSubmitOtpState>(
              listener: (context, state) {
                if (state is AuthSubmitOtpFailed) {
                  showSnackBar(context, state.errorMsg);
                }
                if (state is AuthSubmitOtpSucceed) {
                  navAndClear(context, AppRouter.landingPage);
                }
              },
              builder: (context, state) {
                if (state is AuthSubmitOtpLoading) return viewSpinner();
                return buttonFilledP(
                    "Submit",
                    () => BlocProvider.of<AuthSubmitOtpCubit>(context)
                        .submit(otp: otpCtrl.text));
              },
            )
          ],
        ),
      ),
    );
  }
}
