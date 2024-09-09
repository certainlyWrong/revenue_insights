import 'package:revenue_insights/revenue_insights.dart';
import 'package:test/test.dart';

void main() {
  // test minRevenue
  test('Should return the minimum revenue from the list of revenueDays', () {
    final revenueDays = [
      RevenueDay(day: Day.monday, revenue: 100),
      RevenueDay(day: Day.tuesday, revenue: 200),
      RevenueDay(day: Day.wednesday, revenue: 50),
      RevenueDay(day: Day.thursday, revenue: 300),
      RevenueDay(day: Day.friday, revenue: 150),
    ];

    final result = minRevenue(revenueDays);

    expect(result, 50);
  });

  test('Should return 0 when the list of revenueDays is empty', () {
    final revenueDays = <RevenueDay>[];

    final result = minRevenue(revenueDays);

    expect(result, 0);
  });

  test('Should return the maximum revenue from the list of revenueDays', () {
    final revenueDays = [
      RevenueDay(day: Day.monday, revenue: 100),
      RevenueDay(day: Day.tuesday, revenue: 200),
      RevenueDay(day: Day.wednesday, revenue: 50),
      RevenueDay(day: Day.thursday, revenue: 300),
      RevenueDay(day: Day.friday, revenue: 150),
    ];

    final result = maxRevenue(revenueDays);

    expect(result, 300);
  });

  test('Should return 0 when the list of revenueDays is empty', () {
    final revenueDays = <RevenueDay>[];

    final result = maxRevenue(revenueDays);

    expect(result, 0);
  });

  test('Should return the number of days where the revenue was above average',
      () {
    final revenueDays = [
      RevenueDay(day: Day.monday, revenue: 100),
      RevenueDay(day: Day.tuesday, revenue: 200),
      RevenueDay(day: Day.wednesday, revenue: 50),
      RevenueDay(day: Day.thursday, revenue: 300),
      RevenueDay(day: Day.friday, revenue: 150),
    ];

    final result = daysAboveAverage(revenueDays);

    expect(result, 2);
  });

  test('Should return 0 when the list of revenueDays is empty', () {
    final revenueDays = <RevenueDay>[];

    final result = daysAboveAverage(revenueDays);

    expect(result, 0);
  });
}
