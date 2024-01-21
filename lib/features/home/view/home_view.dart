import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:p2p_car_renting/features/authentication/bloc/authentication_bloc.dart';
import 'package:p2p_car_renting/features/authentication/mixins/authentication_mixin.dart';
import 'package:p2p_car_renting/features/home/cubit/home_cubit.dart';
import 'package:p2p_car_renting/features/home/models/car_model/car_model.dart';
import 'package:p2p_car_renting/features/home/view/widgets/car_tile.dart';
import 'package:p2p_car_renting/global/di/di.dart';
import 'package:p2p_car_renting/global/router/router.dart';
import 'package:p2p_car_renting/global/theme/theme_x.dart';
import 'package:p2p_car_renting/global/utils/constants.dart';
import 'package:p2p_car_renting/global/utils/strings.dart';
import 'package:p2p_car_renting/global/widgets/fab_add_button.dart';
import 'package:p2p_car_renting/global/widgets/indexed_slide_fade_animated_tile.dart';
import 'package:p2p_car_renting/global/widgets/widgets.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class HomeViewCallbacks {
  void onSignOut();

  void onSignOutSuccess(SignOutSuccess state);

  void onSignOutError(SignOutError state);

  Future<void> onRefresh();

  void onCar(CarModel car);

  void onAdd();

  void onUnauthorized(UnauthorizedState state);
}

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => get<HomeCubit>()..getCars(),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AuthenticationMixin
    implements HomeViewCallbacks {
  late final AuthenticationBloc authenticationBloc = context.read();

  late final HomeCubit homeCubit = context.read();

  @override
  void onSignOut() {
    homeCubit.signOut();
  }

  @override
  void onSignOutSuccess(SignOutSuccess state) {
    authenticationBloc.add(SignOutRequested());
  }

  @override
  void onSignOutError(SignOutError state) {
    AppSnackBar.showErrorMessageBar(context, state.message);
  }

  @override
  Future<void> onRefresh() async {
    homeCubit.getCars();
  }

  @override
  void onAdd() {
    homeCubit.onAddCar(
      onSuccess: () {
        _pushCarDetailsRoute();
      },
      onFail: () {
        authenticationBloc.add(
          const SignInFormRequested(showSignInBackButton: true),
        );
      },
    );
  }

  @override
  void onCar(CarModel car) {
    _pushCarDetailsRoute(car: car);
  }

  void _pushCarDetailsRoute({CarModel? car}) {
    context.pushRoute(
      CarDetailsRoute(
        car: car ?? CarModel.empty,
        onSubmit: homeCubit.addCar,
        onDelete: homeCubit.deleteCar,
      ),
    );
  }

  @override
  void onUnauthorized(UnauthorizedState state) {
    authenticationBloc.add(SignOutRequested());
  }

  @override
  void onUserAuthChanged(String? signedInUser) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.home,
          style: context.ts.titleLarge?.copyWith(
            fontSize: 40.sp,
          ),
          textAlign: TextAlign.start,
        ),
        actions: [
          if (userRepo.isSignedIn)
            BlocConsumer<HomeCubit, GeneralHomeState>(
              listener: (context, state) {
                if (state is SignOutSuccess) {
                  onSignOutSuccess(state);
                } else if (state is SignOutError) {
                  onSignOutError(state);
                }
              },
              builder: (context, state) {
                if (state is SignOutLoading) {
                  return LoadingIndicator(color: context.cs.tertiary);
                }

                return InkWell(
                  onTap: onSignOut,
                  child: const Icon(Icons.logout_rounded),
                );
              },
            ),
          const SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: SingleChildScrollView(
            padding: AppConstants.padding16,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30),
                BlocBuilder<HomeCubit, GeneralHomeState>(
                  buildWhen: (prev, curr) => curr is HomeState,
                  builder: (context, state) {
                    if (state is HomeFetch) {
                      if (state.cars.isEmpty) {
                        return SizedBox(
                          height: 0.5.sh,
                          child: Center(
                            child: Text(
                              Strings.noCarsFound,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 20.sp),
                            ),
                          ),
                        );
                      }

                      return Skeletonizer(
                        enabled: state is HomeLoading,
                        child: AnimationLimiter(
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(16),
                            itemCount: state.cars.length,
                            itemBuilder: (context, index) {
                              return IndexedSlideFadeAnimatedTile(
                                index: index,
                                child: CarTile(
                                  car: state.cars[index],
                                  onTap: onCar,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: 16);
                            },
                          ),
                        ),
                      );
                    } else if (state is HomeError) {
                      return Center(
                        child: SizedBox(
                          height: 0.5.sh,
                          child: Text(
                            state.message,
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ),
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FabAddButton(
        onTap: onAdd,
      ),
    );
  }
}
