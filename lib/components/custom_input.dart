import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputField extends StatefulWidget {
  /// surpoted field are
  /// [amount], [number]
  final Widget? prefixIocn;
  final Image? prefixImage;
  final String? field;
  final int? maxLength;
  final TextEditingController? textController;
  final TextInputAction? textInputAction;
  final Map? responce;
  final bool? hideText;
  final String? label;
  final bool? multiline;
  final ValueChanged<String?> onChanged;
  final String? initValue;
  final Function? validator;
  final bool showErr;
  final double borderRad;
  final bool hasBorder;
  final bool autoValidate;
  final Widget? suffix;
  final Function? onEditingComplete;
  final FocusNode? focusNode;
  const CustomInputField(
      {this.field,
      Key? key,
      this.borderRad = 5.0,
      this.maxLength,
      this.suffix,
      this.focusNode,
      this.showErr = true,
      this.hasBorder = true,
      this.autoValidate = false,
      this.prefixIocn,
      this.prefixImage,
      this.textInputAction,
      this.validator,
      this.responce,
      this.textController,
      this.label,
      this.onEditingComplete,
      this.multiline,
      this.initValue,
      this.hideText,
      required this.onChanged})
      : super(key: key);
  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField>
    with WidgetsBindingObserver {
  Map? responce;
  String? label;
  String? _initValue;
  bool _obscureText = true;

  void _handleChanged() {
    widget.onChanged(finalValue);
  }

  String? finalValue;

  @override
  void initState() {
    super.initState();
    _initValue = widget.initValue;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: widget.multiline != null ? null : 55,
      child: TextFormField(
        controller: widget.textController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        focusNode: widget.focusNode,
        style:
            const TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
        obscureText: widget.hideText != null ? _obscureText : false,
        initialValue: _initValue,
        onEditingComplete: () {
          if (widget.onEditingComplete != null) widget.onEditingComplete!();
        },
        textInputAction: widget.textInputAction,
        maxLines: widget.multiline != null ? 5 : 1,
        validator: widget.validator as String? Function(String?)?,
        onChanged: (String value) {
          setState(() {
            finalValue = value.trim();
          });
          _handleChanged();
        },
        maxLength: widget.maxLength,
        keyboardType: widget.field == 'number'
            ? TextInputType.phone
            : widget.field == 'amount'
                ? TextInputType.number
                : widget.field == "email"
                    ? TextInputType.emailAddress
                    : null,
        inputFormatters: widget.field == 'number'
            ? [FilteringTextInputFormatter.allow(RegExp('[0-9]'))]
            : widget.field == 'amount'
                ? [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]|\.')),
                  ]
                : null,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIocn ?? widget.prefixImage,
          suffix: widget.suffix,
          suffixIcon: widget.field == 'search'
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.red,
                    // color: AppTheme.primaryColor,
                  ),
                )
              : widget.hideText != null
                  ? IconButton(
                      onPressed: () {
                        _toggleObscureText();
                      },
                      icon: Icon(
                        _obscureText
                            ? Icons.remove_red_eye
                            : Icons.visibility_off,
                        color: Theme.of(context).buttonColor,
                      ),
                    )
                  : null,
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
          // border: UnderlineInputBorder(
          //   borderSide: BorderSide(color: Color(0xFFBDBDBD)),
          // ),
          // enabledBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(color: Color(0xFFBDBDBD)),
          // ),
          // focusedBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(color: Color(0xFFBDBDBD), width: 0),
          // ),
        ),
      ),
    );
  }
}

globalInputD(String label, bool showErr) {
  return InputDecoration(
    contentPadding: const EdgeInsets.only(left: 10, top: 10),
    counterStyle: TextStyle(
      height: double.minPositive,
    ),
    counterText: "",
    hintText: label,
    hintStyle: const TextStyle(
      color: Color(0xFFBDBDBD),
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: "Montserrat",
    ),
    errorStyle: showErr
        ? const TextStyle(fontSize: 8, fontWeight: FontWeight.w500, height: .5)
        : const TextStyle(fontSize: 0, height: 0),
    errorMaxLines: 1,
    // focusedBorder: OutlineInputBorder(
    //   borderSide: const BorderSide(color: Colors.grey),
    //   borderRadius: BorderRadius.circular(5),
    // ),
    // border:  OutlineInputBorder(
    //   borderSide: const BorderSide(color: Colors.transparent, width: 0),
    //   borderRadius: BorderRadius.circular(5),
    // ),
    border: InputBorder.none,
    // enabledBorder: OutlineInputBorder(
    //   borderSide: const BorderSide(color: Colors.grey),
    //   borderRadius: BorderRadius.circular(5),
    // ),
  );
}
