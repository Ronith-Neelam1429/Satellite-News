import 'package:flutter/material.dart';

class SearchBarComp extends StatelessWidget {
  const SearchBarComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent, // Transparent background
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(color: Colors.grey), // Grey border
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 1.0),
              height: 45,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 113, 100, 178),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.send, color: Colors.white),
                onPressed: () {
                  // Add your search action here
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
