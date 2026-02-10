package com.example.farmdirect_app

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.chaquo.python.Python
import com.chaquo.python.android.AndroidPlatform

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.shivay.farmdirect/python"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        if (!Python.isStarted()) {
            Python.start(AndroidPlatform(this))
        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "predict_demand") {
                try {
                    val python = Python.getInstance()
                    val module = python.getModule("farmdirect_core.ai_engine")
                    val engine = module["engine"]
                    val response = engine?.callAttr("predict_demand", call.arguments)
                    result.success(response.toString())
                } catch (e: Exception) {
                    result.error("PYTHON_ERROR", e.message, null)
                }
            } else {
                result.notImplemented()
            }
        }
    }
}
