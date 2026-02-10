// Copyright (c) 2026 Shivay00001. All rights reserved.
// Use of this source code is governed by the Business Source License 1.1
// that can be found in the LICENSE file.

import 'package:flutter/services.dart';

class PythonService {
  static const platform = MethodChannel('com.shivay.farmdirect/python');

  /// Calls the core Python engine to predict demand or fair price.
  Future<String> predictDemand(String jsonInput) async {
    try {
      final String result = await platform.invokeMethod('predict_demand', jsonInput);
      return result;
    } on PlatformException catch (e) {
      return '{"status": "error", "message": "${e.message}"}';
    }
  }

  /// Calls Python to recommend pricing (useful for buyers to know if price is fair)
  Future<String> checkFairPrice(String productName, double currentPrice) async {
    // We can reuse the same engine logic, or add specific buyer-side logic in Python later.
    // For now, we reuse the pricing recommendation to see if it's a good deal.
    try {
         // Mocking a competitor price for the AI to compare against
        final competitorPrice = currentPrice * 1.1; 
        final String result = await platform.invokeMethod('recommend_pricing', [productName, currentPrice, competitorPrice]);
        return result;
    } on PlatformException catch (e) {
        return '{"status": "error", "message": "${e.message}"}';
    }
  }
}
