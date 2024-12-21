import 'package:ch_five/components/grocery_tile.dart';
import 'package:ch_five/models/grocery_manager.dart';
import 'package:ch_five/screens/grocery_item_screen.dart';
import 'package:flutter/material.dart';

class GoceryListScreen extends StatelessWidget {
  const GoceryListScreen({super.key, required this.manager});

  final GroceryManager manager;

  @override
  Widget build(BuildContext context) {
    final groceryItems = manager.groceryItems;
    return ListView.separated(
      itemCount: groceryItems.length,
      itemBuilder: (context, index) {
        final item = groceryItems[index];

        return Dismissible(
          key: Key(item.id),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            child: const Icon(
              Icons.delete_forever,
              color: Colors.white,
              size: 50.0,
            ),
          ),
          onDismissed: (direction) {
            manager.deleteItem(index);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  '${item.name} dismissed',
                ),
              ),
            );
          },
          child: InkWell(
            child: GroceryTile(
              item: item,
              key: Key(item.id),
              onComplete: (change) {
                if (change != null) {
                  manager.completeItem(index, change);
                }
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GroceryItemScreen(
                    originalItem: item,
                    onCreate: (item) {},
                    onUpdate: (item) {
                      manager.updateItem(item, index);
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
    );
  }
}
