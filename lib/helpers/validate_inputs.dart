String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, ingrese una contraseña';
  }
  if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$')
      .hasMatch(value)) {
    return 'La contraseña debe tener al menos 8 caracteres, una mayúscula, una minúscula, un número y un carácter especial';
  }
  return null;
}

String? validateEmail(String? value) {
  final RegExp emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  if (value == null || value.isEmpty) {
    return 'Por favor, ingrese su correo electrónico';
  } else if (!emailRegExp.hasMatch(value)) {
    return 'Por favor, ingrese un correo electrónico válido';
  }
  return null;
}

String? validatePasswordVoid(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, ingrese la contraseña';
  }
  return null;
}
