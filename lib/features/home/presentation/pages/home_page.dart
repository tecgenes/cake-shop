import 'package:auto_route/auto_route.dart';
import 'package:cake_shop/config/router/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Home Page"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => context.router.push(const CategoryRoute()),
                  child: const Text("Category Page"),
                ),
                ElevatedButton(
                  onPressed: () => context.router.push(const OfferRoute()),
                  child: const Text("Offer Page"),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => context.router.push(const PlaceOrderRoute()),
              child: const Text("Place Order Page"),
            ),

            ElevatedButton(
              onPressed: () => context.router.push(const LocationRoute()),
              child: const Text("Location Page"),
            ),

            ElevatedButton(
              onPressed: () => context.router.push(const LoginRoute()),
              child: const Text("Login Page"),
            ),
          ],
        ),
      ),
    );
  }
}
