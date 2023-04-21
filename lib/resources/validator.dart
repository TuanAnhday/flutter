import 'package:ai_care/resources/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FormValidator {
  static FormFieldValidator<String> userNameValidator() => FormBuilderValidators.compose(
    [
      FormBuilderValidators.required(errorText: 'field-required'.i18n),
      FormBuilderValidators.minLength(3, errorText: 'username-must-be-at-least-3-characters'.i18n),
      FormBuilderValidators.maxLength(50, errorText: 'username-can-only-be-up-to-50-characters'.i18n),
      FormBuilderValidators.match(r'^[a-zA-Z0-9_@.]+$', errorText: 'please-do-not-enter-special-characters-or-spaces'.i18n),
    ],
  );

  static FormFieldValidator<String> emailValidator() => FormBuilderValidators.compose(
    [
      FormBuilderValidators.required(errorText: 'field-required'.i18n),
      FormBuilderValidators.email(errorText: 'invalid-email'.i18n),
      FormBuilderValidators.minLength(3, errorText: 'email-at-least-3-characters'.i18n),
      FormBuilderValidators.maxLength(50, errorText: 'email-up-to-50-characters'.i18n),
    ],
  );

  static FormFieldValidator<String> passwordValidator() => FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: 'field-required'.i18n),
    FormBuilderValidators.minLength(6, errorText: 'password-at-least-6-characters'.i18n),
    FormBuilderValidators.match(r'^\S(.*)+$', errorText: 'please-do-not-enter-special-characters-or-spaces-in-start'.i18n),
    FormBuilderValidators.match(r'(.*)+\S$', errorText: 'please-do-not-enter-special-characters-or-spaces-in-end'.i18n),
    FormBuilderValidators.maxLength(50, errorText: 'password-up-to-50-characters'.i18n),
  ]);

  static FormFieldValidator<String> passwordConfirmValidator(String currentPassword) => FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: 'field-required'.i18n),
        (val) {
      if (val != currentPassword) return 'incorrect-confirm-password'.i18n;
      return null;
    }
  ]);
}
