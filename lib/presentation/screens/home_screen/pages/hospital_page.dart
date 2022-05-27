import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/components.dart';
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
          return PageTemplate(
              title: "Hospital Details", child: Center(child: nothing));
        }
        return PageTemplate(
            title: "Hospital Details", child: Center(child: nothing));
      },
    );
  }
}
