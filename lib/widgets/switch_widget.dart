import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({
    super.key,
    required this.filterSet,
    required this.onChanged,
    required this.title,
    required this.subtitle,
  });

  final bool filterSet;
  final void Function(bool) onChanged;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: filterSet,
      onChanged: onChanged,
      title: Text(title, style: Theme.of(context).textTheme.titleLarge),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.titleMedium),
      activeThumbColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: EdgeInsets.only(left: 34, right: 22),
    );
  }
}
