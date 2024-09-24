import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorSelectionGrid extends StatefulWidget {
  @override
  _ColorSelectionGridState createState() => _ColorSelectionGridState();
}

class _ColorSelectionGridState extends State<ColorSelectionGrid> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    final items = [
      {'color': Color(0xFFE3AD33), 'label': 'Harvest Gold', 'borderColor': Color(0xFFE0E0E0)},
      {'color': Color(0xFF1A1919), 'label': 'Eerie Black', 'borderColor': Color(0xFFE0E0E0)},
      {'color': Color(0xFFE35D32), 'label': 'Flame', 'borderColor': Color(0xFFE0E0E0)},
      {'color': Color(0xFF1C3A13), 'label': 'Pakistan Green', 'borderColor': Color(0xFFE0E0E0)},
    ];

    return SizedBox(
      width: 343,
      height: 160,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.5,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index; // Check if this item is selected

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index; // Update selected index
              });
            },
            child: Container(
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: isSelected ? items[index]['color'] as Color : items[index]['borderColor'] as Color, // Highlight selected color
                  width: isSelected ? 2 : 1, // Thicker border for selected item
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    color: items[index]['color'] as Color,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      items[index]['label'] as String,
                      style: TextStyle(
                        color: isSelected ? items[index]['color'] as Color : Color(0xFF404040), // Change text color when selected
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}