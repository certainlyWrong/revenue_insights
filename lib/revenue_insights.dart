library revenue_insights;

enum Day { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

final class RevenueDay {
  Day day;
  bool isWeekendOrHoliday;
  double revenue;

  RevenueDay({
    required this.day,
    required this.revenue,
    this.isWeekendOrHoliday = false,
  });
}

/// Returns the minimum revenue from the list of [revenueDays].
double minRevenue(List<RevenueDay> revenueDays) {
  revenueDays = removeWeekendAndHolidayDays(revenueDays);

  double min = revenueDays.isEmpty ? 0 : revenueDays[0].revenue;
  for (var revenueDay in revenueDays) {
    if (revenueDay.revenue < min) {
      min = revenueDay.revenue;
    }
  }
  return min;
}

/// Returns the maximum revenue from the list of [revenueDays].
double maxRevenue(List<RevenueDay> revenueDays) {
  revenueDays = removeWeekendAndHolidayDays(revenueDays);

  double max = revenueDays.isEmpty ? 0 : revenueDays[0].revenue;
  for (var revenueDay in revenueDays) {
    if (revenueDay.revenue > max) {
      max = revenueDay.revenue;
    }
  }
  return max;
}

/// Returns the number of days where the revenue was above average.
int daysAboveAverage(List<RevenueDay> revenueDays) {
  double average = averageRevenue(revenueDays);

  int count = 0;
  for (var revenueDay in revenueDays) {
    if (revenueDay.revenue > average) {
      count++;
    }
  }
  return count;
}

double ifEmpty(
    List<RevenueDay> revenueDays, double Function(List<RevenueDay>) fn) {
  return revenueDays.isEmpty ? 0 : fn(revenueDays);
}

/// Returns the average revenue from the list of [revenueDays].
double averageRevenue(List<RevenueDay> revenueDays) {
  return ifEmpty(revenueDays, (revenueDays) {
    double sum = 0;
    for (var revenueDay in revenueDays) {
      sum += revenueDay.revenue;
    }
    return sum / revenueDays.length;
  });
}

/// Removes the weekend and holiday days from the list of [revenueDays].
List<RevenueDay> removeWeekendAndHolidayDays(List<RevenueDay> revenueDays) {
  return revenueDays
      .where((revenueDay) => !revenueDay.isWeekendOrHoliday)
      .toList();
}
