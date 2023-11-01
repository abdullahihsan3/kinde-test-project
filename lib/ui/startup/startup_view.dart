import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_stacked_starter/constants/color_constants.dart';
import 'package:flutter_stacked_starter/ui/shared/app_loading.dart';
import 'package:flutter_stacked_starter/ui/startup/startup_viewmodel.dart';
import 'package:stacked/stacked.dart';


class StartupView extends StackedView<StartupViewModel> {
   const StartupView({
    super.key,
  });

  @override
  void onViewModelReady(StartupViewModel viewModel) {
    super.onViewModelReady(viewModel);
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.runStartupLogic();
    });
  }

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return const Scaffold(
      backgroundColor: AppColors.kcPrimaryColor,
      body: AppLoading(),
    );
  }

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();
}
