import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/fliters_provider.dart';
import 'package:meals_app/widgets/switch_widget.dart';
// import 'package:meals_app/screens/main_drawer.dart';
// import 'package:meals_app/screens/tabs.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(builder: (context) => TabsScreen()),
      //       );
      //     }
      //   },
      // ),
      body: Column(
        children: [
          SwitchWidget(
            filterSet: activeFilters[Filter.glutenFree]!,
            onChanged: (isCheked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isCheked);
            },
            title: 'Gluten-Free',
            subtitle: 'Only include gluten-free meals.',
          ),
          SwitchWidget(
            filterSet: activeFilters[Filter.lactoseFree]!,
            onChanged: (isCheked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isCheked);
            },
            title: 'Lactose-Free',
            subtitle: 'Only include lactose-free meals.',
          ),
          SwitchWidget(
            filterSet: activeFilters[Filter.vegetarian]!,
            onChanged: (isCheked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isCheked);
            },
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals.',
          ),
          SwitchWidget(
            filterSet: activeFilters[Filter.vegan]!,
            onChanged: (isCheked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isCheked);
            },
            title: 'Vegan',
            subtitle: 'Only include vegan meals.',
          ),
        ],
      ),
    );
  }
}
