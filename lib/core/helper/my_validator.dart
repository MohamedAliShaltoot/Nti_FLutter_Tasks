abstract class AppValidator {
  String? validate(String? value);
}

class EmailValidator extends AppValidator {

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) return 'Enter a valid email';
    return null;
  }
}

class PasswordValidator extends AppValidator {
  PasswordValidator({this.confirm});
  final String? confirm;
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if(confirm !=null)
    {
      // check equality
      if(confirm != value)
      {
        return 'Password Does not Match';
      }
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}

class PhoneValidator extends AppValidator {


  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return 'Phone number is required';
    final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
    if (!phoneRegex.hasMatch(value)) return 'Enter a valid phone number';
    return null;
  }
}

class IntegerValidator extends AppValidator {


  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return 'This field is required';
    if (int.tryParse(value) == null) return 'Enter a valid integer';
    return null;
  }
}

class RequiredValidator extends AppValidator {


  @override
  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return 'Field is required';
    return null;
  }
}
