// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class MyQuestionPage extends StatefulWidget {
//   const MyQuestionPage({super.key});

//   @override
//   _MyQuestionPageState createState() => _MyQuestionPageState();
// }

// class _MyQuestionPageState extends State<MyQuestionPage> {
//   // تم تعديل بنية البيانات
//   // السؤال الرئيسي الآن هو أول عنصر في القائمة
//   final List<Map<String, dynamic>> messages = [
//     // السؤال الرئيسي
//     {
//       "text": "ما هو مفهوم البرمجة الكائنية (OOP)؟",
//       "isTeacher": false, // يعتبر كرسالة من الطالب
//       "isMainQuestion": true, // علامة لتمييزه
//       "image":
//           "https://cdn-icons-png.flaticon.com/512/2721/2721297.png", // صورة من الانترنت (String)
//     },
//     // الردود
//     {
//       "text": "الجواب: هذا الموضوع يتعلق بالبرمجة الكائنية.",
//       "isTeacher": true,
//       "image": null,
//     },
//     {
//       "text": "شكراً أستاذ، هل ممكن مثال عملي؟",
//       "isTeacher": false,
//       "image": null,
//     },
//     {
//       "text": "نعم، سأضيف مثال في المحاضرة القادمة.",
//       "isTeacher": true,
//       "image": null,
//     },
//   ];

//   void _addMessage(String text, {File? image}) {
//     if (text.trim().isEmpty && image == null) return;
//     setState(() {
//       messages.add({
//         "text": text,
//         "isTeacher": false,
//         "image": image,
//       }); // الرسائل الجديدة دائمًا من الطالب
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF8FAFC),
//       appBar: AppBar(
//         title: const Text(
//           'نقاش الموضوع',
//           style: TextStyle(
//             color: Color(0xFF2F4170),
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 1,
//         iconTheme: const IconThemeData(color: Color(0xFF2F4170)),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               padding: const EdgeInsets.symmetric(vertical: 10.0),
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 final msg = messages[index];
//                 return MessageBubble(
//                   text: msg["text"],
//                   isTeacher: msg["isTeacher"],
//                   image: msg["image"], // يمكن أن يكون File أو String
//                   isMainQuestion: msg["isMainQuestion"] ?? false,
//                 );
//               },
//             ),
//           ),
//           MessageInputField(onSend: _addMessage),
//         ],
//       ),
//     );
//   }
// }

// // -- ويدجت لعرض الصورة بملء الشاشة --
// class FullScreenImageViewer extends StatelessWidget {
//   final dynamic imageProvider; // يستقبل File أو String

//   const FullScreenImageViewer({super.key, required this.imageProvider});

