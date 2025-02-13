import 'package:answerly_ai/services/chat_web_service.dart';
import 'package:answerly_ai/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnswerSection extends StatefulWidget {
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

class _AnswerSectionState extends State<AnswerSection> {
  bool isLoading = true;
  String fullResponse = '''
India beat England by 4 wickets in the 2nd ODI of the three-match series on February 9, 2025, at Barabati Stadium in Cuttack[2][1]. With this win, India secured an unassailable lead in the series[2][3].

**Brief scores:**
*   **England:** 304/10 in 49.5 overs (Joe Root 69, Ben Duckett 65; Ravindra Jadeja 3/35)[1].
*   **India:** 308/6 in 44.3 overs (Rohit Sharma 119, Shubman Gill 60; Jamie Overton 2/27)[1].

**Match Highlights:**

*   **England Innings:** England scored 304/10 in 49.5 overs. Joe Root (69) and Ben Duckett (65) were the main contributors with the bat[1]. Ravindra Jadeja took 3 wickets for 35 runs[1].
*   **India Innings:** India chased down the target, scoring 308/6 in 44.3 overs. Rohit Sharma scored a match-winning 119, and Shubman Gill contributed 60[1]. Jamie Overton took 2 wickets for 27 runs[1].
*   **Player of the Match:** Rohit Sharma was named Player of the Match for his brilliant century[1][3].
*   **Key Moments:** Rohit Sharma's "scintillating century" led India to victory[3][6]. Shubman Gill and Axar Patel also played important innings[2].
*   **England's Batting:** According to England captain Jos Buttler, the team got into good positions, but the batters needed to convert their starts into big scores[1].
*   **India's Bowling:** India's Varun Chakravarthy made his debut in this match[6].
*   **Series Status:** India leads the three-match series 2-0[2][3].

Citations:
[1] https://www.hindustantimes.com/cricket/match-result-ind-vs-eng-eng-in-ind-3-odis-2025-2nd-odi-india-vs-england-odi-inen02092025247157
[2] https://www.financialexpress.com/sports/india-vs-england-live-cricket-score-2nd-odi-ind-vs-eng-match-ball-by-ball-latest-update/3743938/
[3] https://sports.ndtv.com/india-vs-england-2025/india-vs-england-2nd-odi-live-score-england-tour-of-india-2025-ind-vs-eng-live-scorecard-updates-7668934
[4] https://www.business-standard.com/cricket/news/india-vs-england-live-score-ind-vs-eng-full-scorecard-2nd-odi-streaming-and-highlights-125020900159_1.html
[5] https://indianexpress.com/article/sports/cricket/india-vs-england-3rd-odi-playing-xi-prediction-head-to-head-stats-weather-update-squad-9829614/
[6] https://indianexpress.com/article/sports/cricket/ind-vs-eng-2nd-odi-live-score-india-vs-england-live-cricket-scorecard-updates-barabati-stadium-cuttack-9825404/lite/
[7] https://www.espncricinfo.com/series/england-in-india-2024-25-1439850
[8] https://www.espncricinfo.com/series/england-in-india-2024-25-1439850/india-vs-england-2nd-odi-1439905/match-report
[9] https://www.cricbuzz.com/cricket-series/8402/england-tour-of-india-2025/matches
''';

  @override
  void initState() {
    super.initState();
    ChatWebService().contentStream.listen((data) {
      if (isLoading = true) {
        fullResponse = "";
      }
      setState(() {
        fullResponse += data['data'];
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Answerly AI",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Skeletonizer(
          enabled: isLoading,
          child: Markdown(
            data: fullResponse,
            shrinkWrap: true,
            styleSheet:
                MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
              codeblockDecoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              code: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
