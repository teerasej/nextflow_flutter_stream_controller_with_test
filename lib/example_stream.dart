import 'dart:async';

import 'package:nextflow_flutter_stream_controller_with_test/submit_value.dart';

class ExampleStream {
  final StreamController<SubmitValue> controller =
      StreamController<SubmitValue>();

  void sendToStream(SubmitValue submitValue) {
    controller.add(submitValue);
  }
}
