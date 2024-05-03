
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Navigation {
  Nav(BuildContext context, Widget page) {
    Navigator.push(
      context,
      PageTransition(
          type: PageTransitionType.rightToLeft,
          child: page,
          inheritTheme: true,
          ctx: context),
    );
  }
}

class Loader {
  loader(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        // fit: StackFit.expand,
        children: [
          Center(
              child: Image.asset(
            'assets/app loarding button-01.png',
            height: 60,
          )),
          Center(
              child: LoadingAnimationWidget.threeArchedCircle(
            color: Color.fromARGB(255, 18, 79, 96),
            size: 60,
          )),
        ],
      ),
    );
  }
}

class notification {
  a(BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: "Good job, your release is successful. Have a nice day",
      ),
    );
  }

  b(BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        message:
            "There is some information. You need to do something with that",
      ),
    );
  }
}
