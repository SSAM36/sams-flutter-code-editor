import 'package:flutter/material.dart';

import '../settings_controller.dart';

const _hintText = 'Search…';

class SearchSettingsWidget extends StatelessWidget {
  final FocusNode patternFocusNode;
  final SearchSettingsController settingsController;

  const SearchSettingsWidget({
    super.key,
    required this.patternFocusNode,
    required this.settingsController,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 4,
                ),
                child: SizedBox(
                  width: 80,
                  child: TextField(
                    style: const TextStyle(fontSize: 13),
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: _hintText,
                      isCollapsed: true,
                      border: InputBorder.none,
                    ),
                    focusNode: patternFocusNode,
                    controller: settingsController.patternController,
                  ),
                ),
              ),
            ),
            ToggleButtons(
              onPressed: (index) {
                patternFocusNode.requestFocus();
                switch (index) {
                  case 0:
                    settingsController.toggleCaseSensitivity();
                    break;
                  case 1:
                    settingsController.toggleIsRegExp();
                    break;
                }
              },
              isSelected: [
                settingsController.value.isCaseSensitive,
                settingsController.value.isRegExp,
              ],
              children: const [
                Text('Aa'),
                Text('.*'),
              ],
            ),
          ],
        );
      },
    );
  }
}
