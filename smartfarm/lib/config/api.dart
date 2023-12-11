class Api {

  static const host = 'http://192.168.0.20/api_smartfarm';

  static String login = '$host/login.php';
  static String list_user = '$host/get_user.php';
  static String list_device = '$host/get_device.php';
  static String list_device_detail = '$host/get_device_detail.php';
  static String list_land = '$host/get_land.php';
  static String list_detail_land = '$host/get_detail_land.php';
  static String list_detail_land_by_user = '$host/get_detail_land_by_login.php';
  static String add_user = '$host/add_user.php';
  static String list_detail_user = '$host/get_detail_user.php';
  static String edit_user = '$host/edit_user.php';
  static String delete_user = '$host/delete_user.php';
  static String delete_device = '$host/delete_device.php';
  static String delete_land = '$host/delete_land.php';
  static String add_devices = '$host/add_devices.php';
  static String edit_devices = '$host/edit_devices.php';
  static String add_lahan = '$host/add_land.php';
  static String edit_lahan = '$host/edit_land.php';

}