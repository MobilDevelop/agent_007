class Constants {
  static const baseUrl = 'http://192.168.13.145:5600';
  //static const baseUrl = 'https://abdullayevdilshodbek.jprq.live';

  static String additional = '/api/';

  static String registration = '${baseUrl + additional}login';

  static String dashboard = '${additional}mobile/dashboard';

  static String transfer = '${additional}cash_operations';
  static String moneytransfer = '${additional}cash_operations';
  static String allAgent = '${additional}cashbox/active_cashboxes';
  static String confirmation = '${additional}cash_operation/income_other_cash/';
  static String cancellation = '${additional}cash_operation/cancel_income_other_cash/';

  static String expenses = '${additional}costs';
  static String payment = '${additional}cost/pay_the_cost/';
  static String location = '${additional}location/all_active';
  static String cosyType = '${additional}cost_type/all_active';
}
