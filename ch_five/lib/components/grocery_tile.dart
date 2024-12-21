import 'package:ch_five/models/grocery_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GroceryTile extends StatelessWidget {
  final GroceryItem item;
  final Function(bool?)? onComplete;
  // final TextDecoration textDecoration;

  const GroceryTile({
    super.key,
    required this.item,
    this.onComplete,
  }) 
  // : textDecoration = item.isComplete ? TextDecoration.lineThrough : TextDecoration.none
  ;
  TextDecoration get textDecoration =>
      item.isComplete ? TextDecoration.lineThrough : TextDecoration.none;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 5,
                color: item.color,
              ),
              const SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name),
                  const SizedBox(height: 4),
                  buildDate(),
                  const SizedBox(height: 4),
                  buildImportance(),
                ],
              )
            ],
          ),
          Row(
            children: [
              Text(item.quantity.toString(),),
              buildCheckBox(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildImportance() {
    if (item.importance == Importance.low) {
      return Text('Low');
    } else if (item.importance == Importance.medium) {
      return Text('medium');
    } else if (item.importance == Importance.high) {
      return Text('high');
    } else {
      throw Exception('this importance type doesn\'t exist');
    }
  }

  Widget buildDate() {
    final dateFormatter = DateFormat('MMM dd h:mm a');
    final dateString = dateFormatter.format(item.date);
    return Text(
      dateString,
    );
  }

  Widget buildCheckBox() {
    return Checkbox(
      value: item.isComplete,
      onChanged: onComplete,
    );
  }
}
