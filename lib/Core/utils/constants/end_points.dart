class EndPoints {
  //with emulator
  // static const String baseUrlStudent = 'http://10.0.2.2:8000/api/student';
  // static const String baseUrlParent = 'http://10.0.2.2:8000/api/parent';

  // with mobile sarah
  static const String baseUrl = 'http://192.168.1.106:8000/api/';
  static const String fileBaseUrl = 'http://192.168.1.106:8000/';

  //with mobile oula
  //static const String baseUrlStudent = 'http://192.168.123.223:8000/api/';
  //static const String baseUrlParent = 'http://192.168.123.223:8000/api/';

  //ngrok
  // static const String baseUrl =
  //     'https://5d07-185-132-133-96.ngrok-free.app/api/';

  /* ******************************************************************************** */
  // Student
  static const String checkStudent = "student/check";
  static const String login = "student/login";
  static const String register = "student/register";
  static const String profile = "student/profile";
  static const String logout = "student/logout";
  static const String pdf = "course/get-files/";
  static const String allCourses = "course/all-courses";
  static const String courseSubjects = "course/curricula-course/";
  static const String allCourseAdv = "advertisement/courseAdvertisements";
  static const String allTeacherAdv = "advertisement/teacherAdvertisements";
  static const String allGeneralAdv = "advertisement/generalAdvertisements";

  // Parent
  static const String loginParent = 'parent/login';
  static const String registerParent = 'parent/register';
}
