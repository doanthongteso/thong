import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableButton extends StatelessWidget {
  SlidableButton(
      {this.icon,
      this.iconSize,
      this.fontSize,
      this.label,
      this.backgroundColor,
      this.foregroundColor,
      this.borderColor,
      this.flex = 1,
      this.autoClose = true,
      required this.onPressed}) {
    borderColor ??= backgroundColor ?? Colors.transparent;
  }

  final IconData? icon;
  final double? iconSize;
  final double? fontSize;
  final String? label;

  /// The amount of space the child's can occupy in the main axis is
  /// determined by dividing the free space according to the flex factors of the
  /// other [CustomSlidableAction]s.
  final int flex;

  final Color? backgroundColor;
  Color? borderColor;
  final Color? foregroundColor;

  /// Whether the enclosing [Slidable] will be closed after [onPressed]
  /// occurred.
  final bool autoClose;

  /// Called when the action is tapped or otherwise activated.
  /// If this callback is null, then the action will be disabled.
  final SlidableActionCallback? onPressed;

  void _handleTap(BuildContext context) {
    onPressed?.call(context);
    if (autoClose) {
      Slidable.of(context)?.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Gets the SlidableController.
    final controller = Slidable.of(context);

    return ValueListenableBuilder<double>(
      // Listens to the slide animation.
      valueListenable: controller!.animation,
      builder: (context, value, child) {
        // This is the maximum ratio allowed by the current action pane.
        final maxRatio = controller.actionPaneConfigurator!.extentRatio;
        final double opacity = value / maxRatio;
        return Flexible(
            flex: flex,
            fit: FlexFit.tight,
            child: Container(
                margin: EdgeInsets.fromLTRB(1, 8, 4, 8),
                child: ElevatedButton(
                  onPressed: () => _handleTap(context),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                    backgroundColor: MaterialStateProperty.all(backgroundColor),
                    foregroundColor: MaterialStateProperty.all(foregroundColor),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  child: Icon(icon,
                      size: iconSize,
                      color: foregroundColor?.withOpacity(opacity)),
                )));
      },
    );
  }
}
