import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crud/app/create/bloc/create_bloc.dart';
import 'package:flutter_crud/app/create/create_screen.dart';

import '../search/search_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Dashboard'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Align(
          child: ElevatedButton(
            onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (_) => BlocProvider<CreateBloc>(
                          create: (context) => CreateBloc(),
                          child: const CreateScreen(),
                        ))),
            child: const Text('Item'),
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const SearchScreen())),
          child: const Text('Search Item'),
        )
      ]),
    );
  }
}
