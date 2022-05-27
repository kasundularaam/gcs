import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/themes/app_colors.dart';
import '../../../logic/cubit/bank_page_cubit/bank_page_cubit.dart';
import '../../../logic/cubit/home_page_cubit/home_page_cubit.dart';
import '../../../logic/cubit/hospital_page_cubit/hospital_page_cubit.dart';
import 'pages/bank_page.dart';
import 'pages/home_page.dart';
import 'pages/hospital_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = [
    BlocProvider(
      create: (context) => HomePageCubit(),
      child: const HomePage(),
    ),
    BlocProvider(
      create: (context) => HospitalPageCubit(),
      child: const HospitalPage(),
    ),
    BlocProvider(
      create: (context) => BankPageCubit(),
      child: const BankPage(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
              ),
              label: "Home",
              backgroundColor: AppColors.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_hospital_rounded,
              ),
              label: "Hospital",
              backgroundColor: AppColors.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.money_rounded,
              ),
              label: "Bank",
              backgroundColor: AppColors.primaryColor,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.lightElv0,
          unselectedItemColor: AppColors.lightElv0.withOpacity(0.7),
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5,
        ),
      ),
    );
  }
}
