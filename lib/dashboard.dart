import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_dashboard_ui/components/bar_chart_component.dart';
import 'package:responsive_dashboard_ui/components/history_table.dart';
import 'package:responsive_dashboard_ui/config/responsive.dart';
import 'package:responsive_dashboard_ui/config/size_config.dart';
import 'package:responsive_dashboard_ui/style/colors.dart';
import 'package:responsive_dashboard_ui/style/style.dart';

import 'components/components.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    SizeConfig().init(context);
    return Scaffold(
      key: _drawerKey,
      drawer: const SizedBox(
        width: 100,
        child: SideMenu(),
      ),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                  onPressed: () {
                    _drawerKey.currentState!.openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: AppColors.black,
                  )),
              actions: const [AppBarActionItem()],
            )
          : const PreferredSize(
              child: SizedBox(),
              preferredSize: Size.zero,
            ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                flex: 1,
                child: SideMenu(),
              ),
            Expanded(
              flex: 10,
              child: SizedBox(
                height: SizeConfig.screenHeight,
                child: SingleChildScrollView(
                  padding:  EdgeInsets.all(Responsive.isDesktop(context) ?30 : 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DashboardHeader(),
                      SizedBox(
                        height:Responsive.isDesktop(context) ? SizeConfig.blockSizeVertical! * 5 : SizeConfig.blockSizeVertical! * 3,
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth,
                        child: Wrap(
                          runSpacing: 20,
                          spacing: 20,
                          alignment: WrapAlignment.spaceBetween,
                          children: const [
                            InfoCard(
                              icon: 'assets/credit-card.svg',
                              label: 'Transfer via\nCard number',
                              amount: '\$1200',
                            ),
                            InfoCard(
                              icon: 'assets/transfer.svg',
                              label: 'Transfer via\nOnline banks',
                              amount: '\$2000',
                            ),
                            InfoCard(
                              icon: 'assets/bank.svg',
                              label: 'Transfer via\nSame bank',
                              amount: '\$1500',
                            ),
                            InfoCard(
                              icon: 'assets/invoice.svg',
                              label: 'Transfer to\nOther bank',
                              amount: '\$800',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height:Responsive.isDesktop(context) ? SizeConfig.blockSizeVertical! * 4 : SizeConfig.blockSizeVertical! * 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              PrimaryText(
                                text: 'Balance',
                                size:Responsive.isDesktop(context) ? 16 : 14,
                                color: AppColors.secondary,
                              ),
                              PrimaryText(
                                text: '\$1500',
                                size: Responsive.isDesktop(context) ? 30 : 22,
                                fontWeight: FontWeight.w800,
                              ),
                            ],
                          ),
                           PrimaryText(
                            text: 'Past 30 Days',
                            size:Responsive.isDesktop(context) ? 16 : 14,
                            color: AppColors.secondary,
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 3,
                      ),
                      const SizedBox(
                        height: 180,
                        child: BarChartComponent(),
                      ),
                      SizedBox(
                        height:Responsive.isDesktop(context) ? SizeConfig.blockSizeVertical! * 5 : SizeConfig.blockSizeVertical! * 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          PrimaryText(
                            text: 'History',
                            size: 30.0,
                            fontWeight: FontWeight.w800,
                          ),
                          PrimaryText(
                            text: 'Transaction of past 6 months',
                            size: 16,
                            color: AppColors.secondary,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 5,
                      ),
                      const HistoryTable(),
                      if (!Responsive.isDesktop(context))
                        const PaymentsDetailList()
                    ],
                  ),
                ),
              ),
            ),
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 4,
                child: Container(
                  height: SizeConfig.screenHeight,
                  color: AppColors.secondaryBg,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: const [
                        AppBarActionItem(),
                        PaymentsDetailList(),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
