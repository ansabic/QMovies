import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_movies/common/assets.dart';
import 'package:q_movies/common/custom_colors.dart';
import 'package:q_movies/common/route_names.dart';
import 'package:q_movies/di/di.dart';
import 'package:q_movies/ui/base_scaffold/base_scaffold.dart';
import 'package:q_movies/ui/common/shine_bloc/shine_bloc.dart';
import 'package:q_movies/ui/splash_screen/splash_screen_bloc.dart';

class SplashScreen extends StatelessWidget {
  final double iconSize = 80;

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        child: BlocProvider(
      create: (_) => getIt<SplashScreenBloc>(),
      child: BlocConsumer<SplashScreenBloc, SplashScreenState>(
        listener: (context, state) async {
          if (state is ProceedState) {
            await Navigator.popAndPushNamed(context, RouteNames.mainScreen);
          }
        },
        builder: (context, state) {
          return Center(
            child: BlocProvider(
              create: (_) => ShineBloc(),
              child: BlocBuilder<ShineBloc, ShineState>(
                builder: (context, state) {
                  return Image.asset(
                    Assets.qIcon,
                    color: CustomColors.qOrange.withOpacity(state.value),
                    width: iconSize,
                    height: iconSize,
                  );
                },
              ),
            ),
          );
        },
      ),
    ));
  }
}
