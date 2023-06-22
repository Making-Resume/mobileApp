import 'package:flutter/material.dart';

class AnimatedRegisterButton extends StatefulWidget {
  @override
  _AnimatedRegisterButtonState createState() => _AnimatedRegisterButtonState();
}

class _AnimatedRegisterButtonState extends State<AnimatedRegisterButton>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _scaleAnimation;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  void _startLoading() {
    setState(() {
      _isLoading = true;
    });
    _animationController!.forward();
    // Simulate a loading delay
    Future.delayed(Duration(seconds: 2), () {
      _stopLoading();
    });
  }

  void _stopLoading() {
    setState(() {
      _isLoading = false;
    });
    _animationController!.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
  animation: _animationController!,
  builder: (BuildContext context, Widget? child) {
    return Transform.scale(
      scale: _scaleAnimation!.value,
      child: FractionallySizedBox(
        widthFactor: 0.7, // Set your desired width factor here (0.0 to 1.0)
       // heightFactor: 0.1,
        child: ElevatedButton(
          onPressed: _isLoading ? null : _startLoading,
          style: ElevatedButton.styleFrom(
            
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: _isLoading
              ? SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Text(
                  'Register',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  },
);
  }
}