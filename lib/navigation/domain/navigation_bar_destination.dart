import 'package:flutter/material.dart';

class NavigationBarDestination {
  const NavigationBarDestination({required this.icon, required this.label});
  final IconData icon;
  final String label;
}

const destinations = [
  NavigationBarDestination(icon: Icons.security, label: "vault"),
  NavigationBarDestination(icon: Icons.key, label: "password"),
  NavigationBarDestination(icon: Icons.settings, label: "Settings"),
];
