package com.example.ajyal

import android.app.NotificationChannel
import android.app.NotificationManager
import android.os.Build
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun onStart() {
        super.onStart()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                "ajyal_channel",              // نفس ID الموجود بالـ Manifest
                "Ajyal Notifications",        // اسم القناة للمستخدم
                NotificationManager.IMPORTANCE_HIGH
            )
            channel.description = "Channel for Ajyal app notifications"

            val manager = getSystemService(NotificationManager::class.java)
            manager.createNotificationChannel(channel)
        }
    }
}
