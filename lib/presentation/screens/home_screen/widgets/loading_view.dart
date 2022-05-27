import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/components/components.dart';
import '../../../../core/themes/app_colors.dart';

class LoadingView extends StatelessWidget {
  final String title;
  const LoadingView({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Row(
            children: [
              Expanded(child: textL(title, 18, bold: true)),
            ],
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(5.w)),
            child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.lightElv1,
                ),
                child: Center(child: viewSpinner())),
          ),
        )
      ],
    );
  }
}
