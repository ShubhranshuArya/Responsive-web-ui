import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_dashboard_ui/config/responsive.dart';
import 'package:responsive_dashboard_ui/config/size_config.dart';
import 'package:responsive_dashboard_ui/style/colors.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: Container(
        height: SizeConfig.screenHeight,
        color: AppColors.secondaryBg,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Responsive.isDesktop(context)
                  ? Container(
                      height: 100,
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: 35,
                        width: 35,
                        child: SvgPicture.asset('assets/mac-action.svg'),
                      ),
                    )
                  : const SizedBox(
                      height: 50,
                    ),
              iconBuilder(assetName: 'assets/home.svg'),
              iconBuilder(assetName: 'assets/pie-chart.svg'),
              iconBuilder(assetName: 'assets/clipboard.svg'),
              iconBuilder(assetName: 'assets/credit-card.svg'),
              iconBuilder(assetName: 'assets/trophy.svg'),
              iconBuilder(assetName: 'assets/invoice.svg'),
            ],
          ),
        ),
      ),
    );
  }
}

iconBuilder({
  required String assetName,
}) =>
    IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(assetName),
      iconSize: 20,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
    );
