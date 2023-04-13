import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {

   CustomLoader({

    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black26,
      child: Center(
        child: Image.asset(
            height: 100,
          width: 100,
          "assets/icon/loader.gif",
          fit: BoxFit.cover,
        )
      ),
    );
  }
}
