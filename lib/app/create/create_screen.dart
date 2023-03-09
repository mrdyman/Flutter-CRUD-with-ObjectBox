import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crud/app/dashboard/dashboard_screen.dart';
import 'package:flutter_crud/components/custom_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'bloc/create_bloc.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CreateBloc bloc = BlocProvider.of<CreateBloc>(context);
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const DashboardScreen())),
              icon: const Icon(Icons.arrow_back)),
          title: const Text('Create New Data')),
      body: BlocListener<CreateBloc, CreateState>(
        listener: (context, state) {
          if (state is CreateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(milliseconds: 700),
                backgroundColor: Colors.green,
                content: Text('Data Created Successfully'),
              ),
            );
          }
        },
        child: Padding(
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
                          child: BlocBuilder<CreateBloc, CreateState>(
                            builder: (context, state) {
                              return CustomTextField(
                                hintText: "Ex. 1",
                                controller: bloc.itemIdTEC,
                                errorText: state is CreateError
                                    ? state.itemIdError
                                    : null,
                                keyboardType: TextInputType.number,
                                prefixIcon: SvgPicture.asset(
                                  "assets/icons/number.svg",
                                  height: 22,
                                ),
                              );
                            },
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
                          child: BlocBuilder<CreateBloc, CreateState>(
                            builder: (context, state) {
                              return CustomTextField(
                                hintText: "Ex. Item A",
                                controller: bloc.itemNameTEC,
                                errorText: state is CreateError
                                    ? state.itemNameError
                                    : null,
                                prefixIcon: SvgPicture.asset(
                                  "assets/icons/item.svg",
                                  height: 22,
                                ),
                              );
                            },
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
                          child: BlocBuilder<CreateBloc, CreateState>(
                            builder: (context, state) {
                              return CustomTextField(
                                hintText: "Ex. I001A",
                                controller: bloc.barcodeTEC,
                                errorText: state is CreateError
                                    ? state.barcodeError
                                    : null,
                                prefixIcon: SvgPicture.asset(
                                  "assets/icons/barcode.svg",
                                  height: 22,
                                ),
                              );
                            },
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
                      onPressed: () => bloc.add(OnSave(
                          itemId: bloc.itemIdTEC.text,
                          itemName: bloc.itemNameTEC.text,
                          barcode: bloc.barcodeTEC.text)),
                      child: const Text('Simpan')))
            ],
          ),
        ),
      ),
    );
  }
}
