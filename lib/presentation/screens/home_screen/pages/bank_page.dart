import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/components/components.dart';
import '../../../../data/models/bank_person.dart';
import '../../../../data/models/recent_bank.dart';
import '../../../../logic/cubit/bank_page_cubit/bank_page_cubit.dart';
import '../widgets/loading_view.dart';
import '../widgets/page_template.dart';

class BankPage extends StatefulWidget {
  const BankPage({Key? key}) : super(key: key);

  @override
  State<BankPage> createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BankPageCubit>(context).loadBankPage();
    return BlocConsumer<BankPageCubit, BankPageState>(
      listener: (context, state) {
        if (state is BankPageFailed) {
          showSnackBar(context, state.errorMsg);
        }
      },
      builder: (context, state) {
        if (state is BankPageLoading) {
          return const LoadingView(title: "Bank Details");
        }
        if (state is BankPageLoaded) {
          final Bank bank = state.bank;
          final List<RecentBank> recentBanks = state.recentBanks;
          return PageTemplate(
              title: "Bank Details",
              child: Center(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  children: [
                    vSpacer(3),
                    textD("Bank Detail Report", 16, bold: true),
                    vSpacer(2),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(3.w),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                textD("First name: ", 14, bold: true),
                                Expanded(child: textD(bank.firstName, 14)),
                              ],
                            ),
                            vSpacer(2),
                            Row(
                              children: [
                                textD("Last name: ", 14, bold: true),
                                Expanded(child: textD(bank.lasttName, 14)),
                              ],
                            ),
                            vSpacer(2),
                            Row(
                              children: [
                                textD("Date of birth: ", 14, bold: true),
                                Expanded(child: textD(bank.dob.toString(), 14)),
                              ],
                            ),
                            vSpacer(2),
                            Row(children: [
                              textD("Gender: ", 14, bold: true),
                              Expanded(child: textD(bank.gender, 14)),
                            ]),
                            vSpacer(2),
                            Row(
                              children: [
                                textD("Permanent Address: ", 14, bold: true),
                                Expanded(
                                    child: textD(bank.permenentAddres, 14)),
                              ],
                            ),
                            vSpacer(2),
                            Row(
                              children: [
                                textD("Exiting number of loans: ", 14,
                                    bold: true),
                                Expanded(
                                    child: textD(
                                        bank.existingNumberOfLoans.toString(),
                                        14)),
                              ],
                            ),
                            vSpacer(2),
                            Row(
                              children: [
                                textD("Current loan amount: ", 14, bold: true),
                                Expanded(
                                    child: textD(
                                        bank.currentLoanAmount.toString(), 14)),
                              ],
                            ),
                            vSpacer(2),
                            Row(
                              children: [
                                textD("Blacklisted on CRIB: ", 14, bold: true),
                                Expanded(
                                    child: textD(
                                        bank.blackListedInCRIB.toString(), 14)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    vSpacer(3),
                    textD("Recent Banks", 16, bold: true),
                    vSpacer(2),
                    ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: recentBanks.length,
                        itemBuilder: (context, index) {
                          RecentBank recentBank = state.recentBanks[index];
                          return Card(
                            child: Padding(
                              padding: EdgeInsets.all(3.w),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      textD("Bank name: ", 14, bold: true),
                                      Expanded(
                                          child:
                                              textD(recentBank.bankName, 14)),
                                    ],
                                  ),
                                  vSpacer(1),
                                  Row(
                                    children: [
                                      textD("Sector: ", 14, bold: true),
                                      Expanded(
                                          child:
                                              textD(recentBank.bankType, 14)),
                                    ],
                                  ),
                                  vSpacer(1),
                                  Row(
                                    children: [
                                      textD("Updated: ", 14, bold: true),
                                      Expanded(
                                        child: textD(
                                          recentBank.accountNumber.toString(),
                                          14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ));
        }
        return PageTemplate(
            title: "Bank Details", child: Center(child: nothing));
      },
    );
  }
}
