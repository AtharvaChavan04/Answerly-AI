import 'package:answerly_ai/services/chat_web_service.dart';
import 'package:answerly_ai/theme/colors.dart';
import 'package:answerly_ai/widgets/search_section.dart';
import 'package:answerly_ai/widgets/side_navbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    ChatWebService().connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SideNavbar(),
          Expanded(
            child: Column(
              children: [
                const Expanded(
                  child: SearchSection(),
                ),
                //Footer
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "Pro",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.footerGrey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "Enterprise",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.footerGrey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "Store",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.footerGrey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "Blog",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.footerGrey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "Careers",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.footerGrey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "English (English)",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.footerGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
