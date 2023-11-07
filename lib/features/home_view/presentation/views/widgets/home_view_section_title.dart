import 'package:flutter/material.dart';

import '../../../../../core/localization/l10n.dart';

class SectionTitleHomeView extends StatelessWidget {
  final String title;
  final Function seeAllFunction;
  const SectionTitleHomeView(
      {super.key, required this.title, required this.seeAllFunction});

  @override
  Widget build(BuildContext context) {
    final locale = getL10n(context);
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        InkWell(
          onTap: () => seeAllFunction(),
          child: Text(
            locale.seeAll,
            style: theme.textTheme.titleSmall,
          ),
        )
      ],
    );
  }
}
