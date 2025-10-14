import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexus_one/core/constants/app_colors.dart';
import 'package:nexus_one/router/app_pages.dart';

import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_divider.dart';
import '../../../core/widgets/custom_dropdown_widget.dart';
import '../../../core/widgets/custom_google_button.dart';
import '../../../core/widgets/custom_header.dart';
import '../../../core/widgets/custom_textfield.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.BACKGROUND_BLACK,
        statusBarIconBrightness: Brightness.light, // Android → white icons
        statusBarBrightness: Brightness.dark, // iOS → white icons
      ),
      child: Scaffold(
        backgroundColor: AppColors.BACKGROUND_BLACK,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const SizedBox(height: 20),
                  _buildHeader(),
                  // const SizedBox(height: 32),
                  _buildGoogleSignUpButton(),
                  // const SizedBox(height: 24),
                  _buildDivider(),
                  // const SizedBox(height: 24),
                  _buildFormFields(),
                  const SizedBox(height: 12),
                  _buildSignUpButton(),
                  const SizedBox(height: 12),
                  _buildLoginLink(),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return CustomHeader.buildHeader(
      context,
      'Create Your Account',
      'Join us today and start exploring all the amazing features we offer.',
    );
  }

  Widget _buildGoogleSignUpButton() {
    return CustomGoogleButton.buildCustomGoogleButton(
      context,
      'Sign Up with Google',
      () {},
    );
  }

  Widget _buildDivider() {
    return CustomDivider.buildCustomDivider();
  }

  Widget _buildFormFields() {
    return Column(
      spacing: 16,
      children: [
        CustomTextField.buildTextFieldWithLabel(
          controller: _fullNameController,
          hintText: 'enter your full name...',
          label: 'Full Name*',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your full name';
            }
            return null;
          },
          context: context,
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
        // const SizedBox(height: 16),
        /*_buildDropdownField(
          value: _selectedTradeType,
          hintText: 'select...',
          label: 'Trade Type*',
          items: _tradeTypes,
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
        ),*/
        // const SizedBox(height: 16),
        CustomTextField.buildTextFieldWithLabel(
          controller: _emailController,
          context: context,
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
        // const SizedBox(height: 16),
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
        // const SizedBox(height: 16),
        CustomTextField.buildTextFieldWithLabel(
          controller: _passwordController,
          context: context,
          hintText: 'create a strong password...',
          label: 'Password*',
          isPassword: true,
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
        ),
        // const SizedBox(height: 16),
        CustomTextField.buildTextFieldWithLabel(
          context: context,
          controller: _confirmPasswordController,
          hintText: 're-enter your password...',
          label: 'Confirm Password*',
          isPassword: true,
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please confirm your password';
            }
            if (value != _passwordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
        // const SizedBox(height: 24),
        _buildAccountTypeSection(),
      ],
    );
  }

  Widget _buildDropdownField({
    required String? value,
    required String hintText,
    required String label,
    required List<String> items,
    required Function(String?) onChanged,
    String? Function(String?)? validator,
  }) {
    return Container();

    /*Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade400,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField<String>(
              initialValue: value,
              isExpanded: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                ),
              ),
              items: [
                DropdownMenuItem<String>(
                  value: null,
                  child: Text(
                    hintText,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                ),
                ...items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  );
                }).toList(),
              ],
              onChanged: onChanged,
              validator: validator,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
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
      ],
    );*/
  }

  /*Widget _buildDropdownField({
    required String? value,
    required String hintText,
    required String label,
    required List<String> items,
    required Function(String?) onChanged,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          initialValue: value,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
          items: items.map((String item) {
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }*/

  Widget _buildAccountTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account Type',
          style: GoogleFonts.urbanist(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColors.TEXT_COLOR_WHITE,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: _buildAccountTypeCard(
                title: 'Solo Contractor?',
                isSelected: _selectedAccountType == 'Solo Contractor',
                onTap: () {
                  setState(() {
                    _selectedAccountType = 'Solo Contractor';
                  });
                },
              ),
            ),
            //const SizedBox(width: 12),
            Flexible(
              child: _buildAccountTypeCard(
                title: 'Multi Crew Contractor',
                isSelected: _selectedAccountType == 'Multi Crew Contractor',
                onTap: () {
                  setState(() {
                    _selectedAccountType = 'Multi Crew Contractor';
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        InkWell(
          splashColor: Colors.transparent,
          onTap: () => setState(() => isChecked = !isChecked),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform.scale(
                scale: 0.9,
                child: Checkbox(
                  value: isChecked,
                  onChanged: (value) => setState(() => isChecked = value!),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  side: WidgetStateBorderSide.resolveWith(
                    (states) => BorderSide(
                      color: AppColors.TEXT_COLOR_OFF_WHITE,
                      width: 0.8,
                    ),
                  ),
                  checkColor: AppColors.TEXT_COLOR_WHITE,
                  activeColor: AppColors.BACKGROUND_BLACK,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: const VisualDensity(
                    horizontal: -4,
                    vertical: -4,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.urbanist(
                      fontSize: 14,
                      color: AppColors.TEXT_COLOR_WHITE,
                      fontWeight: FontWeight.w400,
                      height: 1.6,
                      // height: 1.4,
                    ),
                    children: [
                      const TextSpan(text: 'By signing up, you agree to our '),
                      TextSpan(
                        text: 'Terms & Conditions and ',
                        // style: const TextStyle(
                        //   color: Colors.white,
                        //   fontWeight: FontWeight.w600,
                        //   decoration: TextDecoration.underline,
                        // ),
                      ),
                      // const TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy.',
                        // style: const TextStyle(
                        //   color: Colors.white,
                        //   fontWeight: FontWeight.w600,
                        //   decoration: TextDecoration.underline,
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAccountTypeCard({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Dynamically adjust font size based on available width 👇
          double fontSize = constraints.maxWidth < 180 ? 13 : 16;

          return Row(
            children: [
              Icon(
                isSelected ? Icons.check_circle : Icons.circle,
                color: isSelected
                    ? AppColors.SELECTION_COLOR
                    : AppColors.UNSELECTION_COLOR,
                size: 20,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown, // ✅ Shrinks text if needed
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w400,
                      color: AppColors.TEXT_COLOR_OFF_WHITE,
                      fontSize: fontSize,
                    ),
                    maxLines: 1,
                    softWrap: false,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /*Widget _buildAccountTypeCard({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            isSelected ? Icons.check_circle_sharp : Icons.circle,
            color: isSelected
                ? AppColors.SELECTION_COLOR
                : AppColors.UNSELECTION_COLOR,
            size: 20,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              title,
              maxLines: 1, // ✅ Only one line
              overflow: TextOverflow.ellipsis, // ✅ Show "..." if too long
              softWrap: false, // ✅ Prevent line breaks
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w400,
                color: AppColors.TEXT_COLOR_OFF_WHITE,
              ),
            ),
          ),
        ],
      ),
    );
  }*/

  Widget _buildSignUpButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: CustomButton.buildCustomButton(() => _handleSignUp(), "Sign Up"),
    );
  }

  Widget _buildLoginLink() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Already have an account? ',
        style: GoogleFonts.urbanist(
          color: AppColors.TEXT_COLOR_OFF_WHITE,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(
            text: 'Login',
            style: GoogleFonts.urbanist(
              color: AppColors.TEXT_COLOR_WHITE,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
              decorationThickness: 1.0,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.go(AppPages.LOGIN_SCREEN);
                // 👉 Navigate to login screen here
                debugPrint('Login tapped');
              },
          ),
        ],
      ),
    );
  }

  void _handleSignUp() {
    // Implement your sign up logic here
    final userData = {
      'fullName': _fullNameController.text,
      'tradeType': _selectedTradeType,
      'email': _emailController.text,
      'mobile': _mobileController.text,
      'password': _passwordController.text,
      'accountType': _selectedAccountType,
    };

    if (kDebugMode) {
      print('User data: $userData');
    }
    context.go(AppPages.REGISTRATION_SUCCESS_SCREEN);
    // Show success message or navigate to next screen
    /*ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Account created successfully!'),
        backgroundColor: Colors.green,
      ),
    );*/
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
