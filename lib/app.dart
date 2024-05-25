
import 'package:crud_assignment/product_home_page.dart';
import 'package:flutter/material.dart';

class CrudApp extends StatelessWidget{
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
   return const MaterialApp(
     themeMode: ThemeMode.light,
     title: "Crud App",
     home: CrudHomePage(),
   );
  }

}