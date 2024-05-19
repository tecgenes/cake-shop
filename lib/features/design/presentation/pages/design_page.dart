import 'package:auto_route/auto_route.dart';
import 'package:cake_shop/config/router/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DesignPage extends StatelessWidget {
  const DesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  [
            const Text("Design Page"),
            ElevatedButton(
              onPressed: () => context.router.push(const LocationRoute()),
              child: const Text("Location Page"),
            ),
          ],
        ),
      ),
    );
  }
}
