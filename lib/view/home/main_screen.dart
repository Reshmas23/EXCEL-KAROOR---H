import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/home/home.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    log('height    ${size.height}');
    log('Width    ${size.width}');
    return const Scaffold(
      body: ResponsiveWebSite(
        mobile: HomeScreen(),
        tablet: HomeScreen(),
        desktop: HomeScreen(),
      ),
    );
  }
}
