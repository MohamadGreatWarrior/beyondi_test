import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:p2p_car_renting/features/car_details/cubit/car_details_cubit.dart';
import 'package:p2p_car_renting/features/home/models/car_model/car_model.dart';
import 'package:p2p_car_renting/global/di/di.dart';
import 'package:p2p_car_renting/global/repos/repos.dart';
import 'package:p2p_car_renting/global/theme/theme.dart';
import 'package:p2p_car_renting/global/utils/constants.dart';
import 'package:p2p_car_renting/global/utils/strings.dart';
import 'package:p2p_car_renting/global/widgets/app_snack_bar.dart';
import 'package:p2p_car_renting/global/widgets/app_text_field.dart';
import 'package:p2p_car_renting/global/widgets/buttons/buttons.dart';
import 'package:p2p_car_renting/global/widgets/loading_indicator.dart';

abstract class CarDetailsViewCallbacks {
  void onMakeChanged(String value);

  void onMakeSubmitted(String value);

  void onModelChanged(String value);

  void onModelSubmitted(String value);

  void onPriceChanged(String value);

  void onPriceSubmitted(String value);

  void onLocationChanged(String value);

  void onIsAvailableChanged(bool value);

  void submit();

  void onSubmitSuccess(SubmitCarSuccess state);

  void onSubmitError(SubmitCarError state);

  void delete();

  void onDeleteSuccess(DeleteCarSuccess state);

  void onDeleteError(DeleteCarError state);
}

@RoutePage()
class CarDetailsView extends StatelessWidget {
  const CarDetailsView({
    super.key,
    this.car = CarModel.empty,
    this.onSubmit,
    this.onDelete,
  });

  final CarModel car;
  final ValueSetter<CarModel>? onSubmit;
  final ValueSetter<CarModel>? onDelete;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => get<CarDetailsCubit>(param1: car),
      child: CarDetailsPage(
        onSubmit: onSubmit,
        onDelete: onDelete,
      ),
    );
  }
}

class CarDetailsPage extends StatefulWidget {
  const CarDetailsPage({
    super.key,
    this.onSubmit,
    this.onDelete,
  });

  final ValueSetter<CarModel>? onSubmit;
  final ValueSetter<CarModel>? onDelete;

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage>
    implements CarDetailsViewCallbacks {
  late final UserRepo userRepo = context.read();

  late final CarDetailsCubit carDetailsCubit = context.read();

  final modelFocusNode = FocusNode();

  final priceFocusNode = FocusNode();

  final locationFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    carDetailsCubit.checkIfEditing();
  }

  @override
  void dispose() {
    super.dispose();

    modelFocusNode.dispose();
    priceFocusNode.dispose();
    locationFocusNode.dispose();
  }

  @override
  void onMakeChanged(String value) {
    carDetailsCubit.editMake(value);
  }

  @override
  void onMakeSubmitted(String value) {
    modelFocusNode.requestFocus();
  }

  @override
  void onModelChanged(String value) {
    carDetailsCubit.editModel(value);
  }

  @override
  void onModelSubmitted(String value) {
    priceFocusNode.requestFocus();
  }

  @override
  void onPriceChanged(String value) {
    carDetailsCubit.editPrice(value);
  }

  @override
  void onPriceSubmitted(String value) {
    locationFocusNode.requestFocus();
  }

  @override
  void onLocationChanged(String value) {
    carDetailsCubit.editLocation(value);
  }

  @override
  void onIsAvailableChanged(bool value) {
    carDetailsCubit.editIsAvailable(value);
  }

  @override
  void submit() {
    carDetailsCubit.submitCar(
      isEdit: carDetailsCubit.isEditing,
      onSuccess: widget.onSubmit,
    );
  }

  @override
  void onSubmitSuccess(SubmitCarSuccess state) {
    AppSnackBar.showSuccessMessageBar(
      context,
      Strings.submittedSuccessfully,
    );
    context.popRoute();
  }

  @override
  void onSubmitError(SubmitCarError state) {
    AppSnackBar.showErrorMessageBar(
      context,
      state.message,
    );
  }

  @override
  void delete() {
    carDetailsCubit.deleteCar(
      onSuccess: widget.onDelete,
    );
  }

  @override
  void onDeleteSuccess(DeleteCarSuccess state) {
    AppSnackBar.showSuccessMessageBar(
      context,
      Strings.deletedSuccessfully,
    );
    context.popRoute();
  }

