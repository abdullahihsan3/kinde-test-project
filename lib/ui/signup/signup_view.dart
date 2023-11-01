import 'package:flutter/material.dart';
import 'package:flutter_stacked_starter/enums/authentication_layout_type.dart';
import 'package:flutter_stacked_starter/ui/shared/authentication_layout.dart';
import 'package:flutter_stacked_starter/ui/shared/custom_text_field.dart';
import 'package:flutter_stacked_starter/ui/shared/full_screen_loading.dart';
import 'package:flutter_stacked_starter/ui/shared/ui_helpers.dart';
import 'package:flutter_stacked_starter/ui/signup/signup_view.form.dart';
import 'package:flutter_stacked_starter/ui/signup/signup_viewmodel.dart';
import 'package:flutter_stacked_starter/ui/utils/custom_app_bar.dart';
import 'package:flutter_stacked_starter/ui/utils/input_validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../constants/app_keys.dart';



@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class SignUpView extends StackedView<SignUpViewModel> with $SignUpView {
  const SignUpView({super.key, this.showBackButton = true});

  final bool showBackButton;

  @override
  void onViewModelReady(SignUpViewModel viewModel) {
    super.onViewModelReady(viewModel);
    syncFormWithViewModel(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    SignUpViewModel viewModel,
    Widget? child,
  ) {
    if (viewModel.busy(AppKeys.authLoading)) return const FullScreenLoading();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Register An Account',
          showLeading: showBackButton,
          onBackPress: viewModel.back,
        ),
        body: AuthenticationLayout(
          layoutType: AuthenticationLayoutType.register,
          isBusy: viewModel.isBusy,
          form: Form(
            key: viewModel.key,
            child: Column(
              children: [
                CustomTextField(
                  controller: emailController,
                  title: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  // isSecondary: true,
                  validator: InputValidators.validateEmailAddress,
                ),
                verticalSpaceRegular,
                CustomTextField(
                  controller: passwordController,
                  title: 'Password',
                  obscureText: true,
                  // isSecondary: true,
                  validator: InputValidators.validatePasswordSignIn,
                ),
              ],
            ),
          ),
          onMainButtonTap: viewModel.saveData,
          onRedirectTap: (){},
          onAppleLogin: (x){},
          onGoogleLogin: (x){},
          googleBusy: false,
          appleBusy: false,
          kindeBusy: viewModel.busy('kindeBusy') ? true : false,
          onTapKinde: (x) =>viewModel.signUp(), 
        ),
      ),
    );
  }

  @override
  void onDispose(SignUpViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  SignUpViewModel viewModelBuilder(BuildContext context) => SignUpViewModel();
}
