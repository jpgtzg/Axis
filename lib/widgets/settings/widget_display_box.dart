import 'package:axis/constants.dart';
import 'package:axis/screens/dashboard_settings_screen.dart';
import 'package:axis/system/axis/realm/realm_models.dart';
import 'package:flutter/material.dart';

class WidgetDisplayBox extends StatelessWidget {
  final DashboardWidget widget;
  final int index;
  final Origin origin;
  final Color primaryColor;
  final Color? secondaryColor;
  final Color buttonColor;
  const WidgetDisplayBox(
      {required this.widget,
      required this.index,
      required this.origin,
      required this.primaryColor,
      this.secondaryColor,
      required this.buttonColor,
      super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardSettingsScreen(
            dashboardWidget: widget,
            index: index,
            origin: origin,
          ),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          double targetHeight = width * (4 / 13);

          return ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: width,
                minHeight: targetHeight,
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 25,
                  left: 25,
                ),
                decoration: (secondaryColor != null)
                    ? BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            primaryColor,
                            secondaryColor!,
                          ],
                        ),
                      )
                    : BoxDecoration(
                        color: primaryColor,
                      ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            widget.title,
                            textAlign: TextAlign.left,
                            style: defaultStyle,
                          ),
                        ),
                        Text(
                          "Type: ${widget.type}",
                          textAlign: TextAlign.center,
                          style: substitleStyle,
                        ),
                      ],
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
                          color: buttonColor,
                        ),
                        child: const Center(
                          child: Text(
                            "Modificar",
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
        },
      ),
    );
  }
}
