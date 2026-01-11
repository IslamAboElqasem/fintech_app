import 'package:fintech_app/core/helpers/extension.dart';
import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortfolioChartSection extends StatefulWidget {
  const PortfolioChartSection({super.key});

  @override
  State<PortfolioChartSection> createState() => _PortfolioChartSectionState();
}

class _PortfolioChartSectionState extends State<PortfolioChartSection> {
  int _selectedMonthIndex = 1; // "Dec" selected by default
  final List<String> _months = ['Nov', 'Dec', 'Jan', 'Feb', 'Mar', 'Apl'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Month Selector
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(_months.length, (index) {
              final isSelected = index == _selectedMonthIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedMonthIndex = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 12.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ]
                        : null,
                  ),
                  child: Text(
                    _months[index],
                    style: TextStyle(
                      color: isSelected ? AppColors.electricBlue : Colors.grey,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),

        // Pie Chart + Legend
        Row(
          children: [
            // Chart
            SizedBox(
              height: 180.h,
              width: 180.w,
              child: Stack(
                children: [
                  PieChart(
                    PieChartData(
                      sectionsSpace: 0,
                      centerSpaceRadius: 70.r,
                      startDegreeOffset: -90,
                      sections: [
                        PieChartSectionData(
                          color: AppColors.lavenderPurple,
                          value: 45, // roughly visual
                          title: '',
                          radius: 12.r,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          color: AppColors.coralPink,
                          value: 25,
                          title: '',
                          radius: 12.r,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          color: AppColors.oceanTeal,
                          value: 30,
                          title: '',
                          radius: 12.r,
                          showTitle: false,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      '\$143,421.20',
                      style: context.headlineMedium_18?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            16.horizontalSpace,

            // Legend
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLegendItem(
                    AppColors.lavenderPurple,
                    '\$54,382.64',
                    'BTC',
                  ),
                  16.verticalSpace,
                  _buildLegendItem(AppColors.oceanTeal, '\$4,145.61', 'ETH'),
                  16.verticalSpace,
                  _buildLegendItem(AppColors.coralPink, '\$6,420.50', 'LTC'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String amount, String ticker) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 12.w,
          height: 12.h,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        8.horizontalSpace,
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$amount ',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                TextSpan(
                  text: ticker,
                  style: TextStyle(
                    color: AppColors.primary.withOpacity(
                      0.7,
                    ), // Slightly removed/greyer
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
