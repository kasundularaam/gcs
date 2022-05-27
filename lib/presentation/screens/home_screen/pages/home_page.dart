import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gcs/data/models/person.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/components/components.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../logic/cubit/home_page_cubit/home_page_cubit.dart';
import '../../../../logic/cubit/sign_out_cubit/sign_out_cubit.dart';
import '../widgets/loading_view.dart';
import '../widgets/page_template.dart';
import '../widgets/sign_out_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomePageCubit>(context).loadHomePage();
    return BlocConsumer<HomePageCubit, HomePageState>(
      listener: (context, state) {
        if (state is HomePageFailed) {
          showSnackBar(context, state.errorMsg);
        }
      },
      builder: (context, state) {
        if (state is HomePageLoading) {
          return const LoadingView(title: "Home");
        }
        if (state is HomePageLoaded) {
          final Person person = state.person;
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                child: Row(
                  children: [
                    Expanded(child: textL("Home", 18, bold: true)),
                    hSpacer(3),
                    InkWell(
                      onTap: () => showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(5.w),
                          ),
                        ),
                        backgroundColor: Colors.white,
                        builder: (sheetContext) {
                          return BlocProvider(
                              create: (context) => SignOutCubit(),
                              child: SignOutView(
                                person: state.person,
                              ));
                        },
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          Strings.profileImg,
                          width: 10.w,
                          height: 10.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(5.w)),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.lightElv1,
                    ),
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      physics: const BouncingScrollPhysics(),
                      children: [
                        vSpacer(3),
                        textD("Personal Details", 16, bold: true),
                        vSpacer(2),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(3.w),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    textD("First name: ", 14, bold: true),
                                    Expanded(
                                        child: textD(person.firstName, 14)),
                                  ],
                                ),
                                vSpacer(2),
                                Row(
                                  children: [
                                    textD("Last name: ", 14, bold: true),
                                    Expanded(child: textD(person.lastName, 14)),
                                  ],
                                ),
                                vSpacer(2),
                                Row(
                                  children: [
                                    textD("Date of birth: ", 14, bold: true),
                                    Expanded(child: textD(person.dob, 14)),
                                  ],
                                ),
                                vSpacer(2),
                                Row(
                                  children: [
                                    textD("Gender: ", 14, bold: true),
                                    Expanded(child: textD(person.gender, 14)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }
        return PageTemplate(title: "Home", child: Center(child: nothing));
      },
    );
  }
}
