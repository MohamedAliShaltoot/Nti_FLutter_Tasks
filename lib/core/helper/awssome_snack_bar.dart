import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
  required ContentType contentType,
  required String title
}) {
  final snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title:title,
      message:message,

      contentType: contentType,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
