class AppExcaption implements Exception
{
    final message;

    AppExcaption({required this.message});

    String toString(){
      return message;
    }
}


class InternetExcaption extends AppExcaption
{
    InternetExcaption(String msg) : super(message: msg);
}


class UrlExcaption extends AppExcaption
{
    UrlExcaption(String msg) : super(message: msg);
}