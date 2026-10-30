import 'package:flutter/material.dart';

IconData iconFromKey(String key) {
  return switch (key) {
    'verified' => Icons.verified_outlined,
    'public' => Icons.public,
    'devices' => Icons.devices_other_outlined,
    'eco' => Icons.eco_outlined,
    'inventory' => Icons.inventory_2_outlined,
    'iso' => Icons.fact_check_outlined,
    'hub' => Icons.hub_outlined,
    'school' => Icons.school_outlined,
    'language' => Icons.language,
    _ => Icons.circle_outlined,
  };
}
