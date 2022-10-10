import 'package:flutter/material.dart';
import 'package:sh_courses/state/filter_state_container.dart';

import '../../constants.dart';
import '../../strings.dart';
import 'filter_widget.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  // Using FilterState to use the filter value
  late FilterState state;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // whenever inherited widget updates, (updateShouldNotify returns true),
    // the state property of FilterPageState will update, and page will be rebuilt.
    state = FilterStateContainer.of(context);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.filter),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          FilterWidget(
            value: Constants.iosFilter,
            groupValue: state.filterValue,
            onChanged: _handleRadioValueChange,
            text: Strings.ios,
          ),
          FilterWidget(
            value: Constants.androidFilter,
            groupValue: state.filterValue,
            onChanged: _handleRadioValueChange,
            text: Strings.android,
          ),
          FilterWidget(
            value: Constants.flutterFilter,
            groupValue: state.filterValue,
            onChanged: _handleRadioValueChange,
            text: Strings.flutter,
          ),
          FilterWidget(
            value: Constants.sssFilter,
            groupValue: state.filterValue,
            onChanged: _handleRadioValueChange,
            text: Strings.sss,
          ),
          FilterWidget(
            value: Constants.unityFilter,
            groupValue: state.filterValue,
            onChanged: _handleRadioValueChange,
            text: Strings.unity,
          ),
          FilterWidget(
            value: Constants.macosFilter,
            groupValue: state.filterValue,
            onChanged: _handleRadioValueChange,
            text: Strings.macos,
          ),
          FilterWidget(
            value: Constants.allFilter,
            groupValue: state.filterValue,
            onChanged: _handleRadioValueChange,
            text: Strings.all,
          ),
        ],
      ),
    );
  }

  // Func to store the selected value in the filter page
  void _handleRadioValueChange(int? value) async {
    state.updateFilterValue(value ?? 0);
  }
}
