import 'package:flutter/material.dart';

class CreationAwareWidget extends StatefulWidget {
  final Function onWidgetCreated;
  final Widget child;

  CreationAwareWidget({Key key, this.onWidgetCreated, this.child});

  @override
  _CreationAwareWidgetState createState() => _CreationAwareWidgetState();
}

class _CreationAwareWidgetState extends State<CreationAwareWidget> {

  @override
  void initState() {
    // TODO: implement initState
    if(widget.onWidgetCreated != null){
      widget.onWidgetCreated();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
