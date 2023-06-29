class Constants {
  static const baseUrl = 'http://192.168.13.145:5600';

  static String additional = '/api/';

  static String registration = '${baseUrl + additional}login';
  static String dashboard = '${additional}mobile/dashboard';
  static String expenses = '${additional}costs';
  static String location = '${additional}location/all_active';
  static String cosyType = '${additional}cost_type/all_active';
}
