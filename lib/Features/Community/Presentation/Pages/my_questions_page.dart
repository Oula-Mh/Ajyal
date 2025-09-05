// import 'dart:io';
// import 'package:ajyal/Core/utils/constants/end_points.dart';
// import 'package:ajyal/Features/Community/Presentation/Bloc/replies/replies_cubit.dart';
// import 'package:ajyal/Features/Community/Presentation/Bloc/send_reply/send_reply_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';

// // -------------------- الصفحة الرئيسية (بعد التعديل) --------------------
// class MyQuestionPage extends StatefulWidget {
//   final int issueId;

//   const MyQuestionPage({super.key, required this.issueId});

//   @override
//   _MyQuestionPageState createState() => _MyQuestionPageState();
// }

// class _MyQuestionPageState extends State<MyQuestionPage> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   Future<void> _handleSendReply(String text, {File? image}) async {
//     if (text.trim().isEmpty && image == null) return;

//     context.read<SendReplyCubit>().sendReply(
//       issueId: widget.issueId,
//       body: text,
//       image: image,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<SendReplyCubit, SendReplyState>(
//       listener: (context, state) {
//         if (state is SendReplyFailure) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(state.errMessage),
//               backgroundColor: Colors.redAccent,
//             ),
//           );
//         } else if (state is SendReplySuccess) {
//           context.read<RepliesCubit>().fetchReplies(widget.issueId);
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text("تم إرسال الرد بنجاح"),
//               backgroundColor: Colors.green,
//             ),
//           );
//         }
//       },
//       child: Scaffold(
//         backgroundColor: const Color(0xFFF8FAFC),
//         appBar: AppBar(
//           title: const Text(
//             'نقاش الموضوع',
//             style: TextStyle(
//               color: Color(0xFF2F4170),
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           backgroundColor: Colors.white,
//           elevation: 1,
//           iconTheme: const IconThemeData(color: Color(0xFF2F4170)),
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               child: BlocBuilder<RepliesCubit, RepliesState>(
//                 builder: (context, state) {
//                   if (state is RepliesLoading) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else if (state is RepliesFailure) {
//                     return Center(child: Text("خطأ: ${state.errMsg}"));
//                   } else if (state is RepliesSuccess) {
//                     final issue = state.repliesModel.data;
//                     final List<Map<String, dynamic>> messages = [];

//                     // السؤال الرئيسي
//                     messages.add({
//                       "text": issue.body,
//                       "isTeacher": issue.authorType.contains("Teacher"),
//                       "isMainQuestion": true,
//                       "image":
//                           issue.image != null
//                               ? EndPoints.fileBaseUrl + issue.image!.path
//                               : null,
//                     });

//                     // الردود
//                     for (var reply in issue.replies) {
//                       messages.add({
//                         "text": reply.body,
//                         "isTeacher": reply.authorType.contains("Teacher"),
//                         "image":
//                             reply.image != null
//                                 ? EndPoints.fileBaseUrl + reply.image!.path
//                                 : null,
//                       });
//                     }

//                     // ⛔️ لم نعد بحاجة لدمج رسائل محلية، القائمة الآن تدار بالكامل عبر Cubit
//                     return ListView.builder(
//                       padding: const EdgeInsets.symmetric(vertical: 10.0),
//                       itemCount: messages.length,
//                       itemBuilder: (context, index) {
//                         final msg = messages[index];
//                         return MessageBubble(
//                           text: msg["text"],
//                           isTeacher: msg["isTeacher"],
//                           image: msg["image"],
//                           isMainQuestion: msg["isMainQuestion"] ?? false,
//                         );
//                       },
//                     );
//                   }
//                   return const SizedBox.shrink(); // في الحالات الأخرى
//                 },
//               ),
//             ),
//             BlocBuilder<SendReplyCubit, SendReplyState>(
//               builder: (context, state) {
//                 final bool isLoading = state is SendReplyLoading;
//                 return MessageInputField(
//                   onSend: isLoading ? (_, {image}) {} : _handleSendReply,
//                   isLoading: isLoading,
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // -------------------- عرض الصورة --------------------
// class FullScreenImageViewer extends StatelessWidget {
//   final dynamic imageProvider; // File أو String

//   const FullScreenImageViewer({super.key, required this.imageProvider});

//   ImageProvider _getImage() {
//     if (imageProvider is File) {
//       return FileImage(imageProvider);
//     } else if (imageProvider is String) {
//       return NetworkImage(imageProvider);
//     }
//     return const AssetImage('assets/placeholder.png');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: Center(
//         child: InteractiveViewer(
//           panEnabled: true,
//           minScale: 1.0,
//           maxScale: 4.0,
//           child: Image(image: _getImage(), fit: BoxFit.contain),
//         ),
//       ),
//     );
//   }
// }

// // -------------------- فقاعة الرسالة --------------------
// class MessageBubble extends StatelessWidget {
//   final String text;
//   final bool isTeacher;
//   final dynamic image;
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
//     Widget? imageWidget;
//     if (image != null) {
//       ImageProvider imageProvider =
//           (image is File) ? FileImage(image) : NetworkImage(image as String);

//       imageWidget = ClipRRect(
//         borderRadius: BorderRadius.circular(12),
//         child: Image(
//           image: imageProvider,
//           width: 220,
//           height: 220,
//           fit: BoxFit.cover,
//         ),
//       );
//     }

//     return Column(
//       crossAxisAlignment:
//           isTeacher ? CrossAxisAlignment.start : CrossAxisAlignment.end,
//       children: [
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

// // -------------------- صندوق إدخال الرسائل --------------------

// class MessageInputField extends StatefulWidget {
//   final Function(String text, {File? image}) onSend;
//   final bool isLoading;

//   const MessageInputField({
//     required this.onSend,
//     this.isLoading = false,
//     super.key,
//   });

//   @override
//   _MessageInputFieldState createState() => _MessageInputFieldState();
// }

// class _MessageInputFieldState extends State<MessageInputField> {
//   final TextEditingController _controller = TextEditingController();
//   File? _image;

//   Future<void> _pickImage() async {
//     if (widget.isLoading) return;

//     final imagePicker = ImagePicker();
//     // imagePicker.pickImage يقوم بإرجاع كائن من نوع XFile
//     final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       // 💡 هنا نقوم بتحويل XFile إلى File وهو أمر ضروري
//       final tempFile = File(pickedFile.path);
//       setState(() {
//         _image = tempFile;
//       });
//     }
//   }

//   void _handleSend() {
//     if (widget.isLoading) return;

//     widget.onSend(_controller.text, image: _image);
//     _controller.clear();
//     setState(() => _image = null);
//     FocusScope.of(context).unfocus();
//   }

//   // ... باقي كود الـ build كما هو في الرد السابق ...
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
//                     child:
//                         widget.isLoading
//                             ? const SizedBox(
//                               width: 20,
//                               height: 20,
//                               child: CircularProgressIndicator(
//                                 strokeWidth: 2.5,
//                                 color: Colors.white,
//                               ),
//                             )
//                             : const Icon(
//                               Icons.send,
//                               color: Colors.white,
//                               size: 20,
//                             ),
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
import 'package:ajyal/Features/Community/Presentation/Bloc/send_reply/send_reply_cubit.dart';
import 'package:ajyal/Features/Community/Presentation/widgets/message_bubble.dart';
import 'package:ajyal/Features/Community/Presentation/widgets/message_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyQuestionPage extends StatefulWidget {
  final int issueId;

  const MyQuestionPage({super.key, required this.issueId});

  @override
  State<MyQuestionPage> createState() => _MyQuestionPageState();
}

