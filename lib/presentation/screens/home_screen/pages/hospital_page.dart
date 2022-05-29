import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/components/components.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../data/models/hospital.dart';
import '../../../../data/models/recent_hospital.dart';
import '../../../../logic/cubit/hospital_page_cubit/hospital_page_cubit.dart';
import '../widgets/loading_view.dart';
import '../widgets/page_template.dart';

class HospitalPage extends StatefulWidget {
  const HospitalPage({Key? key}) : super(key: key);

  @override
  State<HospitalPage> createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HospitalPageCubit>(context).loadHospital();
    return BlocConsumer<HospitalPageCubit, HospitalPageState>(
      listener: (context, state) {
        if (state is HospitalPageFailed) {
          showSnackBar(context, state.errorMsg);
        }
      },
      builder: (context, state) {
        if (state is HospitalPageLoading) {
          return const LoadingView(title: "Hospital Details");
        }
        if (state is HospitalPageLoaded) {
          final Hospital hospital = state.hospital;
          final List<RecentHospital> recenthospitals = state.recentHospitals;
          return PageTemplate(
            title: "Hospital Details",
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              children: [
                vSpacer(3),
                textD("Hospital Detail Report", 16, bold: true),
                vSpacer(2),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(3.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            textD("First name: ", 14, bold: true),
                            Expanded(child: textD(hospital.firstName, 14)),
                          ],
                        ),
                        vSpacer(2),
                        Row(
                          children: [
                            textD("Last name: ", 14, bold: true),
                            Expanded(child: textD(hospital.lastName, 14)),
                          ],
                        ),
                        vSpacer(2),
                        Row(
                          children: [
                            textD("Date of birth: ", 14, bold: true),
                            Expanded(child: textD(hospital.dob.toString(), 14)),
                          ],
                        ),
                        vSpacer(2),
                        Row(children: [
                          textD("Gender: ", 14, bold: true),
                          Expanded(child: textD(hospital.gender, 14)),
                        ]),
                        vSpacer(2),
                        Row(
                          children: [
                            textD("Blood group: ", 14, bold: true),
                            Expanded(child: textD(hospital.bloodGroup, 14)),
                          ],
                        ),
                        vSpacer(2),
                        Row(
                          children: [
                            Column(
                              children: [
                                textD("Long term illnesses: ", 14, bold: true),
                              ],
                            ),
                          ],
                        ),
                        vSpacer(1),
                        SizedBox(
                          height: 6.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: hospital.longTermIlnesses.length,
                            itemBuilder: (context, index) => hospital
                                        .longTermIlnesses[index] !=
                                    null
                                ? Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 0.5.w),
                                    child: Chip(
                                      backgroundColor: AppColors.primaryColor,
                                      label: textL(
                                        hospital.longTermIlnesses[index],
                                        12,
                                      ),
                                    ),
                                  )
                                : nothing,
                          ),
                        ),
                        vSpacer(2),
                        Row(
                          children: [
                            Column(
                              children: [
                                textD("Infectious viral deceases: ", 14,
                                    bold: true),
                              ],
                            ),
                          ],
                        ),
                        vSpacer(1),
                        SizedBox(
                          height: 6.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: hospital.infectipusViraldeseases.length,
                            itemBuilder: (context, index) => hospital
                                        .infectipusViraldeseases[index] !=
                                    null
                                ? Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 0.5.w),
                                    child: Chip(
                                      backgroundColor: AppColors.primaryColor,
                                      label: textL(
                                        hospital.infectipusViraldeseases[index],
                                        12,
                                      ),
                                    ),
                                  )
                                : nothing,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                vSpacer(3),
                textD("Recent hospitals", 16, bold: true),
                vSpacer(2),
                ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: recenthospitals.length,
                    itemBuilder: (context, index) {
                      RecentHospital recentHospital =
                          state.recentHospitals[index];
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(3.w),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textD("Hospital name: ", 14, bold: true),
                                  Expanded(
                                      child: textD(
                                          recentHospital.hospitalName, 14)),
                                ],
                              ),
                              vSpacer(1),
                              Row(
                                children: [
                                  textD("Sector: ", 14, bold: true),
                                  Expanded(
                                      child: textD(recentHospital.sector, 14)),
                                ],
                              ),
                              vSpacer(1),
                              Row(
                                children: [
                                  textD("Updated: ", 14, bold: true),
                                  Expanded(
                                      child: textD(
                                          recentHospital.lastUpdatedDate, 14)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          );
        }
        return PageTemplate(
            title: "Hospital Details", child: Center(child: nothing));
      },
    );
  }
}
