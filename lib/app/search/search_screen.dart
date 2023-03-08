import 'package:flutter/material.dart';
import 'package:flutter_crud/components/custom_text_field.dart';
import 'package:flutter_crud/components/item_card.dart';
import 'package:flutter_crud/consts/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        title: const Text('Search Data'),
        leading: const Icon(Icons.arrow_back),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  hintText: "Search...",
                  controller: TextEditingController(),
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/search.svg",
                    height: 22,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return const ItemCard(
                        itemId: "1", itemName: "Item A", barcode: "1ABXC");
                  }))
        ]),
      ),
    );
  }
}
