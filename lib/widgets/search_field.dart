import 'package:flutter/material.dart';

/// Search Field
class SearchField extends StatefulWidget {
  final ValueChanged<String> onChange;

  const SearchField({super.key, required this.onChange});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width, // Set width to full screen
      child: TextFormField(
        onChanged: widget.onChange, // Call onChange function
        decoration: InputDecoration(
          hintText: "Search User",
          prefixIcon: const Icon(Icons.search), // Add search icon
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
        ),
      ),
    );
  }
}
