/// Written by Juan Pablo Gutiérrez
/// 12 - 06 - 2023
///
/// Represents a button that fills most of the screen. Contains  an image background

import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final String title;
  final VoidCallback pressAction;
  final AssetImage? image;

  const BigButton(
      {super.key,
      required this.title,
      required this.pressAction,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressAction,
      child: Container(
        padding: const EdgeInsets.only(
          top: 15,
          bottom: 25,
          left: 25,
        ),
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          /* image: DecorationImage(
            image: image!,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.blueAccent.withOpacity(0.15),
              BlendMode.srcOver,
            ),
          ), */
          // color: Color(0xff1E91D6),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 2,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
            ),
            Positioned(
              right: 30,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(2),
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.lightBlue,
                ),
                child: const Center(
                    child: Text(
                  'Seleccionar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
