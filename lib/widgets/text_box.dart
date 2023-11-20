/// Written by Juan Pablo Gutiérrez
/// 08 11 2023

import 'package:axis/constants.dart';
import 'package:axis/system/axis/realm/realm_models.dart';
import 'package:axis/widgets/standart_spacer.dart';
import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final List data;
  final TextWidgetData textWidgetData;
  final String title;
  final Future? formsFuture;

  const TextBox({
    required this.data,
    required this.textWidgetData,
    required this.title,
    required this.formsFuture,
    Key? key,
  }) : super(key: key);

  Future<int?> getDataIndex() async {
    final value = await formsFuture;
    return value.questionsArray.indexWhere(
        (element) => element.questionID == textWidgetData.dataIndex);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int?>(
      future: getDataIndex(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        final dataIndex = snapshot.data;

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: paleteBlack,
          ),
          padding: const EdgeInsets.only(
            right: 24,
            left: 24,
            top: 24,
            bottom: 24,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: smallerDefaultStyle,
                ),
              ),
              const StandardSpacer(height: standartSpacerHeight),
              ...List.generate(
                data.length,
                (index) {
                  return Align(
                    alignment: Alignment.center,
                    child: Text(
                      data[index].answers[dataIndex].value.toString(),
                      style: smallerDefaultStyle,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
