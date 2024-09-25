class AppExceptions implements Exception {
  // ignore: prefer_typing_uninitialized_variables
  final _message;
  // ignore: prefer_typing_uninitialized_variables
  final _prefix;

  AppExceptions([this._message, this._prefix, ]);



  @override
  String toString(){
    return '$_prefix$_message';
  }
}


class FetchDataExceptions extends AppExceptions {
  
  FetchDataExceptions([String? message]) : super(message, 'Error During Communication');
}


class BadRequestException  extends AppExceptions{
  
  BadRequestException([String? message]) : super(message, 'Invalid Request');
}


class UnAuthorisedException  extends AppExceptions{
  
  UnAuthorisedException([String? message]) : super(message, 'UnAuthorised Request');
}


class TimeOutExceptions extends AppExceptions {
  TimeOutExceptions([String? message]) : super(message, "Request Time out");
}

class InvalidException  extends AppExceptions{
  
  InvalidException([String? message]) : super(message, 'Invalid Input');
}