import 'package:flutter/material.dart';

class PressableButton extends StatefulWidget {
  final String label;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final Gradient gradient;

  const PressableButton({
    super.key,
    required this.label,
    required this.width,
    required this.height,
    required this.onPressed,
    this.gradient = const LinearGradient(
      colors: [Color(0xFF5DB466), Color(0xFF088C15)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  });

  @override
  _PressableButtonState createState() => _PressableButtonState();
}

class _PressableButtonState extends State<PressableButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        transform: Matrix4.identity()..scale(_isPressed ? 0.9 : 1.0),
        width: widget.width,
        height: widget.height,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: widget.onPressed,
          child: Ink(
            decoration: BoxDecoration(
              gradient: widget.gradient, // Menggunakan gradient dari widget
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                widget.label,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}