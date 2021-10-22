import 'package:flutter_call_outcome/flutter_call_outcome.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('If object is declared without initializing any of the two members', () {
    expect(() {
      final callOutcome = CallOutcome();
      callOutcome.data = "";
    }, throwsAssertionError);
  });
  test('If object is declared with initializing any of the two members', () {
    CallOutcome(data: "hello");
    CallOutcome(exception: Exception('exception'));
  });
}
