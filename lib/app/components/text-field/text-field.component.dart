import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sizer/sizer.dart';

import '../../../themes/style.dart';

enum FieldType { password, text }

class TextFieldView extends StatefulWidget {
  const TextFieldView({
    super.key,
    required this.name,
    required this.type,
    this.hintText,
    this.validator,
    this.initialValue,
    this.prefixIcon,
    this.onChanged,
  });

  final String name;
  final FieldType type;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final String? initialValue;
  final Icon? prefixIcon;
  final ValueChanged<String?>? onChanged;

  @override
  State<TextFieldView> createState() => _TextFieldViewState();
}

class _TextFieldViewState extends State<TextFieldView> {
  final _controller = TextEditingController();
  final _focus = FocusNode();

  bool _isShowClearButton = false;
  bool _isShowPassword = false;

  @override
  void initState() {
    _focus.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          errorMaxLines: 2,
          // contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          hintStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xFF99B7D4)),
          // errorBorder: OutlineInputBorder(
          //   borderSide: const BorderSide(color: Colors.red, width: 1.25),
          //   borderRadius: BorderRadius.circular(10.sp),
          // ),
          // focusedErrorBorder: OutlineInputBorder(
          //   borderSide: const BorderSide(color: Colors.red, width: 1.25),
          //   borderRadius: BorderRadius.circular(10.sp),
          // ),
          // enabledBorder: OutlineInputBorder(
          //   borderSide: const BorderSide(color: Color(0xFFCCDCDF), width: 1.25),
          //   borderRadius: BorderRadius.circular(10.sp),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   borderSide: const BorderSide(color: AppColor.accentColor, width: 1.25),
          //   borderRadius: BorderRadius.circular(10.sp),
          // ),
          prefixIconColor: _focus.hasFocus ? AppColor.accentColor : const Color(0xFF99B7D4),
          suffixIconColor: _focus.hasFocus ? AppColor.accentColor : const Color(0xFF99B7D4),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2.w),
        child: Builder(
          builder: (context) {
            switch (widget.type) {
              case FieldType.password:
                return FormBuilderTextField(
                  onChanged: (val) {
                    setState(() => _isShowClearButton = val != null && val.isNotEmpty);
                    widget.onChanged?.call(val);
                  },
                  buildCounter: counter,
                  name: widget.name,
                  controller: _controller,
                  autofillHints: const [AutofillHints.password],
                  initialValue: widget.initialValue,
                  keyboardAppearance: Brightness.light,
                  style: const TextStyle(fontSize: 16),
                  focusNode: _focus,
                  decoration: InputDecoration(
                    // hintText: widget.hintText,
                    labelText: widget.hintText,
                    prefixIcon: widget.prefixIcon,
                    suffixIcon: IntrinsicWidth(
                      child: Row(
                        children: [
                          if (_isShowClearButton && _focus.hasFocus)
                            IconButton(
                              onPressed: _controller.clear,
                              icon: const Icon(Icons.clear),
                            ),
                          IconButton(
                            icon: _isShowPassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                            onPressed: _toggleIconPassword,
                          ),
                        ],
                      ),
                    ),
                  ),
                  obscureText: !_isShowPassword,
                  keyboardType: TextInputType.text,
                  validator: widget.validator,
                );
              case FieldType.text:
                return FormBuilderTextField(
                  buildCounter: counter,
                  controller: _controller,
                  onChanged: (val) {
                    setState(() => _isShowClearButton = val != null && val.isNotEmpty);
                    widget.onChanged?.call(val);
                  },
                  initialValue: widget.initialValue,
                  name: widget.name,
                  focusNode: _focus,
                  autofillHints: const [AutofillHints.username],
                  keyboardAppearance: Brightness.light,
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    labelText: widget.hintText,
                    // hintText: widget.hintText,
                    prefixIcon: widget.prefixIcon,
                    suffixIcon: _isShowClearButton && _focus.hasFocus
                        ? IconButton(
                            onPressed: _controller.clear,
                            icon: const Icon(Icons.clear),
                          )
                        : null,
                  ),
                  keyboardType: TextInputType.text,
                  validator: widget.validator,
                );
              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget counter(BuildContext context, {required int currentLength, required bool isFocused, int? maxLength}) => const SizedBox();

  void _toggleIconPassword() => setState(() => _isShowPassword = !_isShowPassword);
}
