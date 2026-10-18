import 'package:flutter/material.dart';

class ChipFilterWidget extends StatefulWidget {
  const ChipFilterWidget({super.key});

  @override
  State<ChipFilterWidget> createState() => _FilterChipState();
}

class _FilterChipState extends State<ChipFilterWidget> {
  final List<String> filters = ["electronics", "clothing", "home appliances"];
  final Set<String> selectedFilters = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filter Chips")),
      body: Padding(
        padding: const EdgeInsetsGeometry.all(8),
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: filters.map((filter) {
            return FilterChip(
              label: Text(filter),
              selected: selectedFilters.contains(filter),
              onSelected: (selected) {
                setState(() {
                  selected
                      ? selectedFilters.add(filter)
                      : selectedFilters.remove(filter);
                });
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
