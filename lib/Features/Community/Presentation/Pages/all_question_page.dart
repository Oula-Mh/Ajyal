import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Community/Data/repo/issue_repoimp.dart';
import 'package:ajyal/Features/Community/Presentation/Bloc/issue_list_cubit/issue_list_cubit.dart';
import 'package:ajyal/Features/Community/Presentation/widgets/faq_tab_view.dart';
import 'package:ajyal/Features/Community/Presentation/widgets/question_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AllQuestionPage extends StatefulWidget {
  final int subjectId;
  const AllQuestionPage({super.key, required this.subjectId});

  @override
  State<AllQuestionPage> createState() => _AllQuestionPageState();
}

class _AllQuestionPageState extends State<AllQuestionPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late IssueListCubit _issueListCubit;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _issueListCubit = IssueListCubit(getit<IssueRepoImpl>());

    // تحميل أول تاب افتراضيًا
    _issueListCubit.fetchFaqQuestions(widget.subjectId);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;
      if (_tabController.index == 0) {
        _issueListCubit.fetchFaqQuestions(widget.subjectId);
      } else if (_tabController.index == 1) {
        _issueListCubit.fetchAllQuestions(widget.subjectId);
      } else {
        _issueListCubit.fetchMyQuestions(widget.subjectId);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _issueListCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _issueListCubit,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'الأسئلة المطروحة',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColor.primaryColor,
          elevation: 4.0,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            indicatorWeight: 4.0,
            labelStyle: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
            tabs: const [
              Tab(text: 'المتكررة'),
              Tab(text: 'جميع الأسئلة'),
              Tab(text: 'أسئلتي'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 13),
          child: BlocBuilder<IssueListCubit, IssueListState>(
            builder: (context, state) {
              if (state is IssueListLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is IssueListLoaded) {
                if (_tabController.index == 2) {
                  return Column(
                    children: [
                      Expanded(
                        child: QuestionListView(
                          questions: state.issues,
                          id: widget.subjectId,
                        ),
                      ),
                      _buildEnterQuestionBar(widget.subjectId),
                    ],
                  );
                } else {
                  return FaqTabView(questions: state.issues);
                }
              } else if (state is IssueListFailure) {
                return Center(child: Text("خطأ: ${state.errMessage}"));
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildEnterQuestionBar(int id) {
    return MaterialButton(
      onPressed: () {
        GoRouter.of(context).push(AppRouter.addIssuePage, extra: id);
      },
    );
  }
}
