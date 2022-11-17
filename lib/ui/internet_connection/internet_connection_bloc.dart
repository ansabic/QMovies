import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../di/di.dart';
import '../../service/movies_service/movies_event.dart';
import '../../service/movies_service/movies_service.dart';

part 'internet_connection_event.dart';
part 'internet_connection_state.dart';

@singleton
class InternetConnectionBloc extends Bloc<InternetConnectionEvent, InternetConnectionState> {
  Timer? timer;

  InternetConnectionBloc() : super(const InternetConnectionInitial()) {
    on<StopConnectivityCheck>((event, emit) {
      timer?.cancel();
    });
    on<StartConnectivityCheck>((event, emit) {
      timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        add(CheckInternetConnection());
      });
    });
    on<CheckInternetConnection>((event, emit) async {
      try {
        final result = await InternetAddress.lookup('google.com');
        emit(RefreshedInternetState(hasAccessToInternet: result.isNotEmpty && result[0].rawAddress.isNotEmpty));
      } on SocketException catch (_) {
        emit(const RefreshedInternetState(hasAccessToInternet: false));
      }
    });
    add(StartConnectivityCheck());
  }

  @override
  void onChange(Change<InternetConnectionState> change) {
    if (!change.currentState.hasAccessToInternet && change.nextState.hasAccessToInternet) {
      getIt<MovieService>().add(CheckActivity());
    }
    super.onChange(change);
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
