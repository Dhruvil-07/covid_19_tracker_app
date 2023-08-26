import 'package:flutter/material.dart';

class cust_transactinon extends PageRouteBuilder{

  final Widget child;

  cust_transactinon({required this.child}) :
        super(
        transitionDuration: Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionsBuilder:  (context, animation, secondaryAnimation, child){
          return SlideTransition(
            position: Tween(
              begin: Offset(1.0 , 0.0),
              end : Offset.zero,
            ).chain(CurveTween(curve: Curves.easeInCubic)).animate(animation),
            child: child,
          );
/*ScaleTransition(
                                    child: child,
                                    alignment: Alignment.topCenter,
                                    scale: animation,
                                  );*/
        },
      );
}