//   ImageProvider _getImage() {
//     if (imageProvider is File) {
//       return FileImage(imageProvider);
//     } else if (imageProvider is String) {
//       return NetworkImage(imageProvider);
//     }
//     // في حالة وجود خطأ، يتم عرض صورة فارغة
//     return const AssetImage(
//       'assets/placeholder.png',
//     ); // تأكد من وجود صورة احتياطية
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         iconTheme: const IconThemeData(
//           color: Colors.white,
//         ), // أيقونة إغلاق بيضاء
//       ),
//       body: Center(
//         child: InteractiveViewer(
//           panEnabled: true,
//           minScale: 1.0,
//           maxScale: 4.0, // يمكن التكبير حتى 4 أضعاف
//           child: Image(image: _getImage(), fit: BoxFit.contain),
//         ),
//       ),
//     );
//   }
// }

// // -- ويدجت فقاعة الرسالة المعدلة --
// class MessageBubble extends StatelessWidget {
//   final String text;
//   final bool isTeacher;
//   final dynamic image; // يمكن أن يكون File أو String
//   final bool isMainQuestion;

//   const MessageBubble({
//     required this.text,
//     required this.isTeacher,
//     this.image,
//     this.isMainQuestion = false,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // بناء ويدجت الصورة
//     Widget? imageWidget;
//     if (image != null) {
//       // تحديد نوع الصورة (من ملف أو من رابط)
//       ImageProvider imageProvider =
//           (image is File) ? FileImage(image) : NetworkImage(image as String);

//       imageWidget = ClipRRect(
//         borderRadius: BorderRadius.circular(12),
//         child: Image(
//           image: imageProvider,
//           width: 220,
//           height: 220,
//           fit: BoxFit.cover,
//           // إظهار مؤشر تحميل أثناء جلب الصورة من الإنترنت
//           loadingBuilder: (context, child, loadingProgress) {
//             if (loadingProgress == null) return child;
//             return Container(
//               width: 220,
//               height: 220,
//               color: Colors.grey[300],
//               child: Center(
//                 child: CircularProgressIndicator(
//                   value:
//                       loadingProgress.expectedTotalBytes != null
//                           ? loadingProgress.cumulativeBytesLoaded /
//                               loadingProgress.expectedTotalBytes!
//                           : null,
//                 ),
//               ),
//             );
//           },
//         ),
//       );
//     }

//     return Column(
//       crossAxisAlignment:
//           isTeacher ? CrossAxisAlignment.start : CrossAxisAlignment.end,
//       children: [
//         // عرض عنوان "السؤال الرئيسي" فوق الرسالة الأولى فقط
//         if (isMainQuestion)
//           const Padding(
//             padding: EdgeInsets.only(right: 25, bottom: 4, top: 5),
//             child: Align(
//               child: Text(
//                 "السؤال الرئيسي",
//                 style: TextStyle(color: Colors.grey, fontSize: 12),
//               ),
//             ),
//           ),
//         Align(
//           alignment: isTeacher ? Alignment.centerLeft : Alignment.centerRight,
//           child: Container(
//             margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
//             padding: const EdgeInsets.all(12.0),
//             decoration: BoxDecoration(
//               color:
//                   isTeacher ? const Color(0xFFE2ECF8) : const Color(0xFF3C4C88),
//               borderRadius: BorderRadius.only(
//                 topLeft: const Radius.circular(18.0),
//                 topRight: const Radius.circular(18.0),
//                 bottomLeft:
//                     isTeacher
//                         ? const Radius.circular(0)
//                         : const Radius.circular(18.0),
//                 bottomRight:
//                     isTeacher
//                         ? const Radius.circular(18.0)
//                         : const Radius.circular(0),
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 if (imageWidget != null)
//                   // إضافة GestureDetector لجعل الصورة قابلة للنقر
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder:
//                               (context) =>
//                                   FullScreenImageViewer(imageProvider: image),
//                         ),
//                       );
//                     },
//                     child: imageWidget,
//                   ),
//                 if (text.isNotEmpty)
//                   Padding(
//                     padding: EdgeInsets.only(top: image != null ? 8.0 : 0),
//                     child: Text(
//                       text,
//                       textAlign: TextAlign.right,
//                       style: TextStyle(
//                         color:
//                             isTeacher ? const Color(0xFF2F4170) : Colors.white,
//                         fontSize: 15.0,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class MessageInputField extends StatefulWidget {
//   final Function(String text, {File? image}) onSend;

//   const MessageInputField({required this.onSend, super.key});

//   @override
//   _MessageInputFieldState createState() => _MessageInputFieldState();
// }

// class _MessageInputFieldState extends State<MessageInputField> {
//   final TextEditingController _controller = TextEditingController();
//   File? _image;

//   Future<void> _pickImage() async {
//     final pickedFile = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }

//   void _handleSend() {
//     widget.onSend(_controller.text, image: _image);
//     _controller.clear();
//     setState(() {
//       _image = null;
//     });
//     FocusScope.of(context).unfocus();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 3,
//             blurRadius: 5,
//             offset: const Offset(0, -3),
//           ),
//         ],
//       ),
//       child: SafeArea(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             if (_image != null)
//               Container(
//                 margin: const EdgeInsets.only(bottom: 8.0),
//                 padding: const EdgeInsets.all(5),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(color: Colors.grey.shade300),
//                 ),
//                 child: Row(
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: Image.file(
//                         _image!,
//                         height: 60,
//                         width: 60,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     const Expanded(
//                       child: Text(
//                         "صورة محددة",
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.close, color: Colors.redAccent),
//                       onPressed: () => setState(() => _image = null),
//                     ),
//                   ],
//                 ),
//               ),
//             Row(
//               children: [
//                 IconButton(
//                   icon: const Icon(
//                     Icons.photo_camera_outlined,
//                     color: Color(0xFF3C4C88),
//                   ),
//                   onPressed: _pickImage,
//                 ),
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     textCapitalization: TextCapitalization.sentences,
//                     textAlign: TextAlign.right,
//                     decoration: InputDecoration(
//                       hintText: 'اكتب رسالتك هنا...',
//                       filled: true,
//                       fillColor: const Color(0xFFF3F4F6),
//                       contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 16,
//                         vertical: 10,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 GestureDetector(
//                   onTap: _handleSend,
//                   child: CircleAvatar(
//                     radius: 22,
//                     backgroundColor: const Color(0xFF3C4C88),
//                     child: const Icon(
//                       Icons.send,
//                       color: Colors.white,
//                       size: 20,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:ajyal/Core/utils/constants/end_points.dart';
import 'package:ajyal/Features/Community/Presentation/Bloc/replies/replies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

// -------------------- الصفحة الرئيسية --------------------
class MyQuestionPage extends StatefulWidget {
  //  final int issueId; // نمرر ID السؤال من GoRoute

  const MyQuestionPage({
    super.key,
    // required this.issueId
  });

  @override
  _MyQuestionPageState createState() => _MyQuestionPageState();
}

class _MyQuestionPageState extends State<MyQuestionPage> {
  final List<Map<String, dynamic>> _localMessages = []; // رسائل جديدة محليًا

  void _addMessage(String text, {File? image}) {
    if (text.trim().isEmpty && image == null) return;
    setState(() {
      _localMessages.add({"text": text, "isTeacher": false, "image": image});
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<RepliesCubit>().fetchReplies(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'نقاش الموضوع',
          style: TextStyle(
            color: Color(0xFF2F4170),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Color(0xFF2F4170)),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<RepliesCubit, RepliesState>(
              builder: (context, state) {
                if (state is RepliesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is RepliesFailure) {
                  return Center(child: Text("خطأ: ${state.errMsg}"));
                } else if (state is RepliesSuccess) {
                  final issue = state.repliesModel.data;

                  // تجهيز الرسائل من API
                  final List<Map<String, dynamic>> messages = [];

                  // السؤال الرئيسي
                  messages.add({
                    "text": issue.body,
                    "isTeacher": issue.authorType.contains("Teacher"),
                    "isMainQuestion": true,
                    "image":
                        issue.image != null
                            ? EndPoints.fileBaseUrl + issue.image!.path
                            : null,
                  });

                  // الردود
                  for (var reply in issue.replies) {
                    messages.add({
                      "text": reply.body,
                      "isTeacher": reply.authorType.contains("Teacher"),
                      "image":
                          reply.image != null
                              ? EndPoints.fileBaseUrl + reply.image!.path
                              : null,
                    });
                  }

                  // دمج رسائل الطالب الجديدة (محلية)
                  messages.addAll(_localMessages);

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final msg = messages[index];
                      return MessageBubble(
                        text: msg["text"],
                        isTeacher: msg["isTeacher"],
                        image: msg["image"],
                        isMainQuestion: msg["isMainQuestion"] ?? false,
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          ),
          MessageInputField(onSend: _addMessage),
        ],
      ),
    );
  }
}

// -------------------- عرض الصورة --------------------
class FullScreenImageViewer extends StatelessWidget {
  final dynamic imageProvider; // File أو String

  const FullScreenImageViewer({super.key, required this.imageProvider});

  ImageProvider _getImage() {
    if (imageProvider is File) {
      return FileImage(imageProvider);
    } else if (imageProvider is String) {
      return NetworkImage(imageProvider);
    }
    return const AssetImage('assets/placeholder.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: InteractiveViewer(
          panEnabled: true,
          minScale: 1.0,
          maxScale: 4.0,
          child: Image(image: _getImage(), fit: BoxFit.contain),
        ),
      ),
    );
  }
}

// -------------------- فقاعة الرسالة --------------------
class MessageBubble extends StatelessWidget {
  final String text;
  final bool isTeacher;
  final dynamic image;
  final bool isMainQuestion;

  const MessageBubble({
    required this.text,
    required this.isTeacher,
    this.image,
    this.isMainQuestion = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget? imageWidget;
    if (image != null) {
      ImageProvider imageProvider =
          (image is File) ? FileImage(image) : NetworkImage(image as String);

      imageWidget = ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image(
          image: imageProvider,
          width: 220,
          height: 220,
          fit: BoxFit.cover,
        ),
      );
    }

    return Column(
      crossAxisAlignment:
          isTeacher ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        if (isMainQuestion)
          const Padding(
            padding: EdgeInsets.only(right: 25, bottom: 4, top: 5),
            child: Align(
              child: Text(
                "السؤال الرئيسي",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ),
        Align(
          alignment: isTeacher ? Alignment.centerLeft : Alignment.centerRight,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color:
                  isTeacher ? const Color(0xFFE2ECF8) : const Color(0xFF3C4C88),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(18.0),
                topRight: const Radius.circular(18.0),
                bottomLeft:
                    isTeacher
                        ? const Radius.circular(0)
                        : const Radius.circular(18.0),
                bottomRight:
                    isTeacher
                        ? const Radius.circular(18.0)
                        : const Radius.circular(0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (imageWidget != null)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  FullScreenImageViewer(imageProvider: image),
                        ),
                      );
                    },
                    child: imageWidget,
                  ),
                if (text.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(top: image != null ? 8.0 : 0),
                    child: Text(
                      text,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color:
                            isTeacher ? const Color(0xFF2F4170) : Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// -------------------- صندوق إدخال الرسائل --------------------
class MessageInputField extends StatefulWidget {
  final Function(String text, {File? image}) onSend;

  const MessageInputField({required this.onSend, super.key});

  @override
  _MessageInputFieldState createState() => _MessageInputFieldState();
}

class _MessageInputFieldState extends State<MessageInputField> {
  final TextEditingController _controller = TextEditingController();
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _handleSend() {
    widget.onSend(_controller.text, image: _image);
    _controller.clear();
    setState(() => _image = null);
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_image != null)
              Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        _image!,
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        "صورة محددة",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.redAccent),
                      onPressed: () => setState(() => _image = null),
                    ),
                  ],
                ),
              ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.photo_camera_outlined,
                    color: Color(0xFF3C4C88),
                  ),
                  onPressed: _pickImage,
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: 'اكتب رسالتك هنا...',
                      filled: true,
                      fillColor: const Color(0xFFF3F4F6),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: _handleSend,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: const Color(0xFF3C4C88),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
