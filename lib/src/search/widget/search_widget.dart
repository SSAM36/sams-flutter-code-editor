import 'package:flutter/material.dart';

import '../controller.dart';
import 'focus_rediretor.dart';
import 'search_navigation_widget.dart';
import 'search_settings_widget.dart';

const _iconSize = 20.0;

class SearchWidget extends StatelessWidget {
  final CodeSearchController searchController;

  const SearchWidget({
    super.key,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: searchController,
      builder: (context, child) => FocusRedirector(
        redirectTo: searchController.patternFocusNode,
        child: SizedBox(
          height: 40,
          child: IntrinsicWidth(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 300,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 4,
                    child: SearchSettingsWidget(
                      patternFocusNode: searchController.patternFocusNode,
                      settingsController: searchController.settingsController,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    flex: 2,
                    child: SearchNavigationWidget(
                      searchNavigationController:
                          searchController.navigationController,
                    ),
                  ),
                  SizedBox(
                    width: 24,
                    child: InkWell(
                      hoverColor: Colors.transparent,
                      onTap: () => searchController.hideSearch(
                        returnFocusToCodeField: true,
                      ),
                      child: const Icon(
                        Icons.close,
                        size: _iconSize,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
