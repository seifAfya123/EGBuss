const String baseURL2 = "";
const String baseURL = "";
const String appLanguageSharedKey = 'appLanguageSharedKey';

class EndPoints {
  // OWNER main EP
  static const String EP_OWNER_LOGIN = "/owner/sign-in";
  static const String EP_OWNER_LOGOUT = "/owner/sign-out"; //************* */
  static const String EP_OWNER_REGISTER = "/owner/sign-up";
  static const String EP_OWNER_VERIFY_ACCOUNT = "/owner/verify/"; // add phone
  static const String EP_OWNER_DELETE_ACCOUNT = "/owner/delete"; //****** */
  // OWNER with USER EP
  static const String EP_OWNER_ADD_USER = "/owner/sign-up";
  static const String EP_OWNER_DELETE_USER = "/owner/sign-up";
  static const String EP_OWNER_UPDATE_USER = "/owner/sign-up";
  // OWNER with PRODUCTS EP
  static const String EP_OWNER_GET_PRODUCTS = "/owner/sign-up";
  static const String EP_OWNER_GET_ANALYSIS = "/owner/sign-up";
  // OWNER with NOTIFICATIONS and ORDERS
  static const String EP_OWNER_GET_NOTIFICATION = "/owner/sign-up";
  static const String EP_OWNER_RESPOND_TO_ORDER = "/owner/sign-up";
  static const String EP_OWNER_GET_ORDER = "/owner/sign-up";
  // USER main EP
  static const String EP_USER_LOGIN = "/owner/sign-up";
  static const String EP_USER_LOGOUT = "/owner/sign-up";
  static const String EP_USER_SEND_SALES = "/owner/sign-up";
  static const String EP_USER_GET_PRODUCTS = "/owner/sign-up";
  // static const String EP_USER_GET_PRODUCTS = "/owner/sign-up";

}
