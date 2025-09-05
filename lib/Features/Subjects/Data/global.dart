// lib/Features/Subjects/Data/global.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// الـ notifier اللي يستمع له الواجهة
ValueNotifier<int> notiCountNotifier = ValueNotifier<int>(0);

// اقرأ القيمة من SharedPreferences وحطها في notifier
Future<void> loadNotiCountFromPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  final int stored = prefs.getInt('notiCount') ?? 0;
  notiCountNotifier.value = stored;
}

// عيّن قيمة جديدة (يخزن في prefs ويحدّث notifier)
Future<void> setNotiCountToPrefs(int c) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('notiCount', c);
  notiCountNotifier.value = c;
}

// زد العدد بواحد (للاستخدام في onMessage foreground)
Future<void> incrementNotiCountInPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  int cur = prefs.getInt('notiCount') ?? 0;
  int nv = cur + 1;
  await prefs.setInt('notiCount', nv);
  notiCountNotifier.value = nv;
}

// صفّر العدد
Future<void> resetNotiCountInPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('notiCount', 0);
  notiCountNotifier.value = 0;
}
