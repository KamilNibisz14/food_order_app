import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants.dart';
import '../../../main/presentation/pages/main_page.dart';
import '../widgets/initial_order_button.dart';

class InitialPage extends StatefulWidget {
  static const String id = "initial_page";
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> with SingleTickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(duration: const Duration(milliseconds: 6500), vsync: this);
     animation = Tween<double>(begin: 0, end: 650).animate(controller)
      ..addListener(() {
        setState(() {
        });
      });
    controller.forward();
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double animationSize = screenWidth / 2.5;

    double startAnimation = 450;
    double startRadiusAnimation = 595;
    double endRadiusAnimation = 649;
    double containerRadius = 54;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: animation.value < startAnimation? screenHeight:screenHeight / ((animation.value - startAnimation)/150 ),
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(animation.value < startRadiusAnimation? 0:animation.value > endRadiusAnimation? containerRadius:animation.value - startRadiusAnimation),
                bottomRight: Radius.circular(animation.value < startRadiusAnimation? 0:animation.value > endRadiusAnimation? containerRadius:animation.value - startRadiusAnimation)
              )
            ),
            child: Center(
              child: SizedBox(
                width: animationSize,
                height: animationSize,
                child: Lottie.asset(
                  "assets/food.json",
                  fit: BoxFit.cover,
                  repeat: false
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Opacity(
              opacity: animation.value < 600? 0 : (animation.value-600)/50,
              child: InitiolOrderButton(
                onTap: (){
                  if(animation.value >600){
                    Navigator.pushNamed(context, MainPage.id);
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}