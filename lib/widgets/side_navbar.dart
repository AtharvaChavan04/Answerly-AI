import 'package:answerly_ai/theme/colors.dart';
import 'package:answerly_ai/widgets/side_bar_button.dart';
import 'package:flutter/material.dart';

class SideNavbar extends StatefulWidget {
  const SideNavbar({super.key});

  @override
  State<SideNavbar> createState() => _SideNavbarState();
}

class _SideNavbarState extends State<SideNavbar> {
  bool isCollapsed = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      child: Container(
        width: isCollapsed ? 64 : 150,
        color: AppColors.sideNav,
        child: Column(
          children: [
            const SizedBox(height: 16),
            Icon(
              Icons.auto_awesome_mosaic,
              color: AppColors.whiteColor,
              size: isCollapsed ? 30 : 60,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: isCollapsed
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  SideBarButton(
                    isCollapsed: isCollapsed,
                    icon: Icons.add,
                    text: "Home",
                  ),
                  SideBarButton(
                    isCollapsed: isCollapsed,
                    icon: Icons.search,
                    text: "Search",
                  ),
                  SideBarButton(
                    isCollapsed: isCollapsed,
                    icon: Icons.language,
                    text: "Spaces",
                  ),
                  SideBarButton(
                    isCollapsed: isCollapsed,
                    icon: Icons.auto_awesome,
                    text: "Discover",
                  ),
                  SideBarButton(
                    isCollapsed: isCollapsed,
                    icon: Icons.cloud_outlined,
                    text: "Library",
                  ),
                  const Spacer(),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 14),
                  child: Icon(
                    isCollapsed
                        ? Icons.keyboard_arrow_right
                        : Icons.keyboard_arrow_left,
                    color: AppColors.whiteColor,
                    size: 22,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
