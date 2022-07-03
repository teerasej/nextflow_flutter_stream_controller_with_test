// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nextflow_flutter_stream_controller_with_test/example_stream.dart';

import 'package:nextflow_flutter_stream_controller_with_test/main.dart';
import 'package:nextflow_flutter_stream_controller_with_test/submit_value.dart';

void main() {
  test(
    'Submit value through stream should be in order',
    () {
      var example = ExampleStream();

      expect(
        example.controller.stream,
        emitsInOrder(
          [
            SubmitValue.One,
            SubmitValue.Two,
            SubmitValue.Three,
          ],
        ),
      );

      example.sendToStream(SubmitValue.One);
      example.sendToStream(SubmitValue.Two);
      example.sendToStream(SubmitValue.Three);
    },
  );
}
