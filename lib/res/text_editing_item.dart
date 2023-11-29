import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app_with_block/res/colors.dart';
import 'package:todo_app_with_block/res/text_styles.dart';


class TextEditingItem extends StatelessWidget {
  const TextEditingItem({
    super.key,
    required this.controller,
    this.suffixIcon,
    this.textStyle = const TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    this.title = '',
    this.hintText,
    this.obsecureText = false,
    this.validator,
    this.keyboardType,
    this.labelText,
    this.minLines,
    this.maxLines,
    this.maxLength = 1000,
    this.enabled,
    this.icon,
    this.textCapitalization,
    this.onTap,
    this.color = Colors.transparent,
    this.titleColor = Colors.black,
    this.inputFormatters,
    this.readOnly = false,
    this.obsecureValue = false,
    this.isRequired = false,
    this.isToolTipShow = false,
    this.hintStyle,
    this.toolTipMessage = '',
  });

  final String title;
  final int maxLength;
  final String? icon;
  final TextEditingController? controller;
  final String? hintText;
  final bool obsecureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? labelText;
  final int? minLines;
  final int? maxLines;
  final bool readOnly;
  final bool? enabled;
  final bool obsecureValue;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Widget? suffixIcon;
  final Color color;
  final Color titleColor;
  final bool isRequired;
  final bool isToolTipShow;
  final String toolTipMessage;

  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title == ''
            ? Container()
            : Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Container(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(

                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                  fontSize: 12, color: titleColor, fontWeight: FontWeight.w500),
                            ),
                            isRequired
                                ? Text(
                              ' *',
                              style: TextStyle(
                                  fontSize: TextStylesData.smallFontSize,
                                  color: AppColors.darkRedColor,
                                  fontWeight: FontWeight.w600),
                            )
                                : SizedBox(),
                          ],
                        ),
                      ],
                    ),

                  ),
                ),
              ),
        TextFormField(
          controller: controller,
          textInputAction: TextInputAction.next,
          keyboardType: keyboardType,
          obscureText: obsecureText,
          style: textStyle,
          maxLines: maxLines,
          minLines: minLines,
          validator: validator,
          enabled: enabled,
          maxLength: maxLength,
          onTap: onTap,
          readOnly: readOnly,
          onChanged: (value) {},
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            filled: true,
            counter: Offstage(),
            focusColor: Colors.white,
            fillColor: color,
            hintText: hintText,

            hintStyle: hintStyle ??
                TextStyle(
                  color: AppColors.greyColor.withOpacity(0.4),
                  fontSize: TextStylesData.extraSmallFontSize,
                  fontFamily: "verdana_regular",
                  fontWeight: FontWeight.w400,
                ),

            suffixIcon: suffixIcon,

            prefixIcon: icon == null
                ? null
                : Icon(
                    hintText == 'Email Address'
                        ? Icons.email_outlined
                        : hintText == 'Password'
                            ? Icons.lock_outline
                            : hintText == 'Confirm Password'
                                ? Icons.lock_outline
                                : Icons.person_outline_sharp,
                    color: AppColors.darkBlueColor,
                  ),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

            //add prefix icon

            // errorText: "Error",

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: AppColors.greyColor,
                width: 0.5,
              ),
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: AppColors.greyColor,
                width: 0.5,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.greyColor, width: 0.5),
              borderRadius: BorderRadius.circular(10.0),
            ),
            labelStyle: TextStyle(
              color: AppColors.greyColor,
              fontSize: TextStylesData.smallFontSize,
              fontFamily: "verdana_regular",
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
