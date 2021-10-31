import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void pushAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}

void navigateTo(context, widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: (value) => onSubmit!(value),
      onChanged: (value) => onChange!(value),
      onTap: () => onTap!(),
      validator: (value) => validate(value),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () => suffixPressed!(),
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: () => function(),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );

void showToast(message, ToastState state) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: toastColorState(state),
    textColor: Colors.white,
    fontSize: 16.0);

enum ToastState { SUCCESS, ERROR, WARENING }

Color toastColorState(ToastState state) {
  Color toastColor;
  switch (state) {
    case ToastState.ERROR:
      toastColor = Colors.red;
      break;
    case ToastState.SUCCESS:
      toastColor = Colors.green;
      break;
    case ToastState.WARENING:
      toastColor = Colors.amber;
      break;
  }
  return toastColor;
}
