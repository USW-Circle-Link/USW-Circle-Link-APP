import 'package:flutter/material.dart';
import 'package:usw_circle_link/widgets/text_font_widget/text_font_widget.dart';
import 'alert_text_dialog_styles.dart';

class AlertTextDialog extends StatefulWidget {
  const AlertTextDialog({
    Key? key,
    this.title,
    this.content,
    this.onLeftButtonPressed,
    this.onRightButtonPressed,
    this.leftButtonText,
    this.rightButtonText,
    this.rightButtonTextStyle,
    this.leftButtonTextStyle,
    this.canPop = true,
    this.onPopInvoked,
    this.style = AlertTextDialogStyle.defaultStyle,
  }) : super(key: key);

  final String? title;
  final String? content;
  final void Function()? onLeftButtonPressed, onRightButtonPressed;
  final String? leftButtonText, rightButtonText;
  final TextStyle? rightButtonTextStyle, leftButtonTextStyle;
  final bool canPop;
  final void Function()? onPopInvoked;
  final AlertTextDialogStyle style;

  @override
  _AlertTextDialogState createState() => _AlertTextDialogState();
}

class _AlertTextDialogState extends State<AlertTextDialog> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDefault = widget.style == AlertTextDialogStyle.defaultStyle;
    final effectiveButtonColor = isDefault
        ? theme.colorScheme.primary
        : widget.style.buttonColor;
    final effectiveDividerColor = isDefault
        ? theme.dividerColor
        : widget.style.dividerColor;
    final effectiveTitleColor = isDefault
        ? (theme.textTheme.bodyLarge?.color ?? theme.colorScheme.onSurface)
        : widget.style.titleColor;
    final effectiveContentColor = isDefault
        ? (theme.textTheme.bodyMedium?.color ?? theme.colorScheme.onSurfaceVariant)
        : widget.style.contentColor;

    return PopScope(
      canPop: widget.canPop,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          widget.onPopInvoked?.call();
        }
      },
      child: Dialog(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.style.borderRadius),
            color: isDefault
                ? theme.dialogTheme.backgroundColor
                : widget.style.backgroundColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: widget.style.padding,
                child: Column(
                  children: [
                    ...[
                      if (widget.title != null)
                        Container(
                          margin: EdgeInsets.only(
                              bottom: widget.content != null ? 8 : 0),
                          child: TextFontWidget.fontRegular(
                            widget.title!,
                            color: effectiveTitleColor,
                            fontSize: widget.style.titleFontSize,
                            fontWeight: widget.style.titleFontWeight,
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                    if (widget.content != null)
                      TextFontWidget.fontRegular(
                        widget.content!,
                        color: effectiveContentColor,
                        fontSize: widget.style.contentFontSize,
                        fontWeight: widget.style.contentFontWeight,
                        textAlign: TextAlign.center,
                      ),
                  ],
                ),
              ),
              SizedBox.fromSize(
                size: Size.fromHeight(0.5),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: effectiveDividerColor),
                ),
              ),
              if (widget.leftButtonText != null &&
                  widget.rightButtonText != null)
                SizedBox(
                  height: widget.style.buttonHeight,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            widget.onLeftButtonPressed?.call();
                            Navigator.of(context).pop();
                          },
                          style: TextButton.styleFrom(
                            minimumSize: Size.fromHeight(widget.style.buttonHeight),
                            foregroundColor: effectiveButtonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(widget.style.borderRadius)),
                            ),
                          ),
                          child: Text(
                            widget.leftButtonText!,
                            style: widget.leftButtonTextStyle ??
                                TextFontWidget.fontRegularStyle(
                                  fontSize: widget.style.titleFontSize,
                                  color: effectiveButtonColor,
                                  fontWeight: widget.style.titleFontWeight,
                                ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 0.5,
                        height: double.infinity,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: effectiveDividerColor),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            widget.onRightButtonPressed?.call();
                            Navigator.of(context).pop();
                          },
                          style: TextButton.styleFrom(
                            minimumSize: Size.fromHeight(widget.style.buttonHeight),
                            foregroundColor: effectiveButtonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(widget.style.borderRadius)),
                            ),
                          ),
                          child: Text(
                            widget.rightButtonText!,
                            style: widget.rightButtonTextStyle ??
                                TextFontWidget.fontRegularStyle(
                                  fontSize: widget.style.titleFontSize,
                                  color: effectiveButtonColor,
                                  fontWeight: widget.style.titleFontWeight,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              else
                TextButton(
                  onPressed: () {
                    widget.onLeftButtonPressed?.call();
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size.fromHeight(widget.style.buttonHeight),
                    foregroundColor: effectiveButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.zero, bottom: Radius.circular(widget.style.borderRadius)),
                    ),
                  ),
                  child: Text(
                    widget.leftButtonText!,
                    style: widget.leftButtonTextStyle ??
                        TextFontWidget.fontRegularStyle(
                          fontSize: widget.style.titleFontSize,
                          color: effectiveButtonColor,
                          fontWeight: widget.style.titleFontWeight,
                        ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
