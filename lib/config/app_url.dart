class AppUrl {
  static const baseUrl = "http://192.168.1.48:8080";
  //static const baseUrl = "http://192.168.1.39:8080";
  //static const baseUrl = "localhost:8080";
  static const String register = "$baseUrl/register/user";
  static const String login = "$baseUrl/login/user";
  static const String getAllReport = "$baseUrl/complaintz/complaint/category";
  static const String createReport = "$baseUrl/complaintz/complaint";
  static const String getReportCategory =
      "$baseUrl/complaintz/complaint/category";
  static const String getReportStatus =
      "$baseUrl /complaintz/complaint?status=";
}
