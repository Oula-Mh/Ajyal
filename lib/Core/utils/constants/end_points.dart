class EndPoints {
  // with emulator
  // static const String baseUrl = 'http://10.0.2.2:8000/api/';
  // static const String fileBaseUrl = 'http://10.0.2.2:8000/';

  // with mobile sarah
  // static const String baseUrl = 'http://192.168.1.104:8000/api/';
  // static const String fileBaseUrl = 'http://192.168.1.104:8000/';

  // with mobile oula
  static const String baseUrl = 'https://3780cd9a0f3b.ngrok-free.app/api/';
  static const String fileBaseUrl = 'https://3780cd9a0f3b.ngrok-free.app/';

  // ngrok
  // static const String baseUrl = 'https://c183bd10b4db.ngrok-free.app/api/';
  // static const String fileBaseUrl = 'https://c183bd10b4db.ngrok-free.app/';

  /* ******************************************************************************** */
  // Student
  static const String checkStudent = "student/check";
  static const String login = "student/login";
  static const String register = "student/register";
  static const String studentProfile = "student/profile";
  static const String teacherProfile = "student/profile/";
  static const String logout = "student/logout";
  static const String pdf = "course/get-files/";
  static const String myCourse = "student/my-courses/";
  static const String courseSubjects = "course/curricula-course/";
  static const String allCourseAdv = "advertisement/courseAdvertisements";
  static const String allTeacherAdv = "advertisement/teacherAdvertisements";
  static const String allGeneralAdv = "advertisement/generalAdvertisements";
  static const String courseDetails = "/course/show/";
  static const String subjectForTeacher =
      "/teacher/get-all-subjects-for-teacher/";
  static const String examPre = "quiz/my_solved_quizzes/";
  static const String examPreDetails = "quiz/my_solved_quiz_details/";
  static const String examCurrent = "quiz/all_quizzes_for_curriculum/";
  static const String examCurrentDetails = "quiz/enter/";
  static const String submitExam = "quiz/submit";
  static const String totalmean = "analysis/total-mean/";
  static const String meanForSubject = "analysis/mean/";
  static const String stddevForSubject = "analysis/stddev/";
  static const String quizzes = "analysis/quizzes/";
  static const String payment = "payment/students/";
  static const String invoices = "/courses/payments/invoices";
  static const String myCoursesDetails = "student/my-courses-with-details";
  static const String getReplies = "reply/get-replies/";
  static const String addReply = "reply/add-reply";
  static const String normalIssue = "issue/get-normal-issues/";
  static const String fqaIssue = "issue/get-is-fqa-issues/";
  static const String myissue = "issue/get-my-issues/";
  static const String addIssue = "issue/add-issue";

  // Parent
  static const String loginParent = 'parent/login';
  static const String registerParent = 'parent/register';
  static const String linkStudent = 'student/link';
  static const String allParentStudent = 'parent/parent-students';
  static const String parentProfile = 'parent/profile';
  static const String studentAnalysis = 'analysis/student/';
  static const String subjectMean = '/subjects-mean/';
  static const String totalMeanParent = '/total-mean/';
  static const String subjectMarks = '/curriculum/';
  static const String absenceDay = '/absence/get-absence/';
  static const String absenceDay2 = '/course/';
  static const String addComplaint = '/complaint/add';
  static const String allNotification = '/notification/notifications';
}
