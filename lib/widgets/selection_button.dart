/// Written by Juan Pablo Gutiérez
/// 02 - 07 - 2023

import 'package:flutter/material.dart';

import '../constants.dart';

class SelectionButton extends StatelessWidget {
  final String titleText;
  final Widget widgetScreen;
  const SelectionButton({required this.titleText, required this.widgetScreen, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => widgetScreen),
      ),
      child: AspectRatio(
        aspectRatio: 13 / 4,
        child: Container(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 25,
            left: 25,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 2,
                child: Text(
                  titleText,
                  textAlign: TextAlign.center,
                  style: defaultStyle,
                ),
              ),
              Positioned(
                right: 30,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.lightBlue,
                  ),
                  child: const Center(
                    child: Text(
                      "Seleccionar",
                      textAlign: TextAlign.center,
                      style: substitleStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
