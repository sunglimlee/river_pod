import 'package:flutter/material.dart';

class TextButtonSuppliedByProviderScreen extends StatelessWidget {
  final Widget child;
  final String buttonName;

  //final VoidCallback? onPressed;

  const TextButtonSuppliedByProviderScreen(
      {Key? key, required this.child, required this.buttonName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return child;
            },
          ));
        },
        child: Text(buttonName));
  }
}
