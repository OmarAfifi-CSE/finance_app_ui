import 'package:finance_app_ui/core/features/main_screen/widgets/custom_app_bar.dart';
import 'package:finance_app_ui/core/features/main_screen/widgets/custom_grid_item.dart';
import 'package:finance_app_ui/core/features/main_screen/widgets/custom_grid_view.dart';
import 'package:finance_app_ui/core/styling/app_styles.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styling/app_assets.dart';
import '../../styling/app_colors.dart';
import '../auth/widgets/custom_icon_button.dart';

class StatisticsScreen extends StatefulWidget {
  StatisticsScreen({super.key});

  final Color leftBarColor = AppColors.primaryColor;
  final Color rightBarColor = Color(0xff303A6E);

  @override
  State<StatefulWidget> createState() => StatisticsScreenState();
}

class StatisticsScreenState extends State<StatisticsScreen> {
  final double width = 12.w;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 1, 2);
    final barGroup2 = makeGroupData(1, 7, 4);
    final barGroup3 = makeGroupData(2, 4, 1);
    final barGroup4 = makeGroupData(3, 7, 5);
    final barGroup5 = makeGroupData(4, 6, 4);

    final items = [barGroup1, barGroup2, barGroup3, barGroup4, barGroup5];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Statistics'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 236.h,
              child: BarChart(
                BarChartData(
                  maxY: 9,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: ((group) {
                        return AppColors.grayColor;
                      }),
                      getTooltipItem: (a, b, c, d) => null,
                    ),
                    touchCallback: (FlTouchEvent event, response) {
                      if (response == null || response.spot == null) {
                        setState(() {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                        });
                        return;
                      }

                      touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                      setState(() {
                        if (!event.isInterestedForInteractions) {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                          return;
                        }
                        showingBarGroups = List.of(rawBarGroups);
                        if (touchedGroupIndex != -1) {
                          var sum = 0.0;
                          for (final rod
                              in showingBarGroups[touchedGroupIndex].barRods) {
                            sum += rod.toY;
                          }
                          final avg =
                              sum /
                              showingBarGroups[touchedGroupIndex]
                                  .barRods
                                  .length;

                          showingBarGroups[touchedGroupIndex] =
                              showingBarGroups[touchedGroupIndex].copyWith(
                                barRods: showingBarGroups[touchedGroupIndex]
                                    .barRods
                                    .map((rod) {
                                      return rod.copyWith(
                                        toY: avg,
                                        color: widget.leftBarColor,
                                      );
                                    })
                                    .toList(),
                              );
                        }
                      });
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitles,
                        reservedSize: 42,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        interval: 1,
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: showingBarGroups,
                  gridData: const FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: false,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 162.h,
              child: GridView(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 15.w,

                ),
                children: [
                  Container(
                    width: 156.w,
                    height: 142.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffE8EcF4)),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomIconButton(
                            iconPath: AppAssets.downloadIcon,
                            width: 48.w,
                            height: 48.h,
                            borderRadius: 12,
                            borderWidth: 0,
                            backgroundColor: const Color(0xffECF1F6),
                            iconWidth: 20.w,
                            iconHeight: 20.h,
                            onPressed: (){},
                          ),
                          SizedBox(height: 12.h),
                          Text('1500 EG' ?? '', style: AppStyles.black16w600Style),
                          SizedBox(height: 4.h),
                          Text('Income' ?? '', style: AppStyles.gray12w500Style),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 156.w,
                    height: 142.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffE8EcF4)),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomIconButton(
                            iconPath: AppAssets.uploadIcon,
                            width: 48.w,
                            height: 48.h,
                            borderRadius: 12,
                            borderWidth: 0,
                            backgroundColor: const Color(0xffECF1F6),
                            iconWidth: 20.w,
                            iconHeight: 20.h,
                            onPressed: (){},
                          ),
                          SizedBox(height: 12.h),
                          Text('3000 EG' ?? '', style: AppStyles.black16w600Style),
                          SizedBox(height: 4.h),
                          Text('Outcome' ?? '', style: AppStyles.gray12w500Style),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    final style = AppStyles.gray12w500Style;

    if (value % 2 == 0) {
      final displayValue = (value).toInt();
      final String text = displayValue == 0 ? '0' : '${displayValue}K';

      return SideTitleWidget(
        meta: meta,
        space: 0,
        child: Text(text, style: style),
      );
    }
    return Container();
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Jan', 'Feb', 'Mar', 'Apr', 'May'];

    final Widget text = Text(
      titles[value.toInt()],
      style: AppStyles.gray12w500Style,
    );

    return SideTitleWidget(
      meta: meta,
      space: 8, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4.w,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: widget.leftBarColor,
          width: width,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        BarChartRodData(
          toY: y2,
          color: widget.rightBarColor,
          width: width,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ],
    );
  }
}
