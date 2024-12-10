import 'package:ch_five/models/grocery_manager.dart';
import 'package:ch_five/screens/empty_grocery_screen.dart';
import 'package:ch_five/screens/grocery_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GroceryManager>(builder: (context, manager, child) {
      if (manager.groceryItems.isNotEmpty) {
        return Container();
      } else {
        return Scaffold(
          body: const EmptyGroceryScreen(),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              final manager =
                  Provider.of<GroceryManager>(context, listen: false);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GroceryItemScreen(
                    onCreate: (item) {
                      manager.addItem(item);
                      Navigator.pop(context);
                    },
                    onUpdate: (item) {},
                  ),
                ),
              );
            },
          ),
        );
      }
    });
  }
}
