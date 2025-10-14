import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class CustomDropDownWidget {
  static Widget buildCustomDropDownWidget({
    required String? value,
    required String hintText,
    required String label,
    required List<String> items,
    required BuildContext context,
    required Function(String?) onChanged,
    String? Function(String?)? validator,
  }) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.1,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background container
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Container(
              // height: 65,
              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.BACKGROUND_BLACK,
                //borderSide: BorderSide(color: Colors.white.withAlpha(70), width: 1.5),
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: AppColors.TEXT_COLOR_WHITE.withAlpha(70),
                  width: 1.5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField<String>(
                    value: value,
                    dropdownColor: AppColors.BACKGROUND_BLACK,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.TEXT_COLOR_WHITE,
                    ),
                    isExpanded: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: AppColors.TEXT_COLOR_OFF_WHITE,
                        fontSize: 14,
                      ),
                    ),
                    items: [
                      DropdownMenuItem<String>(
                        value: null,
                        child: Text(
                          hintText,
                          style: TextStyle(
                            color: AppColors.TEXT_COLOR_OFF_WHITE,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      ...items.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.TEXT_COLOR_WHITE,
                            ),
                          ),
                        );
                      }),
                    ],
                    onChanged: onChanged,
                    validator: validator,
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Floating label
          Positioned(
            top: 0,
            left: 18,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              color: AppColors.BACKGROUND_BLACK,
              child: Text(
                label,
                style: GoogleFonts.urbanist(
                  color: AppColors.TEXT_COLOR_WHITE,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
