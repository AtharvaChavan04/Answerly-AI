import 'package:answerly_ai/theme/colors.dart';
import 'package:flutter/material.dart';

class SourcesSection extends StatefulWidget {
  const SourcesSection({super.key});

  @override
  State<SourcesSection> createState() => _SourcesSectionState();
}

class _SourcesSectionState extends State<SourcesSection> {
  List<Map<String, dynamic>> searchResults = [
    {
      "title": "Australia vs India, 4th Test - Live Cricket Score",
      "url":
          "https://www.cricbuzz.com/live-cricket-scores/91805/aus-vs-ind-4th-test-india-tour-of-australia-2024-25"
    },
    {
      "title": "Australia vs India, 4th Test - Live Cricket Score",
      "url":
          "https://www.espncricinfo.com/series/australia-vs-india-2024-25-1426547/australia-vs-india-4th-test-1426558/live-cricket-score"
    },
    {
      "title": "India vs Australia highlights, 4th Test Day 5",
      "url":
          "https://timesofindia.indiatimes.com/sports/cricket/india-vs-australia-live-score-4th-test-day-5-border-gavaskar-trophy-2024-ind-vs-aus-boxing-day-test-live-streaming-online/liveblog/116777549.cms"
    }
  ];

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
        Wrap(
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
      ],
    );
  }
}
