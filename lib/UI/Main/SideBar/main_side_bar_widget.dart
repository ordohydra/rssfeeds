import 'package:flutter/material.dart';

final class MainSideBarWidget extends Drawer {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[DrawerHeader(child: Text('Test header'))],
      ),
    );
  }
}
