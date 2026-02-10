// Copyright (c) 2026 Shivay00001. All rights reserved.
// Use of this source code is governed by the Business Source License 1.1
// that can be found in the LICENSE file.

import 'package:flutter/services.dart';

class PythonService {
  static const platform = MethodChannel('com.shivay.farmdirect/python');

  /// Calls the core Python engine to predict demand.
  /// [jsonInput] should contain 'product_name', 'price', etc.
  Future<String> predictDemand(String jsonInput) async {
    try {
      final String result = await platform.invokeMethod('predict_demand', jsonInput);
      return result;
    } on PlatformException catch (e) {
      return '{"status": "error", "message": "${e.message}"}';
    }
  }
}
