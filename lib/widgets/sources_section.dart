import 'package:answerly_ai/services/chat_web_service.dart';
import 'package:answerly_ai/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SourcesSection extends StatefulWidget {
  const SourcesSection({super.key});

  @override
  State<SourcesSection> createState() => _SourcesSectionState();
}

class _SourcesSectionState extends State<SourcesSection> {
  bool isLoading = true;

  List searchResults = [
    {
      "title":
          "Rohit Sharma hits century as India surge to ODI series victory over England",
      "url":
          "https://www.theguardian.com/sport/2025/feb/09/rohit-sharma-hits-century-as-india-surge-to-odi-series-victory-over-england"
    },
    {
      "title": "Rohit hundred flattens England, India clinch ODI series",
      "url":
          "https://www.reuters.com/sports/cricket/rohit-hundred-flattens-england-india-clinch-odi-series-2025-02-09/"
    },
    {
      "title":
          "Ben Duckett would accept 3-0 series defeat if England beat India in Champions Trophy final",
      "url":
          "https://www.theguardian.com/sport/2025/feb/10/cricket-ben-duckett-accept-series-defeat-england-beat-india-champions-trophy-final"
    },
  ];

  @override
  void initState() {
    super.initState();
    ChatWebService().searchResultStream.listen((data) {
      setState(() {
        searchResults = data['data'];
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.source_outlined,
              color: Colors.white70,
            ),
            SizedBox(width: 8),
            Text(
              'Sources',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        SizedBox(height: 16),
        Skeletonizer(
          enabled: isLoading,
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: searchResults.map((res) {
              return Container(
                padding: EdgeInsets.all(16),
                width: 150,
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      res['title'],
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      res['title'],
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
