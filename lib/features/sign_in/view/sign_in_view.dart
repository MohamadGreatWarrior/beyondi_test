import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:p2p_car_renting/features/authentication/bloc/authentication_bloc.dart';
import 'package:p2p_car_renting/features/sign_in/cubit/sign_in_cubit.dart';
import 'package:p2p_car_renting/global/blocs/blocs.dart';
import 'package:p2p_car_renting/global/di/di.dart';
import 'package:p2p_car_renting/global/gen/assets.gen.dart';
import 'package:p2p_car_renting/global/theme/theme.dart';
import 'package:p2p_car_renting/global/utils/strings.dart';
import 'package:p2p_car_renting/global/utils/utils.dart';
import 'package:p2p_car_renting/global/widgets/app_text_field.dart';
import 'package:p2p_car_renting/global/widgets/bottom_sheet_container.dart';
import 'package:p2p_car_renting/global/widgets/widgets.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class SignInViewCallback {
  void onBack();

  void onShowSignIn();

  void onShowSignUp();

  void onSignInOrUpError(String message);

  void onSignInSuccess(SignInSuccess state);

  void onEmailChanged(String input);

  void onEmailClear();

  void onEmailCleared();

  void onEmailSubmitted(String input);

  void onPasswordChanged(String input);

  void onPasswordClear();

  void onPasswordCleared();

  void onPasswordSubmitted(String input);

  void onMainAction();

  void onAlterOption();

  void onAsGuest();
}

@RoutePage()
class SignInView extends StatelessWidget {
  const SignInView({
    super.key,
    this.reduceSpace = false,
    this.showBackButton = false,
    this.showContinueAsGuest = true,
    this.onSignedIn,
  });

  final bool reduceSpace;
  final bool showBackButton;
  final bool showContinueAsGuest;
  final VoidCallback? onSignedIn;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => get<SignInCubit>(),
      child: SignInPage(
        reduceSpace: reduceSpace,
        showBackButton: showBackButton,
        showContinueAsGuest: showContinueAsGuest,
        onSignedIn: onSignedIn,
      ),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({
    super.key,
    required this.reduceSpace,
    required this.showBackButton,
    this.showContinueAsGuest = true,
    this.onSignedIn,
  });

