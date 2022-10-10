import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';

// This widget is the container for the value of the filter widget
// In terms of flutter, this class is to hold the state of the filterWidget
// so that it can be used in other parts of app
class FilterStateContainer extends StatefulWidget {
  final Widget child;

  const FilterStateContainer({Key? key, required this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FilterState();

  // FilterState is our internal state. It is public

  static FilterState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_FilterInheritedWidget>()!
        .state;
  }
}

class FilterState extends State<FilterStateContainer> {
  int filterValue = Constants.allFilter;
  SharedPreferences? _prefs;

  @override
  void initState() {
    super.initState();
    _loadValue();
  }

  @override
  Widget build(BuildContext context) {

    // State of the _FilterInheritedWidget is the current FilterState instance,
    // Child is same child as that for the FilterStateContainer widget
    return _FilterInheritedWidget(state: this, child: widget.child);
  }

  // To load the currently saved filter value when filter page is opened
  void _loadValue() async {
    SharedPreferences.getInstance().then((value) {
      setState(() {
        filterValue = _prefs?.getInt(Constants.filterKey) as int;
      });
    });
  }

  void updateFilterValue(int value) {
    setState(() {
      _prefs?.setInt(Constants.filterKey, value);
      filterValue = value;
    });
  }
}

class _FilterInheritedWidget extends InheritedWidget {
  final FilterState state;

  const _FilterInheritedWidget({
    Key? key,
    required this.state,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_FilterInheritedWidget oldWidget) => true;
// true implies all the widgets that depend on this inherited widget should rebuild
// when the state of the inherited widget changes


}
