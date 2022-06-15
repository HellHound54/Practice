import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Bloc/ProductBloc.dart';
import 'package:untitled/ProductView.dart';
import 'package:untitled/Repository/ProductRepository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFEEEEEE),
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.orange, secondary: Colors.orangeAccent)),
      home: BlocProvider(
        create: (context) => ProductBloc(
          FakeProductRepository(),
        ),
        child: ProductView(),
      ),
    );
  }
}