  final bool reduceSpace;
  final bool showBackButton;
  final bool showContinueAsGuest;
  final VoidCallback? onSignedIn;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> implements SignInViewCallback {
  late final AuthenticationBloc authenticationBloc = context.read();

  late final PermissionsCubit permissionsCubit = context.read();

  late final SignInCubit signInCubit = context.read();

  final emailTextController = TextEditingController();

  final passwordTextController = TextEditingController();

  final passwordFocusNode = FocusNode();

  bool showSignIn = false;

  bool showSignUp = false;

  bool get showForm => showSignIn || showSignUp;

  @override
  void initState() {
    super.initState();
    setStatusBarColor(Colors.transparent, brightness: Brightness.light);

    permissionsCubit.requestPermission(Permission.notification);
  }

  @override
  void dispose() {
    super.dispose();

    emailTextController.dispose();
    passwordTextController.dispose();
    passwordFocusNode.dispose();
  }

  @override
  void onBack() {
    if (showForm) {
      signInCubit.resetAll();

      setState(() {
        showSignIn = false;
        showSignUp = false;
      });
    } else if (widget.showBackButton) {
      authenticationBloc.add(GuestRequested());
    }
  }

  @override
  void onShowSignIn() {
    setState(() {
      showSignIn = true;
      showSignUp = false;
    });
  }

  @override
  void onShowSignUp() {
    setState(() {
      showSignUp = true;
      showSignIn = false;
    });
  }

  @override
  void onSignInOrUpError(String message) {
    AppSnackBar.showErrorMessageBar(
      context,
      message,
      duration: const Duration(seconds: 7),
    );
  }

  @override
  void onSignInSuccess(SignInSuccess state) {
    authenticationBloc.add(SignInRequested(state.userModel));
  }

  @override
  void onEmailChanged(String input) {
    signInCubit.addEmail(input);
  }

  @override
  void onEmailClear() {
    signInCubit.resetEmail();
  }

  @override
  void onEmailCleared() {
    emailTextController.clear();
  }

  @override
  void onEmailSubmitted(String input) {
    passwordFocusNode.requestFocus();
  }

  @override
  void onPasswordChanged(String input) {
    signInCubit.addPassword(input);
  }

  @override
  void onPasswordClear() {
    signInCubit.resetPassword();
  }

  @override
  void onPasswordCleared() {
    passwordTextController.clear();
  }

  @override
  void onPasswordSubmitted(String input) {
    onMainAction();
  }

  @override
  void onAlterOption() {
    setState(() {
      showSignIn = !showSignIn;
      showSignUp = !showSignUp;
    });
  }

  @override
  void onMainAction() {
    if (showSignIn) {
      signInCubit.signIn();
    } else if (showSignUp) {
      signInCubit.signUp();
    }
  }

  @override
  void onAsGuest() {
    authenticationBloc.add(GuestRequested());
  }

  Widget buildAlterOption() {
    String text = '';
    String button = '';

    if (showSignIn) {
      text = Strings.doNotHaveAccount;
      button = Strings.signup;
    } else if (showSignUp) {
      text = Strings.alreadyHaveAccount;
      button = Strings.login;
    }

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: context.ts.titleMedium?.copyWith(fontSize: 14),
        children: [
          TextSpan(text: text),
          const TextSpan(text: ' '),
          WidgetSpan(
            child: InkWell(
              onTap: () => onAlterOption(),
              child: Text(
                button,
                style: TextStyle(color: context.cs.secondary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMainActionButton({
    VoidCallback? onTap,
    Widget? child,
  }) {
    String text = Strings.login;

    if (showSignIn) {
      text = Strings.login;
    } else if (showSignUp) {
      text = Strings.signup;
    }

    return GradientMainActionButton(
      text: text,
      textStyle: TextStyle(fontSize: 20.sp),
      onTap: onTap,
      child: child,
    );
  }

  Widget get buildContent {
    return Positioned.fill(
      child: HorizontalPadding(
        child: Column(
          children: [
            Spacer(
              flex: widget.reduceSpace ? 30 : 40,
            ),
            Expanded(
              flex: 62,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AnimatedSwitcherWithFade(
                    child: showForm
                        ? null
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                Strings.welcomeP2pCarRenting,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: context.cs.surface,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 36.sp,
                                  height: 1.1,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                Strings.p2pCarRentingDescription,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  height: 1.2,
                                  color: context.cs.surface,
                                ),
                              ),
                            ],
                          ),
                  ),
                  const Spacer(),
                  const SizedBox(height: 16),
                  buildMainActionButton(onTap: onShowSignIn),
                  SizedBox(height: 34.h),
                  if (widget.showContinueAsGuest)
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: onAsGuest,
                      child: Text(
                        Strings.continueAsGuest,
                        style: context.ts.bodyLarge?.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get buildTranslucentLayer {
    return Positioned.fill(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: showForm ? 1 : 0,
        child: GestureDetector(
          onTap: onBack,
          child: const ColoredBox(color: Colors.transparent),
        ),
      ),
    );
  }

  Widget get buildForm {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedSwitcherWithSize(
        duration: const Duration(milliseconds: 250),
        child: showForm
            ? BottomSheetContainer(
                showHandler: false,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                boxShadows: AppShadows.createShadowsForColor(
                  context.cs.onBackground,
                  blurLevel: 12,
                  color1Opacity: 0.5,
                  color2Opacity: 0.4,
                  color3Opacity: 0.2,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BlocListener<SignInCubit, GeneralSignInState>(
                      listener: (context, state) {
                        if (state is EmailReset) {
                          onEmailCleared();
                        } else if (state is SignInError) {
                          onSignInOrUpError(state.message);
                        } else if (state is SignInSuccess) {
                          onSignInSuccess(state);
                        }
                      },
                      child: const SizedBox(),
                    ),
                    SizedBox(height: 72.h),
                    BlocBuilder<SignInCubit, GeneralSignInState>(
                      buildWhen: (prev, curr) => curr is EmailState,
                      builder: (context, state) {
                        return AppTextField(
                          controller: emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          labelText: Strings.email,
                          hintText: Strings.email,
                          textInputAction: TextInputAction.next,
                          errorText: state is EmailError ? state.message : null,
                          suffixIcon: AnimatedSwitcherWithScale(
                            child: state is EmailChanged
                                ? TextFieldRemoveSuffixWidget(
                                    onTap: onEmailClear,
                                  )
                                : null,
                          ),
                          onChanged: onEmailChanged,
                          onSubmitted: onEmailSubmitted,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    BlocBuilder<SignInCubit, GeneralSignInState>(
                      buildWhen: (prev, curr) => curr is PasswordState,
                      builder: (context, state) {
                        return AppTextField(
                          focusNode: passwordFocusNode,
                          controller: passwordTextController,
                          keyboardType: TextInputType.emailAddress,
                          isPassword: true,
                          labelText: Strings.password,
                          style: TextStyle(color: context.cs.tertiary),
                          hintText: Strings.password,
                          textDirection: TextDirection.ltr,
                          textInputAction: TextInputAction.send,
                          errorText:
                              state is PasswordError ? state.message : null,
                          onChanged: onPasswordChanged,
                          onSubmitted: onPasswordSubmitted,
                        );
                      },
                    ),
                    SizedBox(height: 32.h),
                    BlocBuilder<SignInCubit, GeneralSignInState>(
                      builder: (context, state) {
                        VoidCallback onTap = onMainAction;
                        Widget? child;

                        if (state is SignInLoading || state is SignInLoading) {
                          onTap = () {};
                          child = const LoadingIndicator();
                        }

                        return buildMainActionButton(
                          onTap: onTap,
                          child: child,
                        );
                      },
                    ),
                    SizedBox(height: 24.h),
                    buildAlterOption(),
                    SizedBox(height: 96.h),
                  ],
                ),
              )
            : const SizedBox(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(Colors.transparent, brightness: Brightness.light);
    return Stack(
      children: [
        Positioned.fill(
          child: Assets.images.signIn.image(
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: AnimatedSwitcherWithScale(
                child: widget.showBackButton || showForm
                    ? BackButton(onPressed: onBack)
                    : const SizedBox(),
              ),
            ),
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Stack(
                children: [
                  buildTranslucentLayer,
                  buildContent,
                  buildForm,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
