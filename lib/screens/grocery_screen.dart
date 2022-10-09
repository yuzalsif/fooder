import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'screens.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGroceryScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          (context).goNamed('items');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildGroceryScreen() {
    return Consumer<GroceryItemManager>(builder: (context, manager, child) {
      if (manager.groceryItems.isNotEmpty) {
        return GroceryListScreen(
          manager: manager,
        );
      } else {
        return const EmptyScreen();
      }
    });
  }
}
