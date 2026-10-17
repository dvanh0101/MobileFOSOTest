import 'package:flutter/material.dart';

import 'app_search_bar.dart';
import 'notification_bell.dart';
import '../../../theme/app_colors.dart';

/// AppBar dùng chung: [Search bar] + [Chuông thông báo].
class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    this.searchController,
    this.onSearchChanged,
    this.onSearchSubmitted,
    this.onSearchTap,
    this.onCameraTap,
    this.onBellTap,
    this.notificationCount = 0,
    this.showNotificationDot = true,
    this.searchReadOnly = false,
    this.showBack = false,
    this.onBack,
  });

  final TextEditingController? searchController;
  final ValueChanged<String>? onSearchChanged;
  final ValueChanged<String>? onSearchSubmitted;
  final VoidCallback? onSearchTap;
  final VoidCallback? onCameraTap;
  final VoidCallback? onBellTap;
  final int notificationCount;
  final bool showNotificationDot;
  final bool searchReadOnly;
  final bool showBack;
  final VoidCallback? onBack;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appBarBlue,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 16,
      title: Row(
        children: [
          if (showBack) ...[       // MỚI: chỉ chèn khi showBack = true
            GestureDetector(
              onTap: onBack ?? () => Navigator.of(context).maybePop(),
              behavior: HitTestBehavior.opaque,
              child: const Padding(
                padding: EdgeInsets.only(right: 12),
                child: Icon(Icons.arrow_back_ios_new,
                    color: Colors.white, size: 20),
              ),
            ),
          ],
          Expanded(
            child: AppSearchBar(
              controller: searchController,
              onChanged: onSearchChanged,
              onSubmitted: onSearchSubmitted,
              onTap: onSearchTap,
              onCameraTap: onCameraTap,
              readOnly: searchReadOnly,
            ),
          ),
          const SizedBox(width: 8),
          NotificationBell(
            count: notificationCount,
            showDot: showNotificationDot,
            onTap: onBellTap,
          ),
        ],
      ),
    );
  }
}