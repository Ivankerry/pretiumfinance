import 'package:flutter/material.dart';

class FloatingTextField extends StatefulWidget {
  final String labelText;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;

  const FloatingTextField({
    Key? key,
    required this.labelText,
    this.prefixIcon,
    this.obscureText = false,
    this.controller,
  }) : super(key: key);

  @override
  _FloatingTextFieldState createState() => _FloatingTextFieldState();
}

class _FloatingTextFieldState extends State<FloatingTextField> {
  final FocusNode _focusNode = FocusNode();
  late final TextEditingController _controller;
  bool _isFocused = false;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });

    _controller.addListener(() {
      setState(() {
        _hasText = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        labelStyle: TextStyle(
          color: _isFocused || _hasText ? Colors.teal : Colors.grey,
          fontSize: _isFocused || _hasText ? 12 : 16,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }
}
