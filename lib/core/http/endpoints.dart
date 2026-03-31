abstract interface class Endpoints {
  static const String baseUrl = 'https://jeebly.runasp.net/';
  static const String updateLocation = '';

  // ****************************** Auth ********************************
  static const String register = 'api/AuthClient/register';
  static const String verifyOtp = 'api/verify-otp';
  static const String login = 'api/AuthClient/login';
  static const String forgetPassword = 'api/forgot/password';
  static const String resetPasssword = 'api/forgot/reset-password';
  static const String confirmPassword = '';
  static const String resentOtp = 'api/resend-otp';
  static const String forgetResendOtp = 'api/forgot/resend-otp';
  static const String forgetVerifyOtp = 'api/forgot/verify-otp';
  static const String logOut = 'api/logout';
  static const String refreshToken = 'api/refreshToken';
  static const String changePassword = 'api/AuthClient/change-password';

  // ****************************** Addresses ********************************
  static const String getAddresses = 'api/addresses';
  static const String addAddress = 'api/addresses';
  static  String updateAddress( {required int id})=> 'api/Addresses/$id/UpdateAddress';
  static  String deleteAddress( {required int id})=> 'api/Addresses/$id/DeleteAddress';

  // ****************************** Profile ********************************
  static const String getProfile = '/api/Account/profile';
  static const String updateProfile = 'api/update_profile';
  static const String getGovernment = 'api/governments';
  static const String getArea = 'api/areas';
  static const String getCountries = 'api/countries';
  static const String getAssociations = 'api/associations';
  static const String banners = 'api/banners';
  static const String deleteAccount = 'api/delete_account';

  // ****************************** Clients ********************************
  static const String addClient = 'api/clients/add_new';
  static const String getClients = 'api/clients/get_all';
  static String getClientDetails(int clientId) =>
      'clients/client_details/$clientId';
  static String updateClient(int clientId) => 'api/clients/update_one/$clientId';
  static const String getClientCategories = 'api/client_categories';
  static const String getIdentificationOffices = 'api/identification_offices';
  static const String cancleAuth = 'api/clients/change_client_status';
  static String deleteClient(int clientId) => 'api/clients/delete_one/$clientId';

  // ****************************** Sessions ********************************
  static const String getSessions = 'api/sessions/all';
  static const String getSessionDetails = 'api/sessions/details/';
  static const String getSessionFilter = 'api/session_types';
  static const String exportSessions = 'api/issues/export_sessions';

  // ****************************** documents ********************************
  static const String getIssuedDocuments = 'api/issues/files/';
  static String getDocs(int caseId) => 'api/issues/files/$caseId';

  // ****************************** opponent Lawyer ********************************
  static const String addOpponentLawyer = 'api/another_lawyers/add_new';
  static const String getOpponentLawyer = 'api/another_lawyers/get_all';
  static const String addOpponent = 'api/oppents/add_new';
  static const String getOpponents = 'api/oppents/get_all';

  // ****************************** Cases ********************************
  static const String getLitigations = 'litigations';
  static const String getCourts = 'courts';
  static const String getClaims = 'claims';
  static const String getCircels = 'circels';
  static const String getAttributes = 'attributes';
  static const String addCase = 'issues/make_new';
  static const String sendDetailsMailToClient = 'send_mail';
  static String updateCase(int caseId) => 'issues/edit_issue/$caseId';
  static const String addSubCase = 'issues/make_sub_issue';
  static const String getCases = 'issues/my_all';
  static String deleteCase(int caseId) => 'issues/delete_one/$caseId';
  static String getCasesDetails(int caseId) => 'issues/details/$caseId';
  static String stopNotifications(int caseId) => 'issues/stop_not/$caseId';
  static String exportCase(int caseId) => 'issues/issue_export/$caseId';

  // ****************************** Files ********************************
  static const String uploadFile = 'issues/upload_file';

  // //******************************** courts *******************************
  // static const String getCourts = 'courts';

  //************************************ session types *******************************

  static const String getSessionTypes = 'session_types';
  static const String updateSession = 'issues/update_session/';
  static const String makeDecision = 'sessions/make_decision/';

  // ****************************** friendly sites ********************************
  static const String getFriendlySites = 'websites';

  // ****************************** contact us ********************************
  static const String contactUs = 'contact_us';

  // ***************************** app setting *******************************
  static const String getAppSetting = 'app_settings';
  static const String getNotifications = 'notifications';

  // ***************************** paperTypes *******************************
  static const String getPaperTypes = 'paper_subjects';
  static const String addBailiffsPaper = 'bailiff_papers/make_new';
  static const String getBaillifsPaper = 'bailiff_papers/get_all';
  static const String recivedPreparatory = 'bailiff_papers/change_status';

  //*******************************report data ********************** */

  static const String getReportData = 'issues/issues_counts';

  //*******************************session traking ********************** */
  static const String getSessionTrake = 'issues/sessions/';

  // ***************************** Ads *******************************
  static const String ads = 'api/UploadImages/service';
}
