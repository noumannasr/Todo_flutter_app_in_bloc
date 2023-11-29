import 'package:flutter/material.dart';
import 'package:todo_app_with_block/res/colors.dart';


class RoundButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final Color color;
  final double round;
  final String icon;
  final double width;
  final double height;
  final VoidCallback onPress;
  final double? fontSize;

  const RoundButton({
    super.key,
    required this.title,
    required this.width,
    required this.height,
    required this.icon,
    this.isLoading = false,
    required this.onPress,
    required this.color,
    required this.round,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.lightBlueColor,
              strokeWidth: 2,
            ),
          )
        : Container(
            height: height,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 5.0)
              ],
              color: color,
              borderRadius: BorderRadius.circular(round),
            ),
            child: ElevatedButton.icon(
              style: ButtonStyle(


                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),

                minimumSize: MaterialStateProperty.all(Size(width, 30)),
                backgroundColor: MaterialStateProperty.all(color),
                // elevation: MaterialStateProperty.all(3),
                // shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: onPress,
              icon:
              title == 'Save' ? SizedBox(width: 0,height: 0,) :
              title == 'Payments'
                  ? Image.asset(
                      icon,
                      color: AppColors.whiteColor,
                      width: 2,
                      height: 3,
                    )
                  : title == 'Details' || title == 'Pay' || title == 'Pay Now'
                      ? Image.asset(
                          icon,
                          width: 3,
                          height: 3,
                        )
                      : Image.asset(
                icon,
                width: 3,
                height: 3,
              ),
              label: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: fontSize ?? 16,
                ),
              ),
            ),
          );
  }
}
