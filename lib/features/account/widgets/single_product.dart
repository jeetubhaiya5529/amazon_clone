import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black12,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white),
        child: Container(
          width: 180,
          padding: const EdgeInsets.all(10),
          child: Image.network(
            image,
            fit: BoxFit.fitHeight,
            width: 180,
          ),
        ),
      ),
    );
  }
}
