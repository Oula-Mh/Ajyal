import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ajyal/Features/Community/Presentation/bloc/replies/replies_cubit.dart';

import '../widgets/issue_card.dart';
import '../widgets/reply_card.dart';

class PublicQuestionPage extends StatefulWidget {
  final int issueId;
  const PublicQuestionPage({super.key, required this.issueId});

  @override
  State<PublicQuestionPage> createState() => _PublicQuestionPageState();
}

class _PublicQuestionPageState extends State<PublicQuestionPage> {
  bool showFullIssue = false;
  final Map<int, bool> showFullReply = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('السؤال و الردود'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: BlocBuilder<RepliesCubit, RepliesState>(
        builder: (context, state) {
          if (state is RepliesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is RepliesFailure) {
            return Center(child: Text('خطأ: ${state.errMsg}'));
          }
          if (state is RepliesSuccess) {
            final issue = state.repliesModel.data;
            return Column(
              children: [
                IssueCard(
                  issue: issue,
                  expanded: showFullIssue,
                  onToggleExpand: (v) => setState(() => showFullIssue = v),
                ),
                const Divider(height: 1),
                Expanded(
                  child: Scrollbar(
                    thumbVisibility: true,
                    thickness: 6,
                    radius: const Radius.circular(10),
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 8,
                      ),
                      itemCount: issue.replies.length,
                      itemBuilder: (context, i) {
                        final reply = issue.replies[i];
                        return ReplyCard(
                          reply: reply,
                          expanded: showFullReply[reply.id] ?? false,
                          onToggleExpand:
                              (v) =>
                                  setState(() => showFullReply[reply.id] = v),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(child: Text('لا توجد بيانات'));
        },
      ),
    );
  }
}
