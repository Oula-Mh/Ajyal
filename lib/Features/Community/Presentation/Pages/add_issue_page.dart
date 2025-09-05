import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Features/Community/Presentation/Bloc/issue_list_cubit/issue_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddIssuePage extends StatelessWidget {
  final int curriculumId;
  const AddIssuePage({super.key, required this.curriculumId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: BlocConsumer<IssueListCubit, IssueListState>(
          listener: (context, state) {
            if (state is IssueListFailure) {
              customAlert(context, state.errMessage, () {
                Navigator.of(context).pop();
              });
            } else if (state is AddIssueDone) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
              GoRouter.of(context).pop(true);
            }
          },
          builder: (context, state) {
            final cubit = IssueListCubit.get(context);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  Text(
                    "يمكنك إضافة سؤال هنا",
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 24),
                  AddIssueWidget(id: curriculumId, cubit: cubit, state: state),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class AddIssueWidget extends StatefulWidget {
  final IssueListCubit cubit;
  final IssueListState state;
  final int id;

  const AddIssueWidget({
    super.key,
    required this.cubit,
    required this.id,
    required this.state,
  });

  @override
  _AddIssueWidgetState createState() => _AddIssueWidgetState();
}

class _AddIssueWidgetState extends State<AddIssueWidget> {
  File? selectedImage;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  void removeImage() {
    setState(() {
      selectedImage = null;
    });
  }

  void showFullImage(File image) {
    showDialog(
      context: context,
      builder:
          (_) => Dialog(
            backgroundColor: Colors.transparent,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Image.file(image),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // حقل النص
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 244, 246, 247),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: TextField(
            maxLines: 6,
            controller: widget.cubit.issueController,
            decoration: const InputDecoration(
              hintText: "أدخل رسالتك هنا ... ",
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),

        const SizedBox(height: 20),

        // النص + زر إضافة الصورة
        if (selectedImage == null)
          Row(
            children: [
              Expanded(
                child: Text(
                  "يمكنك إضافة صورة هنا",
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: pickImage,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 244, 246, 247),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.image, color: AppColor.purple),
                      const SizedBox(width: 5),
                      const Text(
                        "إضافة",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

        // عرض الصورة المختارة مع زر الحذف
        if (selectedImage != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () => showFullImage(selectedImage!),
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: FileImage(selectedImage!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: removeImage,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: const Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),

        const SizedBox(height: 20),

        // زر الإرسال
        widget.state is IssueListLoading
            ? const CircularProgressIndicator()
            : SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: AppColor.primaryColor),
                  ),
                ),
                onPressed: () {
                  widget.cubit.addIssue(
                    widget.id,
                    widget.cubit.issueController.text,
                    selectedImage,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Transform.flip(
                      flipX: true,
                      child: Icon(Icons.send, color: AppColor.white1),
                    ),
                    const SizedBox(width: 15),
                    const Text(
                      "إرسال",
                      style: TextStyle(fontSize: 16, color: AppColor.white1),
                    ),
                  ],
                ),
              ),
            ),
      ],
    );
  }
}
