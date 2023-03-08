import 'package:flutter/material.dart';
import 'package:flutter_crud/components/custom_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(Icons.arrow_back),
          title: const Text('Create New Data')),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ItemID'),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 200,
                        child: CustomTextField(
                          hintText: "Ex. 1",
                          controller: TextEditingController(),
                          prefixIcon: SvgPicture.asset(
                            "assets/icons/number.svg",
                            height: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ItemName'),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 200,
                        child: CustomTextField(
                          hintText: "Ex. Item A",
                          controller: TextEditingController(),
                          prefixIcon: SvgPicture.asset(
                            "assets/icons/item.svg",
                            height: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Barcode'),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 200,
                        child: CustomTextField(
                          hintText: "Ex. I001A",
                          controller: TextEditingController(),
                          prefixIcon: SvgPicture.asset(
                            "assets/icons/barcode.svg",
                            height: 22,
                          ),
                        ),
                      ),
                    ],
                  )
                ]),
              ),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: () => 1, child: const Text('Simpan')))
          ],
        ),
      ),
    );
  }
}
