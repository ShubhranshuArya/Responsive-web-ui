import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_dashboard_ui/config/responsive.dart';
import 'package:responsive_dashboard_ui/config/size_config.dart';
import 'package:responsive_dashboard_ui/data.dart';
import 'package:responsive_dashboard_ui/style/colors.dart';
import 'package:responsive_dashboard_ui/style/style.dart';

class HistoryTable extends StatelessWidget {
  const HistoryTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Responsive.isDesktop(context) ? Axis.vertical : Axis.horizontal,
      child: SizedBox(
        width:Responsive.isDesktop(context) ? double.infinity : SizeConfig.screenWidth,
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: List.generate(
            transactionHistory.length,
            (index) => TableRow(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding:  EdgeInsets.only(top: 10, bottom: 10, left:Responsive.isDesktop(context) ? 20 : 0),
                  child: CircleAvatar(
                    radius:Responsive.isDesktop(context) ? 17 : 14,
                    backgroundImage:
                        NetworkImage(transactionHistory[index]['avatar']!),
                  ),
                ),
                PrimaryText(
                  text: transactionHistory[index]['label']!,
                  size:Responsive.isDesktop(context) ? 16 : 12,
                  color: AppColors.secondary,
                ),
                PrimaryText(
                  text: transactionHistory[index]['time']!,
                  size: Responsive.isDesktop(context) ? 16 : 12,
                  color: AppColors.secondary,
                ),
                PrimaryText(
                  text: transactionHistory[index]['amount']!,
                  size: Responsive.isDesktop(context) ? 16 : 12,
                  color: AppColors.secondary,
                ),
                PrimaryText(
                  text: transactionHistory[index]['status']!,
                  size: Responsive.isDesktop(context) ? 16 : 12,
                  color: AppColors.secondary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
