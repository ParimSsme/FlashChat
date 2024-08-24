import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flash_chat_starting_project/common/utils/shared_oprator.dart';
import 'package:flash_chat_starting_project/locator.dart';
import 'package:formz/formz.dart';
import '../../../domain/exceptions/log_in_with_email_and_password.dart';
import '../../../domain/repository/authentication_repository.dart';
import '../../utils/email.dart';
import '../../utils/password.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(const LoginState());

  final AuthenticationRepository _authenticationRepository;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.email, password]),
      ),
    );
  }

  Future<void> logInWithCredentials() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authenticationRepository.logInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );

      final prefOperator = locator<SharedPrefOperator>();
      prefOperator.setUserEmail(state.email.value);

      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