class _MyQuestionPageState extends State<MyQuestionPage> {
  Future<void> _handleSendReply(String text, {File? image}) async {
    if (text.trim().isEmpty && image == null) return;

    context.read<SendReplyCubit>().sendReply(
      issueId: widget.issueId,
      body: text,
      image: image,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendReplyCubit, SendReplyState>(
      listener: (context, state) {
        if (state is SendReplyFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
              backgroundColor: Colors.redAccent,
            ),
          );
        } else if (state is SendReplySuccess) {
          context.read<RepliesCubit>().fetchReplies(widget.issueId);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("تم إرسال الرد بنجاح"),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      child: Scaffold(
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
                    final List<Map<String, dynamic>> messages = [];

                    messages.add({
                      "text": issue.body,
                      "isTeacher": issue.authorType.contains("Teacher"),
                      "isMainQuestion": true,
                      "image": issue.image != null
                          ? EndPoints.fileBaseUrl + issue.image!.path
                          : null,
                    });

                    for (var reply in issue.replies) {
                      messages.add({
                        "text": reply.body,
                        "isTeacher": reply.authorType.contains("Teacher"),
                        "image": reply.image != null
                            ? EndPoints.fileBaseUrl + reply.image!.path
                            : null,
                      });
                    }

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
                  return const SizedBox.shrink();
                },
              ),
            ),
            BlocBuilder<SendReplyCubit, SendReplyState>(
              builder: (context, state) {
                final bool isLoading = state is SendReplyLoading;
                return MessageInputField(
                  onSend: isLoading ? (_, {image}) {} : _handleSendReply,
                  isLoading: isLoading,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
