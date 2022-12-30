class API {
  static final String baseURL = 'http://restapi.adequateshop.com/api/';
  static Endpoints endpoints = Endpoints();
}

class Endpoints {
  final String registerEmail = 'authaccount/registration';
  final String login = 'authaccount/login';
}
