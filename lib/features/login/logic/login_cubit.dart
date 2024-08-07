import '../../../core/helpers/constants.dart';
import '../../../core/helpers/shared_pref_helper.dart';
import '../data/models/request_token_model.dart';
import '../data/models/session_model.dart';
import '../data/repos/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginInitial());

  RequestTokenModel? requestTokenModel;
  SessionModel? sessionModel;

  Future<void> getRequestToken() async {
    emit(LoginGetRequestTokenLoading());
    final result = await loginRepo.getRequestToken();
    if (result.$2) {
      requestTokenModel = result.$1;
      SharedPrefHelper.setSecuredString(
          SharedPrefKeys.requestToken, requestTokenModel!.requestToken!);
      emit(LoginGetRequestTokenSuccess());
    } else {
      emit(LoginGetRequestTokenFailure());
    }
  }

  Future<void> createSession() async {
    emit(LoginCreateSessionLoading());
    final requestToken =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.requestToken);
    final result = await loginRepo.createSession(
      body: {
        'request_token': requestToken,
      },
    );
    if (result.$2) {
      sessionModel = result.$1;
      if (sessionModel!.success! == true) {
        SharedPrefHelper.setSecuredString(
            SharedPrefKeys.sessionId, sessionModel!.sessionId!);
      }
      emit(LoginCreateSessionSuccess());
    } else {
      emit(LoginCreateSessionFailure());
    }
  }

  Future<void> getUserAccount() async {
    emit(LoginGetUserDataLoading());
    String sessionId =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.sessionId);
    final result = await loginRepo.getUserAccount(
      sessionId: sessionId,
    );
    if (result.$2) {
      AppConstants.userAccountModel = result.$1;
      SharedPrefHelper.setSecuredInt(
          SharedPrefKeys.userId, AppConstants.userAccountModel!.id!);
      emit(LoginGetUserDataSuccess());
    } else {
      emit(LoginGetUserDataFailure());
    }
  }
}
