import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BrowseNavigation extends StatelessWidget {
  const BrowseNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}