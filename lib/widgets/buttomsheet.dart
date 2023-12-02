import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

Future<void> showCustomBottomSheet({
  required BuildContext context,
  required String mdFile,
}) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return FutureBuilder(
        future: Future.delayed(
          const Duration(milliseconds: 200),
        ).then(
          (value) {
            return rootBundle.loadString(
              mdFile,
            );
          },
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Markdown(
              data: snapshot.data.toString(),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    },
  );
}
