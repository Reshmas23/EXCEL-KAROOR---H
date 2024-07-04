import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/Login_dashBoard/dashB_Home_screen.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';

class LoginDashBoard extends StatelessWidget {
  const LoginDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveWebSite(
          mobile: DashBoardHomeScreen(

          ),
          tablet: DashBoardHomeScreen(

          ),
          desktop: DashBoardHomeScreen(
      
          )),
    );
  }
}
