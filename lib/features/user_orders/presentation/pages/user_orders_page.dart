import 'package:auto_route/auto_route.dart';
import 'package:cake_shop/config/router/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UserOrdersPage extends StatelessWidget {
  const UserOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("User Orders Page"),
            ElevatedButton(
              onPressed: () => context.router.push(const OrderDetailRoute()),
              child: const Text("Orders Detail Page"),
            ),
          ],
        ),
      ),
    );
  }
}