  @override
  void onDeleteError(DeleteCarError state) {
    AppSnackBar.showErrorMessageBar(
      context,
      state.message,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppConstants.padding16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const BackButton(),
                  Text(
                    Strings.carDetails,
                    textAlign: TextAlign.start,
                    style: context.ts.titleLarge?.copyWith(
                      fontSize: 40.sp,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              BlocBuilder<CarDetailsCubit, GeneralCarDetailsState>(
                buildWhen: (prev, curr) =>
                    curr is TextFieldState && curr.type == AddCarFieldType.make,
                builder: (context, state) {
                  return AppTextField(
                    initialText: carDetailsCubit.car.make,
                    labelText: Strings.make,
                    hintText: Strings.make,
                    errorText: state is TextFieldState ? state.error : null,
                    onChanged: onMakeChanged,
                    onSubmitted: onMakeSubmitted,
                  );
                },
              ),
              const SizedBox(height: 16),
              BlocBuilder<CarDetailsCubit, GeneralCarDetailsState>(
                buildWhen: (prev, curr) =>
                    curr is TextFieldState &&
                    curr.type == AddCarFieldType.model,
                builder: (context, state) {
                  return AppTextField(
                    focusNode: modelFocusNode,
                    initialText: carDetailsCubit.car.model,
                    labelText: Strings.model,
                    hintText: Strings.model,
                    errorText: state is TextFieldState ? state.error : null,
                    onChanged: onModelChanged,
                    onSubmitted: onModelSubmitted,
                  );
                },
              ),
              const SizedBox(height: 16),
              BlocBuilder<CarDetailsCubit, GeneralCarDetailsState>(
                buildWhen: (prev, curr) =>
                    curr is TextFieldState &&
                    curr.type == AddCarFieldType.price,
                builder: (context, state) {
                  return AppTextField(
                    focusNode: priceFocusNode,
                    initialText: carDetailsCubit.car.price.toString(),
                    labelText: Strings.price,
                    hintText: Strings.price,
                    keyboardType: TextInputType.number,
                    errorText: state is TextFieldState ? state.error : null,
                    onChanged: onPriceChanged,
                    onSubmitted: onPriceSubmitted,
                  );
                },
              ),
              const SizedBox(height: 16),
              BlocBuilder<CarDetailsCubit, GeneralCarDetailsState>(
                buildWhen: (prev, curr) =>
                    curr is TextFieldState &&
                    curr.type == AddCarFieldType.location,
                builder: (context, state) {
                  return AppTextField(
                    focusNode: locationFocusNode,
                    initialText: carDetailsCubit.car.location,
                    labelText: Strings.location,
                    hintText: Strings.location,
                    errorText: state is TextFieldState ? state.error : null,
                    onChanged: onLocationChanged,
                  );
                },
              ),
              const SizedBox(height: 8),
              BlocBuilder<CarDetailsCubit, GeneralCarDetailsState>(
                buildWhen: (prev, curr) =>
                    curr is TextFieldState &&
                    curr.type == AddCarFieldType.isAvailable,
                builder: (context, state) {
                  return SwitchListTile(
                    title: const Text(Strings.isAvailable),
                    value: carDetailsCubit.car.isAvailable,
                    onChanged: onIsAvailableChanged,
                  );
                },
              ),
              const SizedBox(height: 40),
              if (userRepo.isSignedIn)
                BlocBuilder<CarDetailsCubit, GeneralCarDetailsState>(
                  buildWhen: (prev, curr) => curr is IsEditingCarState,
                  builder: (context, state) {
                    if (state is IsEditingCarState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (state.isMine)
                            BlocConsumer<CarDetailsCubit,
                                GeneralCarDetailsState>(
                              listener: (context, state) {
                                if (state is SubmitCarError) {
                                  onSubmitError(state);
                                } else if (state is SubmitCarSuccess) {
                                  onSubmitSuccess(state);
                                }
                              },
                              builder: (context, state) {
                                VoidCallback onTap = submit;

                                if (state is SubmitCarLoading) {
                                  onTap = () {};
                                } else if (state is DeleteCarLoading) {
                                  onTap = () {};
                                }

                                return MainActionButton(
                                  text: Strings.submit,
                                  onTap: onTap,
                                  child: state is SubmitCarLoading
                                      ? const LoadingIndicator()
                                      : null,
                                );
                              },
                            ),
                          if (state.isEditing && state.isMine)
                            BlocConsumer<CarDetailsCubit,
                                GeneralCarDetailsState>(
                              listener: (context, state) {
                                if (state is DeleteCarError) {
                                  onDeleteError(state);
                                } else if (state is DeleteCarSuccess) {
                                  onDeleteSuccess(state);
                                }
                              },
                              buildWhen: (prev, curr) => curr is DeleteCarState,
                              builder: (context, state) {
                                return Column(
                                  children: [
                                    TextButton(
                                      onPressed: state is DeleteCarLoading
                                          ? null
                                          : delete,
                                      child: Text(
                                        Strings.delete,
                                        style:
                                            TextStyle(color: context.cs.error),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    if (state is DeleteCarLoading)
                                      LoadingIndicator(
                                        color: context.cs.tertiary,
                                      ),
                                  ],
                                );
                              },
                            ),
                        ],
                      );
                    }

                    return const SizedBox();
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
