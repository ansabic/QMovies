import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_movies/common/assets.dart';
import 'package:q_movies/common/custom_colors.dart';

import '../main_screen_bloc.dart';

class BottomNav extends StatelessWidget {
  final double bottomNavHeight = 60;
  final double iconSize = 20;

  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenBloc, MainScreenState>(
      builder: (context, state) {
        return Container(
          height: bottomNavHeight,
          decoration: const BoxDecoration(color: Colors.black),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  BlocProvider.of<MainScreenBloc>(context).add(ChangePage(page: 0));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 60.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 2,
                          width: 110,
                          decoration: BoxDecoration(
                              color: state.page == 0 ? CustomColors.qOrange : Colors.black,
                              borderRadius: BorderRadius.circular(2))),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Image.asset(
                              Assets.movies,
                              color: state.page == 0 ? CustomColors.qOrange : Colors.white,
                              height: iconSize,
                              width: iconSize,
                            ),
                          ),
                          Text(
                            "Movies",
                            style: TextStyle(color: state.page == 0 ? CustomColors.qOrange : Colors.white),
                          )
                        ],
                      ),
                      const SizedBox()
                    ],
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  BlocProvider.of<MainScreenBloc>(context).add(ChangePage(page: 1));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 60.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 2,
                          width: 110,
                          decoration: BoxDecoration(
                              color: state.page == 1 ? CustomColors.qOrange : Colors.black,
                              borderRadius: BorderRadius.circular(2))),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Image.asset(
                              Assets.favorites,
                              color: state.page == 1 ? CustomColors.qOrange : Colors.white,
                              height: iconSize,
                              width: iconSize,
                            ),
                          ),
                          Text(
                            "Favorites",
                            style: TextStyle(color: state.page == 1 ? CustomColors.qOrange : Colors.white),
                          )
                        ],
                      ),
                      const SizedBox()
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
