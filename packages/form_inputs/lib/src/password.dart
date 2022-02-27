import 'package:formz/formz.dart';

enum PasswordValidationError {
  tooShort,
  noUpperCaseChar,
  noNumberChar,
  noSpecialChar,
  noLowerCaseChar
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');

  const Password.dirty([String value = '']) : super.dirty(value);

  static final _passwordLowerCase = RegExp(r'^(?=.*[a-z])');
  static final _passwordUpperCase = RegExp(r'^(?=.*[A-Z])');
  static final _passwordNumberic = RegExp(r'^(?=.*[0-9])');
  static final _passwordSpecialChar = RegExp(r'^(?=.*[!@#$%^&*])');
  static final _passwordMinLength = RegExp(r'^(?=.{6,})');

  @override
  PasswordValidationError? validator(String? value) {
    if (!_passwordMinLength.hasMatch(value ?? '')) {
      return PasswordValidationError.tooShort;
    } else if (!_passwordLowerCase.hasMatch(value ?? '')) {
      return PasswordValidationError.noLowerCaseChar;
    } else if (!_passwordUpperCase.hasMatch(value ?? '')) {
      return PasswordValidationError.noUpperCaseChar;
    } else if (!_passwordNumberic.hasMatch(value ?? '')) {
      return PasswordValidationError.noNumberChar;
    } else if (!_passwordSpecialChar.hasMatch(value ?? '')) {
      return PasswordValidationError.noSpecialChar;
    } else
      return null;
  }

  static String? mapErrorString(PasswordValidationError error) {
    Map<PasswordValidationError, String> map = {
      PasswordValidationError.tooShort:
          'Password must be 6 characters or longer!',
      PasswordValidationError.noLowerCaseChar:
          'Password must contain at least 1 lowercase alphabetical character',
      PasswordValidationError.noUpperCaseChar:
          'Password must contain at least 1 uppercase alphabetical character',
      PasswordValidationError.noNumberChar:
          'Password must contain at least 1 numeric character',
      PasswordValidationError.noSpecialChar:
          'Password must contain at least one special character, except {? = . *}'
    };
    return map[error] ?? null;
  }
}
