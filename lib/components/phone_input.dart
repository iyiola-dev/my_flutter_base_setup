import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:country_code_picker/country_code_picker.dart';

class PhoneInputField extends StatefulWidget {
  /// surpoted field are
  /// [amount], [number]
  final Widget prefixIocn;
  final Image prefixImage;
  final String field;
  final int maxLength;
  final TextEditingController textController;
  final TextInputAction textInputAction;
  // final Map responce;

  final String label;
  // final bool multiline;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onDialCodeChange;
  final String initValue;
  final Function validator;
  final bool showErr;
  final double borderRad;
  final bool hasBorder;
  final bool autoValidate;
  final Widget suffix;
  final Function onEditingComplete;
  const PhoneInputField({
    this.field,
    Key key,
    this.borderRad = 5.0,
    this.maxLength,
    this.suffix,
    this.showErr = true,
    this.hasBorder = true,
    this.autoValidate = false,
    this.prefixIocn,
    this.prefixImage,
    this.textInputAction,
    this.validator,
    // this.responce,
    this.textController,
    this.label,
    this.onEditingComplete,
    // this.multiline,
    this.initValue,
    @required this.onChanged,
    @required this.onDialCodeChange,
  }) : super(key: key);
  @override
  _PhoneInputFieldState createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField>
    with WidgetsBindingObserver {
  Map responce;
  String label;
  String _initValue;

  void _handleChanged() {
    widget.onChanged(finalValue);
  }

  String finalValue;
  String _contryCode = "NG";
  String _dialCode = "+234";
  tryou() async {
    try {
      await FlutterLibphonenumber().init();

      print(widget.textController.text);

      if (widget.textController.text != "" &&
          widget.textController.text != null) {
        final formattedNumber =
            await FlutterLibphonenumber().parse(widget.textController.text);
        // print(formattedNumber);
        // print(formattedNumber['national_number']);
        // print(formattedNumber['national_number']);
        // _contryCode = formattedNumber['country_code'];
        // _dialCode = formattedNumber['country_code'];
        // numberCtr = TextEditingController(text: formattedNumber['national_number']);
        widget.textController.text = formattedNumber['national_number'];
        setState(() {});
      }
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    tryou();
    _initValue = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: widget.multiline != null ? null : 55,
      child: TextFormField(
        controller: widget.textController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style:
            const TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
        initialValue: _initValue,
        onEditingComplete: () {
          if (widget.onEditingComplete != null) widget.onEditingComplete();
        },
        textInputAction: widget.textInputAction,
        validator: widget.validator,
        onChanged: (String value) {
          setState(() {
            // finalValue = value.trim();
            finalValue = _dialCode + widget.textController.text;
          });
          _handleChanged();
        },
        onFieldSubmitted: (value) {
          setState(() {
            finalValue = _dialCode + widget.textController.text;
          });
          _handleChanged();
        },
        keyboardType: TextInputType.phone,
        inputFormatters: [
          LibPhonenumberTextFormatter(
            onCountrySelected: (country) =>
                print('onCountrySelected: $country'),
            onFormatFinished: (formattedVal) =>
                print('onFormatFinished: $formattedVal'),
            overrideSkipCountryCode: _contryCode,
            phoneNumberType: PhoneNumberType.mobile,
            phoneNumberFormat: PhoneNumberFormat.national,
          )
        ],
        decoration: InputDecoration(
          prefixIcon: CountryCodePicker(
            onChanged: (value) {
              print(value.code);
              print(value.dialCode);
              setState(() {
                _contryCode = value.code;
                widget.onDialCodeChange(_contryCode);
                // _dialCode = value.dialCode;
              });
            },
            initialSelection: _contryCode,
            showFlagMain: true,
            flagWidth: 20,
            hideSearch: true,
            onInit: (value) {},
            padding: const EdgeInsets.all(0),
          ),
          suffix: widget.suffix,

          contentPadding: const EdgeInsets.only(left: 10, top: 10),
          counterStyle: TextStyle(
            height: double.minPositive,
          ),
          counterText: "",
          hintText: widget.label,
          hintStyle: const TextStyle(
            color: Color(0xFFBDBDBD),
            fontSize: 12,
            fontWeight: FontWeight.w500,
            fontFamily: "Montserrat",
          ),
          errorStyle: widget.showErr
              ? const TextStyle(
                  fontSize: 8, fontWeight: FontWeight.w500, height: .5)
              : const TextStyle(fontSize: 0, height: 0),
          // errorMaxLines: 1,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(widget.borderRad),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(widget.borderRad),
          ),

          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(widget.borderRad),
          ),
        ),
      ),
    );
  }
}
