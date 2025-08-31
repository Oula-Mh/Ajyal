import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Community/Presentation/widgets/faq_tab_view.dart';
import 'package:ajyal/Features/Community/Presentation/widgets/question_list_view.dart';
import 'package:flutter/material.dart';

class Question {
  final String id;
  final String text;
  final String? imageUrl; // Image is optional

  Question({required this.id, required this.text, this.imageUrl});
}

// The main page widget with the TabBar
class AllQuestionPage extends StatefulWidget {
  const AllQuestionPage({super.key});

  @override
  State<AllQuestionPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<AllQuestionPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Dummy data for the lists
  final List<Question> _faqQuestions = [
    Question(
      id: 'faq1',
      text: 'How do I reset my password?',
      imageUrl:
          'https://placehold.co/600x400/A0C4FF/333333?text=Password+Reset',
    ),
    Question(id: 'faq2', text: 'Where can I find my purchase history?'),
    Question(
      id: 'faq3',
      text: 'How to update my profile information?',
      imageUrl:
          'https://placehold.co/600x400/B5EAD7/333333?text=Profile+Update',
    ),
  ];

  final List<Question> _myQuestions = [
    Question(
      id: 'my1',
      text: 'Why is my app crashing on startup?',
      imageUrl: 'https://placehold.co/600x400/FFDDC1/333333?text=App+Crash',
    ),
    Question(
      id: 'my2',
      text: 'I have a billing inquiry about my last invoice.',
    ),
  ];

  final List<Question> _allQuestions = [
    // 🔢 رياضيات
    Question(
      id: 'math1',
      text: 'إذا كان sin θ = 3/5، أوجد cos θ و tan θ.',
      imageUrl: 'https://placehold.co/600x400/A0C4FF/333333?text=Trigonometry',
    ),
    // 📘 عربي
    Question(
      id: 'ar1',
      text: 'لِمَ يُعَدّ المتنبي من أعظم شعراء العرب في العصر العباسي؟',
      imageUrl: 'https://placehold.co/600x400/FDE2E4/333333?text=المتنبي',
    ),
    Question(
      id: 'ar2',
      text:
          'ما الفرق بين المجاز المرسل والاستعارة المكنية مع ذكر مثال يوضح الفرق بشكل دقيق وواضح للطالب؟',
    ),
    Question(
      id: 'ar3',
      text: 'اذكر ثلاثة أسباب رئيسية لظهور فن المقامة في الأدب العربي.',
      imageUrl: 'https://placehold.co/600x400/CDEAC0/333333?text=مقامة',
    ),

    Question(id: 'math2', text: 'حل المعادلة: 2x² - 5x + 3 = 0'),
    Question(
      id: 'math3',
      text:
          'ناقش: هل كل دالة زوجية تكون دورية؟ علّل إجابتك بشكل تفصيلي مع إعطاء أمثلة.',
      imageUrl: 'https://placehold.co/600x400/FFDDC1/333333?text=Functions',
    ),

    // 🧪 فيزياء
    Question(
      id: 'phy1',
      text:
          'علّل: لماذا يطفو الجليد فوق سطح الماء رغم أن كلاهما من نفس المادة؟',
      imageUrl: 'https://placehold.co/600x400/B5EAD7/333333?text=Ice+Water',
    ),
    Question(
      id: 'phy2',
      text:
          'ما العلاقة بين شدة التيار الكهربائي وفرق الجهد؟ (قانون أوم مع التطبيق).',
    ),

    // 🧪 كيمياء
    Question(
      id: 'chem1',
      text:
          'ما الفرق بين الرابطة الأيونية والرابطة التساهمية؟ أعط مثالاً لكل منهما.',
      imageUrl: 'https://placehold.co/600x400/FFFACD/333333?text=Chemistry',
    ),
    Question(
      id: 'chem2',
      text:
          'اشرح مبدأ عمل المحلول المنظم ولماذا يعد مهمًا في التفاعلات الحيوية المعقدة؟',
    ),

    // 🧬 أحياء
    Question(
      id: 'bio1',
      text: 'ما دور الميتوكوندريا في الخلية ولماذا تُسمى "بيت الطاقة"؟',
      imageUrl: 'https://placehold.co/600x400/D4A5A5/333333?text=Cell',
    ),
    Question(
      id: 'bio2',
      text:
          'اشرح باختصار آلية انتقال الأوكسجين من الدم إلى الخلايا داخل الجسم.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('الأسئلة المطروحة', style: TextStyle(color: Colors.white)),
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
        child: TabBarView(
          controller: _tabController,
          children: [
            // FAQ Tab
            FaqTabView(questions: _faqQuestions),
            // My Questions Tab
            QuestionListView(questions: _allQuestions),
            // All Questions Tab
            QuestionListView(questions: _allQuestions),
          ],
        ),
      ),
    );
  }
}
