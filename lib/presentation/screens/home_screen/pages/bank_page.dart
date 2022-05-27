import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/components.dart';
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
          return PageTemplate(
              title: "Bank Details", child: Center(child: nothing));
        }
        return PageTemplate(
            title: "Bank Details", child: Center(child: nothing));
      },
    );
  }
}
