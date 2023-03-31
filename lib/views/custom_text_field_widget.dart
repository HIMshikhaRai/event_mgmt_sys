import 'package:event_mgmt_sys/utils/color_constants.dart';
import 'package:event_mgmt_sys/utils/string_constants.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String fieldName, labelText;
  final IconData? icon;
  const CustomTextFieldWidget({this.textEditingController, this.fieldName = "", this.labelText = "", this.icon,  Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      autovalidateMode:
      AutovalidateMode.onUserInteraction,
      validator: (val) {
        return _isValid(labelText, val);
      },
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      obscureText: labelText == password,
      style: Theme.of(context).textTheme.titleMedium,
      decoration: InputDecoration(
        filled: true,
        fillColor: cardColor,
        hintText: fieldName,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16),
        suffixIcon: Icon(
          icon!,
        ),
      /*  labelText: labelText,
        labelStyle:
        Theme.of(context).textTheme.titleSmall,*/
        errorStyle: const TextStyle(color: Colors.red),
        focusedErrorBorder: _getOutlineBorder(),
        enabledBorder: _getOutlineBorder(),
        focusedBorder: _getOutlineBorder(),
        errorBorder: _getOutlineBorder(),
      ),
    );
  }

  _getOutlineBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: BorderSide.none);

  String? _isValid(String fieldType, String? val) {
    String? errorMsg;
    if (fieldType == email && (val?.isEmpty ?? false)) {
      return emailEmptyMsg;
    }
    if (fieldType == password && (val?.isEmpty ?? false)) {
      return passwordEmptyMsg;
    }
    return errorMsg;
  }
}
