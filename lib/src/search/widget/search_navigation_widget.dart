import 'package:flutter/material.dart';

import '../search_navigation_controller.dart';

const _iconSize = 16.0;

class SearchNavigationWidget extends StatelessWidget {
  final SearchNavigationController searchNavigationController;

  const SearchNavigationWidget({
    super.key,
    required this.searchNavigationController,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: searchNavigationController,
      builder: (context, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (searchNavigationController.value.totalMatchCount > 0) ...[
              InkWell(
                hoverColor: Colors.transparent,
                onTap: searchNavigationController.movePrevious,
                child: const Icon(
                  Icons.arrow_upward,
                  size: _iconSize,
                ),
              ),
              InkWell(
                hoverColor: Colors.transparent,
                onTap: searchNavigationController.moveNext,
                child: const Icon(
                  Icons.arrow_downward,
                  size: _iconSize,
                ),
              ),
            ],
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                _getText(),
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        );
      },
    );
  }

  String _getText() {
    final currentMatchIndex =
        (searchNavigationController.value.currentMatchIndex ?? -1) + 1;
    final totalMatchCount = searchNavigationController.value.totalMatchCount;

    return '$currentMatchIndex / $totalMatchCount';
  }
}
