import 'package:flutter/material.dart';
import 'package:responsive_dashboard_ui/config/responsive.dart';
import 'package:responsive_dashboard_ui/style/colors.dart';
import 'package:responsive_dashboard_ui/style/style.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PrimaryText(
              text: 'Dashboard',
              size: 30.0,
              fontWeight: FontWeight.w800,
            ),
            PrimaryText(
              text: 'Payments Updates',
              size: 16,
              color: AppColors.secondary,
            ),
          ],
        ),
        const Spacer(
          flex: 1,
        ),
        if (Responsive.isDesktop(context))
          Expanded(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                fillColor: AppColors.white,
                filled: true,
                contentPadding: const EdgeInsets.only(left: 40, right: 50),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: AppColors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: AppColors.white),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                hintText: 'Search',
                hintStyle: const TextStyle(
                  color: AppColors.secondary,
                  fontSize: 14.0,
                ),
              ),
            ),
          )
      ],
    );
  }
}
