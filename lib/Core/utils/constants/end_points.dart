class EndPoints {
  //with emulator

  // static const String baseUrl = 'http://10.0.2.2:8000/api/';

  // with mobile sarah
  static const String baseUrl = 'http://192.168.1.107:8000/api/';
  static const String fileBaseUrl = 'http://192.168.1.107:8000/';

  //with mobile oula
  // static const String baseUrl = 'http://192.168.64.129:8000/api/';

  //ngrok
  // static const String baseUrl =
  //     'https://5d07-185-132-133-96.ngrok-free.app/api/';

  /* ******************************************************************************** */
  // Student
  static const String checkStudent = "student/check";
  static const String login = "student/login";
  static const String register = "student/register";
  static const String studentProfile = "student/profile";
  static const String teacherProfile = "student/profile/";
  static const String logout = "student/logout";
  static const String pdf = "course/get-files/";
  static const String myCourse = "student/my-courses";
  static const String courseSubjects = "course/curricula-course/";
  static const String allCourseAdv = "advertisement/courseAdvertisements";
  static const String allTeacherAdv = "advertisement/teacherAdvertisements";
  static const String allGeneralAdv = "advertisement/generalAdvertisements";
  static const String courseDetails = "/course/show/";
  static const String subjectForTeacher =
      "/teacher/get-all-subjects-for-teacher/";

  // Parent
  static const String loginParent = 'parent/login';
  static const String registerParent = 'parent/register';
}
