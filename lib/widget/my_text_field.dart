import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Helpers/assets_color.dart';
import '../Utils/validator.dart';

// Widget MyTextField({
//   required String hint,
//   int? maxLine,
//   TextEditingController? controller,
//   Function? validator,
//   Function? onTap = null,
// }) =>
//     TextFormField(
//       maxLines: maxLine,
//       onTap: () {
//         if (onTap != null) {
//           return onTap!();
//         } else {
//           onTap = () {};
//         }
//       },
//       controller: controller,
//          validator: initValidator(textValidType),
//       decoration: InputDecoration(
//         hintText: hint,
//         fillColor: AssetsColors.secondaryColor,
//         filled: true,
//         border: OutlineInputBorder(
//           borderSide: BorderSide(color: AssetsColors.primaryColor),
//           borderRadius: BorderRadius.circular(15),
//         ),
//       ),
//     );

class MyTextField extends StatelessWidget {
  late String hint;
  late String? text;
  late IconData? iconData;
  late TextInputType textInputType;
  late bool isPassword;
  late String prefixIconUrl;
  late Color? prefixIconColor;

  late bool isReadOnly;
  late TEXT_VALID_TYPE textValidType;

  int? maxLines;
  int? minLines;
  TextEditingController? myController;
  Function(String?)? validator;
  void Function()? onTap;
  TextDirection? textDirection;
  MyTextField({
    Key? key,
    required this.hint,
    this.onTap,
    this.prefixIconColor,
    this.iconData,
    this.validator,
    this.textValidType = TEXT_VALID_TYPE.NONE,
    this.textInputType = TextInputType.text,
    this.myController,
    this.maxLines,
    this.minLines,
    this.isPassword = false,
    this.isReadOnly = false,
    this.textDirection = TextDirection.rtl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      // style: TextStyle(color: Color(AssetsColors.color_blue_004BFE)),
      keyboardType: textInputType,
      maxLines: maxLines,
      obscureText: isPassword,
      enableSuggestions: isPassword,
      autocorrect: isPassword,
      minLines: minLines,
      readOnly: isReadOnly,
      textDirection: textDirection,
      onTap: () => onTap == null ? () {} : onTap!(),
      validator: initValidator(textValidType),
      decoration: InputDecoration(
        hintText: hint,
        fillColor: AssetsColors.secondaryColor,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AssetsColors.primaryColor),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  initValidator(TEXT_VALID_TYPE textValidType) {
    switch (textValidType) {
      case TEXT_VALID_TYPE.GENERAL:
        return (value) {
          if (Validator.instance.generalValidator(value)) {
            return '* الحقل مطلوب';
          }
        };
      case TEXT_VALID_TYPE.EMAIL:
        return (value) {
          if (Validator.instance.generalValidator(value)) {
            return '* الحقل مطلوب';
          }
          if (Validator.instance.emailValidator(value)) {
            return 'الرجاء ادخال البريد الألكتروني بالشكل الصحيح';
          }
        };
      case TEXT_VALID_TYPE.PASSWORD:
        return (value) {
          if (Validator.instance.generalValidator(value)) {
            return '* الحقل مطلوب';
          }
          if (Validator.instance.passwordValidator(value)) {
            return 'يجب ان يتكون من 6 احرف على الأقل';
          }
        };
      case TEXT_VALID_TYPE.PHONE:
        return (value) {
          if (Validator.instance.generalValidator(value)) {
            return '* الحقل مطلوب';
          }
          if (Validator.instance.phoneValidator(value)) {
            return 'الرجاء اخال رقم الهاتف بالصيغة الصحيحة';
          }
        };

      case TEXT_VALID_TYPE.NUMBER:
        return (value) {
          if (Validator.instance.generalValidator(value)) {
            return '* الحقل مطلوب';
          }
          if (Validator.instance.numbarValidator(value)) {
            return 'الرجاء ادخال الحقل بالشكل الصحيح';
          }
        };

      case TEXT_VALID_TYPE.NONE:
        if (validator != null) {
          return validator;
        }
    }
  }
}
