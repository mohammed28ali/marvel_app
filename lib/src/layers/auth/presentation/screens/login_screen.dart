import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/src/config/router/app_routes.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_assets.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_font.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_icons.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_strings.dart';
import 'package:marvel_app/src/core/utils/app_resources/app_values.dart';
import 'package:marvel_app/src/core/utils/shared/Navigator.dart';
import 'package:marvel_app/src/core/utils/shared/custom_snack_bar.dart';
import 'package:marvel_app/src/core/utils/shared/progress_indicator.dart';
import 'package:marvel_app/src/layers/auth/presentation/cubit/auth_cubit.dart';
import 'package:marvel_app/src/layers/auth/presentation/screens/register_screen.dart';
import 'package:marvel_app/src/layers/auth/presentation/widgets/custom_rich_text.dart';
import 'package:marvel_app/src/layers/auth/presentation/widgets/custom_text.dart';
import 'package:marvel_app/src/layers/auth/presentation/widgets/custom_text_button.dart';
import 'package:marvel_app/src/layers/auth/presentation/widgets/custom_text_form_field.dart';
import '../../../../core/utils/shared_widgets/custom_singlechildscrollview.dart';
import '../../../../core/utils/shared_widgets/custom_sizedbox_height.dart';
import '../../../../core/utils/validation/valid.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  late String email;
  late String password;
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final AppPhrases appPhrases = AppPhrases();
  late final double mediaQuerySizeOfHeight = MediaQuery.of(context).size.height;

  late final CustomSizedBoxHeight sizedBoxOfHeight_15;
  late final CustomSizedBoxHeight sizedBoxOfHeight_30;
  late final CustomSizedBoxHeight sizedBoxOfHeight_40;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    sizedBoxOfHeight_15 =
        CustomSizedBoxHeight(height: mediaQuerySizeOfHeight / 15);
    sizedBoxOfHeight_30 =
        CustomSizedBoxHeight(height: mediaQuerySizeOfHeight / 30);
    sizedBoxOfHeight_40 =
        CustomSizedBoxHeight(height: mediaQuerySizeOfHeight / 40);

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _buildMarvelImage() {
    return Image.asset(
      AppImagesPng.marvel,
      fit: BoxFit.fill,
      width: double.infinity,
    );
  }

  Widget _buildLetsConnectWithUsText() {
    return const CustomText(
      title: AppStrings.letsConnectWithUs,
      fontSize: AppFontSize.s26,
      fontWeight: AppFontWeight.bold,
    );
  }

  Widget _buildEmailTextFormFiled() {
    return CustomTextFormField(
      textEditingController: _emailController,
      keyBoardType: TextInputType.emailAddress,
      hintText: AppStrings.emailAddress,
      validator: (value) => validateEmail(value),
      onSaved: (newValue) => email = newValue!,
    );
  }

  Widget _buildPasswordTextFormFiled() {
    return CustomTextFormField(
      textEditingController: _passwordController,
      keyBoardType: TextInputType.visiblePassword,
      hintText: AppStrings.password,
      obscureText: _obscureText,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? AppIcons.visibilityOff : AppIcons.visibility,
        ),
        onPressed: _togglePasswordVisibility,
      ),
      onSaved: (newValue) => password = newValue!,
    );
  }

  Widget _buildForgotPasswordText() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: const CustomText(
          title: AppStrings.forgotPassword,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return CustomTextButton(
      onPressed: () {
        sign(context);
      },
      textButton: AppStrings.login,
    );
  }

  Widget _buildSignInSubmittedBloc() {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is SignInLoading) {
          progressIndicator(context);
        }
        if (state is SignInSuccess) {
          navigateAndPushNamed(context, AppRoutesStrings.homeScreenRoute, '');
        }
        if (state is SignInError) {
          String message = (state).error;
          CustomSnackBar(context, message);
        }
      },
      child: Container(
        height: AppSize.s45,
      ),
    );
  }

  Future<void> sign(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      _formKey.currentState!.save();
      BlocProvider.of<AuthCubit>(context)
          .signInWithEmailAndPassword(email, password);
    }
  }

  Widget _buildDoNotHaveAccount() {
    return CustomRichText(
      mainText: AppStrings.doNotHaveAccount,
      highlightText:
          appPhrases.phraseConstructionWithFirstStringEmpty(AppStrings.signUp),
      nextWidget: const ReigsterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: CustomSingleChildScrollView(
          children: [
            _buildMarvelImage(),
            sizedBoxOfHeight_30,
            Padding(
              padding: AppEdgeInsetsPaddings.loginPadding,
              child: Column(
                children: [
                  _buildLetsConnectWithUsText(),
                  sizedBoxOfHeight_15,
                  _buildEmailTextFormFiled(),
                  sizedBoxOfHeight_40,
                  _buildPasswordTextFormFiled(),
                  _buildForgotPasswordText(),
                  sizedBoxOfHeight_30,
                  _buildLoginButton(context),
                  _buildSignInSubmittedBloc(),
                  sizedBoxOfHeight_30,
                  _buildDoNotHaveAccount(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
