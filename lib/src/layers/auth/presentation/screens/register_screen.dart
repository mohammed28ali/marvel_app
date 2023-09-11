import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/src/config/router/app_routes.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_colors.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_font.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_icons.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_strings.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_values.dart';
import 'package:marvel_app/src/core/utils/shared/Navigator.dart';
import 'package:marvel_app/src/core/utils/shared/custom_snack_bar.dart';
import 'package:marvel_app/src/core/utils/shared/progress_indicator.dart';
import 'package:marvel_app/src/layers/auth/presentation/cubit/auth_cubit.dart';
import 'package:marvel_app/src/layers/auth/presentation/screens/login_screen.dart';
import 'package:marvel_app/src/layers/auth/presentation/widgets/custom_column.dart';
import 'package:marvel_app/src/layers/auth/presentation/widgets/custom_rich_text.dart';
import 'package:marvel_app/src/layers/auth/presentation/widgets/custom_text.dart';
import 'package:marvel_app/src/layers/auth/presentation/widgets/custom_text_button.dart';
import 'package:marvel_app/src/layers/auth/presentation/widgets/custom_text_form_field.dart';
import '../../../../core/utils/shared_widgets/custom_singlechildscrollview.dart';
import '../../../../core/utils/shared_widgets/custom_sizedbox_height.dart';
import '../../../../core/utils/validation/valid.dart';

class ReigsterScreen extends StatefulWidget {
  const ReigsterScreen({super.key});

  @override
  State<ReigsterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<ReigsterScreen> with RestorationMixin {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  late String email;
  late String password;
  RestorableBoolN checkboxValue = RestorableBoolN(false);
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  String? get restorationId => 'checkbox';
  final AppPhrases appPhrases = AppPhrases();
  late final double mediaQuerySizeOfHeight = MediaQuery.of(context).size.height;
  late CustomSizedBoxHeight sizedBoxOfHeight_20;
  late CustomSizedBoxHeight sizedBoxOfHeight_40;
  late CustomSizedBoxHeight sizedBoxOfHeight_90;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    sizedBoxOfHeight_20 =
        CustomSizedBoxHeight(height: mediaQuerySizeOfHeight / 20);
    sizedBoxOfHeight_40 =
        CustomSizedBoxHeight(height: mediaQuerySizeOfHeight / 40);
    sizedBoxOfHeight_90 =
        CustomSizedBoxHeight(height: mediaQuerySizeOfHeight / 90);

    super.didChangeDependencies();
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(checkboxValue, 'checkbox');
  }

  @override
  void dispose() {
    checkboxValue.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _buildHeyAndEnterYourAccountText() {
    return const CustomColumn(
      children: [
        CustomText(
          title: AppStrings.hey,
          fontSize: AppFontSize.s32,
          fontWeight: AppFontWeight.bold,
        ),
        CustomText(
          title: AppStrings.enterYourAccount,
          fontSize: AppFontSize.s20,
          fontWeight: AppFontWeight.regular,
        ),
      ],
    );
  }

  Widget _buildNameTextFormFiled() {
    return CustomColumn(
      children: [
        const CustomText(title: AppStrings.name),
        sizedBoxOfHeight_90,
        CustomTextFormField(
          textEditingController: _nameController,
          keyBoardType: TextInputType.name,
          validator: (value) => validateName(value),
        ),
      ],
    );
  }

  Widget _buildEmailTextFormFiled() {
    return CustomColumn(
      children: [
        const CustomText(title: AppStrings.emailAddress),
        sizedBoxOfHeight_90,
        CustomTextFormField(
          textEditingController: _emailController,
          keyBoardType: TextInputType.emailAddress,
          validator: (value) => validateEmail(value),
          onSaved: (newValue) => email = newValue!,
        ),
      ],
    );
  }

  Widget _buildPasswordTextFormFiled() {
    return CustomColumn(
      children: [
        const CustomText(title: AppStrings.password),
        sizedBoxOfHeight_90,
        CustomTextFormField(
          textEditingController: _passwordController,
          keyBoardType: TextInputType.visiblePassword,
          obscureText: _obscureText,
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? AppIcons.visibilityOff : AppIcons.visibility,
            ),
            onPressed: _togglePasswordVisibility,
          ),
          onSaved: (newValue) => password = newValue!,
        ),
      ],
    );
  }

  Widget _buildLineOfAcceptOurPrivacyAndTerms() {
    return Row(
      children: [
        Checkbox(
          fillColor: MaterialStateProperty.all<Color>(AppColors.primaryColor),
          checkColor: AppColors.primaryColor,
          shape: const CircleBorder(),
          value: checkboxValue.value,
          onChanged: (value) {
            setState(() {
              checkboxValue.value = value;
            });
          },
        ),
        CustomRichText(
          fontSize: AppFontSize.s14,
          mainText: AppStrings.iAgreeTo,
          highlightText: AppStrings.termsAndPrivacy,
          highlightTextDecoration: TextDecoration.underline,
          colorHighlightText: AppColors.black,
          nextWidget: Scaffold(
            body: Container(
              color: AppColors.white,
              child: const Center(child: Text('ْ')),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return CustomTextButton(
      onPressed: () {
        _register(context);
      },
      textButton: AppStrings.signUp,
    );
  }

  Widget _buildSignUpSubmittedBloc() {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is SignUpLoading) {
          progressIndicator(context);
        }
        if (state is SignUpSuccess) {
          navigateAndPop(context);
          navigateAndPushNamed(context, AppRoutesStrings.homeScreenRoute, '');
        }
        if (state is SignUpError) {
          String message = (state).error;
          CustomSnackBar(context, message);
        }
      },
      child: Container(
        height: AppSize.s45,
      ),
    );
  }

  Future<void> _register(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      _formKey.currentState!.save();
      BlocProvider.of<AuthCubit>(context)
          .signUpWithEmailAndPassword(email, password);
    }
  }

  Widget _buildAlreadyHaveAccount() {
    return CustomRichText(
      mainText: AppStrings.alreadyHaveAccount,
      highlightText:
          appPhrases.phraseConstructionWithFirstStringEmpty(AppStrings.login),
      nextWidget: const LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: CustomSingleChildScrollView(
          padding: AppEdgeInsetsPaddings.registerPadding,
          children: [
            _buildHeyAndEnterYourAccountText(),
            sizedBoxOfHeight_20,
            _buildNameTextFormFiled(),
            sizedBoxOfHeight_40,
            _buildEmailTextFormFiled(),
            sizedBoxOfHeight_40,
            _buildPasswordTextFormFiled(),
            sizedBoxOfHeight_40,
            _buildLineOfAcceptOurPrivacyAndTerms(),
            sizedBoxOfHeight_20,
            _buildSignUpButton(context),
            _buildSignUpSubmittedBloc(),
            sizedBoxOfHeight_40,
            _buildAlreadyHaveAccount(),
          ],
        ),
      ),
    );
  }
}
