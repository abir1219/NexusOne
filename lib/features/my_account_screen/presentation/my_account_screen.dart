import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_button_nav.dart';
import '../../../core/widgets/custom_dropdown_widget.dart';
import '../../../core/widgets/custom_textfield.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _tradeTypeController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  String? _selectedTradeType;
  String? _selectedAccountType;
  bool isChecked = false;

  final List<String> _tradeTypes = [
    'Electrical',
    'Plumbing',
    'Carpentry',
    'Painting',
    'Landscaping',
    'Other',
  ];


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.BACKGROUND_BLACK,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        bottomNavigationBar: const CustomButtonNav(pageIndex: 4),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              spacing: height * 0.02,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Account",
                  style: GoogleFonts.urbanist(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: AppColors.TEXT_COLOR_WHITE,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(child: SizedBox(
                    width: width,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/images/avatar.png"),
                            radius: 60,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 10,
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.amber,
                              ),
                              child: Center(
                                child: Icon(Icons.mode_edit_outline_outlined,size: 16,color: Colors.white,),
                              ),
                            ),
                          ),
                        ],
                      ),
                          SizedBox(height: height * 0.02,),
                          Text("Glenn Cross",style: GoogleFonts.urbanist(
                            fontSize: 24,fontWeight: FontWeight.w600,color: AppColors.TEXT_COLOR_WHITE,
                          ),),
                          SizedBox(height: height * 0.01,),
                          Text("Contractor",style: GoogleFonts.urbanist(
                            fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.TEXT_COLOR_OFF_WHITE,
                          ),),
                          SizedBox(height: height * 0.01,),
                          Text("Tap to change profile image and details.",style: GoogleFonts.urbanist(
                            fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.TEXT_COLOR_OFF_WHITE,
                          ),),
                          SizedBox(height: height * 0.03,),
                          _buildFormFields(),
                          SizedBox(height: height * 0.01,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: CustomButton.buildCustomButton(() => {}, "Update Information"),
                          )
                    ]),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      // spacing: 12,
      children: [
        CustomTextField.buildTextFieldWithLabel(
          context: context,
          controller: _fullNameController,
          hintText: 'create a strong password...',
          label: 'Full Name*',
          isPassword: false,
          obscureText: false,
        ),
        CustomDropDownWidget.buildCustomDropDownWidget(
          value: _selectedTradeType,
          hintText: 'select...',
          label: 'Trade Type*',
          items: _tradeTypes,
          context: context,
          onChanged: (value) {
            setState(() {
              _selectedTradeType = value;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a trade type';
            }
            return null;
          },
        ),
        CustomTextField.buildTextFieldWithLabel(
          context: context,
          controller: _emailController,
          hintText: 'enter your email address...',
          label: 'Email ID*',
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!RegExp(r'^[\w-\\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
        CustomTextField.buildTextFieldWithLabel(
          controller: _mobileController,
          context: context,
          maxLength: 10,
          hintText: 'enter your phone number...',
          label: 'Mobile Number*',
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your mobile number';
            }
            return null;
          },
        ),
      ],
    );
  }
}
