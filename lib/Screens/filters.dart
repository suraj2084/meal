import 'package:flutter/material.dart';
// import 'package:meals/Screens/tabs.dart';
// import 'package:meals/widget/main_drawer.dart';

enum Filter {
  vegan,
  vegetarian,
  loctosefree,
  gultenfree,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilter});
  final Map<Filter, bool> currentFilter;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gultenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _veganFreeFilterSet = false;
  var _vegetrianFreeFilterSet = false;
  @override
  void initState() {
    super.initState();
    _gultenFreeFilterSet = widget.currentFilter[Filter.gultenfree]!;
    _lactoseFreeFilterSet = widget.currentFilter[Filter.loctosefree]!;
    _veganFreeFilterSet = widget.currentFilter[Filter.vegan]!;
    _vegetrianFreeFilterSet = widget.currentFilter[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      // drawer: MainDrawer(onSelectScreen: (idetifer) {
      //   Navigator.of(context).pop();
      //   if (idetifer == 'meals') {
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(
      //       builder: (ctx) => const TabScreen(),
      //     ));
      //   }
      // }),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.gultenfree: _gultenFreeFilterSet,
            Filter.vegan: _veganFreeFilterSet,
            Filter.vegetarian: _vegetrianFreeFilterSet,
            Filter.loctosefree: _lactoseFreeFilterSet,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _gultenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _gultenFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Gluten_free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include meals.',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 24, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include lactose-free meals.',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 24, right: 22),
            ),
            SwitchListTile(
              value: _vegetrianFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegetrianFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Vegetarian meals.',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 24, right: 22),
            ),
            SwitchListTile(
              value: _veganFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Vegan meals.',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 24, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
