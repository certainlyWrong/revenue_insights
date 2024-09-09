import 'dart:math';

import 'package:revenue_insights/revenue_insights.dart';

void main(List<String> arguments) {
  List<RevenueDay> revenueDays = [];

  // Generate random revenue data for 365 days
  for (int i = 0; i < 365; i++) {
    revenueDays.add(
      RevenueDay(
        day: Day.values[i % 7],
        revenue: Random().nextInt(1000).toDouble(),
      ),
    );
  }

  print('Revenue data for 365 days:');
  print(revenueDays);

  print('Minimum revenue: ${minRevenue(revenueDays)}');
  print('Maximum revenue: ${maxRevenue(revenueDays)}');
  print('Average revenue: ${averageRevenue(revenueDays)}');

  print(
    'Number of days where the revenue was above average: ${daysAboveAverage(revenueDays)}',
  );

  print('Revenue data for 365 days without weekends and holidays:');
  print(removeWeekendAndHolidayDays(revenueDays));
}
