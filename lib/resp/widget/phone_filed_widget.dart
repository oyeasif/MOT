import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mallturkeya/resp/colors/colors.dart';

class MyForm extends StatefulWidget {
  final String? hinttext;

  const MyForm({super.key, this.hinttext});
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  String initialCountry = 'TR';
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {},
      onInputValidated: (bool value) {},
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.DIALOG,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: const TextStyle(color: Colors.black),
      textStyle: const TextStyle(color: Colors.black),
      initialValue: PhoneNumber(isoCode: initialCountry),
      textFieldController: TextEditingController(),
      inputDecoration:  InputDecoration(
        hintText: widget.hinttext,
        hintStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: MyColors.hintgrey,
        ),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    );
  }
}
