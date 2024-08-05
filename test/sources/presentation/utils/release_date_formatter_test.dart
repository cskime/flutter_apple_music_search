import 'package:apple_music_search/layer/presentation/utils/release_date_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Convert release date string to DateTime", () {
    // given
    const releaseDateString = "2019-08-23T07:00:00Z";
    final formatter = ReleaseDateFormatter();

    // when
    final dateTime = formatter.dateTime(releaseDateString);

    // then
    expect(dateTime.year, 2019);
    expect(dateTime.month, 8);
    expect(dateTime.day, 23);
    expect(dateTime.hour, 7);
    expect(dateTime.minute, 0);
    expect(dateTime.second, 0);
  });
}
