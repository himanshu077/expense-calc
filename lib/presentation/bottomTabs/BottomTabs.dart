import 'package:expense_calc/components/constants/constants.dart';
import 'package:expense_calc/viewController/bottomTabs/bottom_tabs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/constants/AppColors.dart';
import '../../components/constants/AppFonts.dart';
import '../../components/coreComponents/ImageView.dart';

class BottomTabs extends StatefulWidget {
  const BottomTabs({super.key});

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomTabsBloc, BottomTabsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(),
          bottomNavigationBar: BottomNavBar(
            activeIndex: state.index,
            onSelect: (index) =>
                context.read<BottomTabsBloc>().add(ChangeTab(index: index)),
            tabs: bottomTabsList,
          ),
        );
      },
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final List<String> tabs;
  final Function(int) onSelect;
  final int activeIndex;

  const BottomNavBar(
      {super.key,
      required this.tabs,
      required this.onSelect,
      required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: AppFonts.s16,
          bottom: AppFonts.s10 + MediaQuery.of(context).padding.bottom),
      decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          boxShadow: [
            BoxShadow(color: AppColors.primaryColor, blurRadius: 15)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: tabs
            .asMap()
            .map((index, value) => MapEntry(
                index,
                BottomTabsItem(
                    icon: value ?? '',
                    status: activeIndex == index,
                    onTap: () {
                      onSelect(index);
                      // bookingCtrl.swapBookingFlag.value = false;
                    })))
            .values
            .toList(),
      ),
    );
  }
}

class BottomTabsItem extends StatelessWidget {
  final String icon;
  final bool status;
  final Function()? onTap;

  const BottomTabsItem(
      {super.key, required this.icon, required this.status, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ImageView(
      onTap: onTap,
      url: icon,
      size: AppFonts.s22,
      tintColor: status ? AppColors.white : AppColors.grey20,
      margin: const EdgeInsets.only(bottom: 3),
    );
  }
}