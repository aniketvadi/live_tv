package com.cystal.live_tv.live_tv

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlin.random.Random

class MainActivity : FlutterActivity() {
    private val channel = "com.crystal.live_tv"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
                flutterEngine.dartExecutor.binaryMessenger,
                channel
        ).setMethodCallHandler { call, result ->

            if (call.method == "getRandomNumber") {
                val random = Random.nextInt(100)
                result.success(random)
            } else {
                result.success(1)
            }
        }
    }
}
