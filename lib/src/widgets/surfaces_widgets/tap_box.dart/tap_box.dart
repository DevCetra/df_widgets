//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. The use of this
// source code is governed by an MIT-style license described in the LICENSE
// file located in this project's root directory.
//
// See: https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/_common.dart';

part '_tap_box_properties.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class TapBox extends StatefulWidget {
  final TapBoxProperties properties;
  final VoidCallback? onTap;
  final GestureTapDownCallback? onTapDown;
  final Widget? child;

  static const DEFAULT_PROPERTIES = TapBoxProperties(
    decoration: BoxDecoration(),
    foregroundDecoration: BoxDecoration(),
  );

  const TapBox({
    super.key,
    this.properties = DEFAULT_PROPERTIES,
    this.onTap,
    this.onTapDown,
    this.child,
  });

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum TapBoxState {
  IDLE,
  HOVER,
  TAP_DOWN,
}

class _State extends State<TapBox> {
  TapBoxState _state = TapBoxState.IDLE;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _state = TapBoxState.TAP_DOWN;
    });
    if (widget.onTapDown != null) {
      widget.onTapDown!(details);
    }
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _state = TapBoxState.HOVER;
    });
    if (widget.onTap != null) {
      widget.onTap!();
    }
  }

  void _handleTapCancel() {
    setState(() {
      _state = TapBoxState.HOVER;
    });
  }

  void _handleMouseEnter(PointerEnterEvent event) {
    setState(() {
      _state = TapBoxState.HOVER;
    });
  }

  void _handleMouseExit(PointerExitEvent event) {
    setState(() {
      _state = TapBoxState.IDLE;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: MouseRegion(
        onEnter: _handleMouseEnter,
        onExit: _handleMouseExit,
        child: Builder(
          builder: (context) {
            return IntrinsicHeight(
              child: IntrinsicWidth(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: widget.properties.decoration$,
                  foregroundDecoration: widget.properties.foregroundDecoration,
                  child: widget.properties.builder?.call(context, _state, widget.child) ??
                      widget.child ??
                      const SizedBox.shrink(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateDartModel(
  fields: {
    Field(
      fieldPath: ['decoration'],
      fieldType: Decoration,
      nullable: true,
    ),
    Field(
      fieldPath: ['foregroundDecoration'],
      fieldType: Decoration,
      nullable: true,
    ),
    Field(
      fieldPath: ['builder'],
      fieldType: '_WidgetBuilder',
      nullable: true,
    ),
  },
  shouldInherit: true,
)
class _TapBoxProperties {
  const _TapBoxProperties();
}

typedef _WidgetBuilder = Widget Function(BuildContext context, TapBoxState state, Widget? child);