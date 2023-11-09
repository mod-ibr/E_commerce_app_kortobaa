import 'package:flutter/material.dart';

class ExpansionTextProductView extends StatefulWidget {
  final String title;
  final dynamic content;
  const ExpansionTextProductView(
      {super.key, required this.title, required this.content});

  @override
  State<ExpansionTextProductView> createState() =>
      _ExpansionTextProductViewState();
}

class _ExpansionTextProductViewState extends State<ExpansionTextProductView> {
  bool _isTextExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ExpansionPanelList(
      elevation: 0,
      expandedHeaderPadding: EdgeInsets.zero,
      expansionCallback: (index, isExpanded) {
        setState(() {
          _isTextExpanded = !isExpanded;
        });
      },
      animationDuration: const Duration(milliseconds: 600),
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor: theme.colorScheme.surface,
          headerBuilder: (_, isExpanded) => Container(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              widget.title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          body: (widget.content is Widget)
              ? widget.content
              : Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Text(widget.content),
                ),
          isExpanded: _isTextExpanded,
        )
      ],
    );
  }
}
