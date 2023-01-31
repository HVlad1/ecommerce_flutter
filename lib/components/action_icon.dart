import 'package:ecommerce_flutter/spacing.dart';
import 'package:flutter/material.dart';

class ActionIcon extends StatefulWidget {
  ActionIcon(
      {Key? key,
      required this.onPressed,
      required this.scrollController,
      required this.icon})
      : super(key: key);
  final Function() onPressed;
  final ScrollController scrollController;
  final IconData icon;
  final double appBarHeight = AppBar().preferredSize.height;

  @override
  State<ActionIcon> createState() => _ActionIconState();
}

class _ActionIconState extends State<ActionIcon> {
  bool _showBorder = true;
  double _opacity = 1.0;

  @override
  void initState() {
    widget.scrollController.addListener(() {
      setState(() {
        if (widget.scrollController.offset == 0) {
          _showBorder = true;
          _opacity = 1;
        } else {
          _opacity = _calculateOpacity(widget.scrollController.offset);
          _showBorder = _opacity < 0.2 ? false : true;
        }
      });
    });
    super.initState();
  }

  double _calculateOpacity(double scrollOffSet) {
    var scrollThreshold = Spacings.sliverAppBarHeight - widget.appBarHeight;
    var opacity = 1 - (1 / scrollThreshold) * scrollOffSet;
    if (opacity < 0) {
      opacity = 0;
    }
    if (opacity > 1) {
      opacity = 1;
    }
    return opacity;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Spacings.actionIconSize,
      height: Spacings.actionIconSize,
      child: TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.all(0),
          shape: const CircleBorder(),
          backgroundColor:
              Theme.of(context).colorScheme.onPrimary.withOpacity(_opacity),
        ),
        child: Icon(
          widget.icon,
          color: _showBorder
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
