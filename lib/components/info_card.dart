import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_dashboard_ui/config/responsive.dart';
import 'package:responsive_dashboard_ui/config/size_config.dart';
import 'package:responsive_dashboard_ui/style/colors.dart';
import 'package:responsive_dashboard_ui/style/style.dart';

class InfoCard extends StatelessWidget {
  final String? icon;
  final String? label;
  final String? amount;
  const InfoCard({
    
    Key? key,
    required this.icon,
    required this.label,
    required this.amount
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:  BoxConstraints(minWidth:Responsive.isDesktop(context) ? 200.0 : 140),
      padding:  EdgeInsets.fromLTRB(20.0, 20.0, Responsive.isDesktop(context) ?40 :10, 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            icon!,
            width:Responsive.isDesktop(context) ? 35 : 28,
          ),
          SizedBox(
            height: SizeConfig.blockSizeHorizontal! * 2,
          ),
           PrimaryText(
            text: label!,
            size:Responsive.isDesktop(context) ? 16 : 14,
            color: AppColors.secondary,
          ),
          SizedBox(
            height: SizeConfig.blockSizeHorizontal! * 1,
          ),
           PrimaryText(
            text: amount!,
            size: Responsive.isDesktop(context) ? 18 : 16,
            fontWeight: FontWeight.w800,
          )
        ],
      ),
    );
  }
}
