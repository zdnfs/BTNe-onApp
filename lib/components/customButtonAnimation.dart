import 'package:flutter/material.dart';

class CustomButtonAnimation extends StatefulWidget {
  final String label;
  final Color backbround;
  final Color borderColor;
  final Color fontColor;
  final Function onTap;
  final Widget child;

  const CustomButtonAnimation(
      {Key key,
      this.label,
      this.backbround,
      this.borderColor,
      this.fontColor,
      this.onTap,
      this.child})
      : super(key: key);

  @override
  _CustomButtonAnimationState createState() => _CustomButtonAnimationState();
}

class _CustomButtonAnimationState extends State<CustomButtonAnimation> 
with TickerProviderStateMixin {

  AnimationController _scaleController;
  Animation<double> _scaleAnimation;

  bool _isTextHide = false;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 320)
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 32.0)
    .animate(_scaleController)..addStatusListener((status){
      if(status == AnimationStatus.completed){
        Navigator.push(context, PageTransition(
          type: PageTransitionType.fade,
          child: widget.child
        )).then((value){
          _scaleController.reverse().then((e){
            _isTextHide = false;
          });
        });
      }
    });

  }



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
         _isTextHide = true; 
        });
        _scaleController.forward();
      },
      child: AnimatedBuilder(
        animation: _scaleController,
        builder: (context, child) => Transform.scale(
          scale: _scaleAnimation.value,
        child: Container(
          height: 63,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: widget.backbround,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: widget.borderColor,
              width: 1
            ),
          ),
          child: !_isTextHide ? Text(widget.label, style: TextStyle(
            color: widget.fontColor,
            fontSize: 20,
            fontWeight: FontWeight.bold
          )) : Container()
        )),
      ),
    );
  }
}

class ButtonLoginAnimation extends StatefulWidget {

  final String label;
  final Color background;
  final Color borderColor;
  final Color fontColor;
  final Function onTap;
  final Widget child;

  const ButtonLoginAnimation({Key key, this.label, this.background, this.borderColor, this.fontColor, this.onTap, this.child}) : super(key: key);

  @override
  _ButtonLoginAnimationState createState() => _ButtonLoginAnimationState();
}

class _ButtonLoginAnimationState extends State<ButtonLoginAnimation>
    with TickerProviderStateMixin {

  AnimationController _positionController;
  Animation<double> _positionAnimation;

  AnimationController _scaleController;
  Animation<double> _scaleAnimation;

  bool _isLogin = false;
  bool _isIconHide = false;

  @override
  void initState() {
    super.initState();

    _positionController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 800)
    );

    _positionAnimation = Tween<double>(begin: 10.0, end: 255.0)
        .animate(_positionController)..addStatusListener((status){
      if(status == AnimationStatus.completed){
        setState(() {
          _isIconHide = true;
        });
        _scaleController.forward();
      }
    });

    _scaleController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 900)
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 32)
        .animate(_scaleController)..addStatusListener((status){
      if(status == AnimationStatus.completed){
        Navigator.pushReplacement(context, PageTransition(
            type: PageTransitionType.fade,
            child: widget.child
        ));
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          _isLogin = true;
        });
        _positionController.forward();
      },
      child: Container(
        height: 63,
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.background,
          borderRadius: BorderRadius.circular(14),
        ),
        child: !_isLogin ? Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.label, style: TextStyle(
                color: widget.fontColor,
                fontSize: 20,
                fontWeight: FontWeight.bold
            )),
            SizedBox(width: 10),
            Icon(Icons.arrow_forward, color: widget.fontColor,size: 32)
          ],
        ) : Stack(
          children: <Widget>[
            AnimatedBuilder(
              animation: _positionController,
              builder: (context, child) => Positioned(
                left: _positionAnimation.value,
                top: 5,
                child: AnimatedBuilder(
                  animation: _scaleController,
                  builder: (context,build) => Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: widget.borderColor,
                          shape: BoxShape.circle,
                        ),
                        child: !_isIconHide ? Icon(Icons.arrow_forward, color: widget.fontColor,size: 32) : Container(),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


enum PageTransitionType {
  fade,
  rightToLeft,
  leftToRight,
  upToDown,
  downToUp,
  scale,
  rotate,
  size,
  rightToLeftWithFade,
  leftToRightWithFade,
}

class PageTransition<T> extends PageRouteBuilder<T> {
  final Widget child;
  final PageTransitionType type;
  final Curve curve;
  final Alignment alignment;
  final Duration duration;

  PageTransition({
    Key key,
    @required this.child,
    @required this.type,
    this.curve = Curves.linear,
    this.alignment,
    this.duration = const Duration(milliseconds: 300),
    RouteSettings settings,
  }) : super(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return child;
      },
      transitionDuration: duration,
      settings: settings,
      transitionsBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child) {
        switch (type) {
          case PageTransitionType.fade:
            return FadeTransition(opacity: animation, child: child);
            break;
          case PageTransitionType.rightToLeft:
            return SlideTransition(
              transformHitTests: false,
              position: new Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: new SlideTransition(
                position: new Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(-1.0, 0.0),
                ).animate(secondaryAnimation),
                child: child,
              ),
            );
            break;
          case PageTransitionType.leftToRight:
            return SlideTransition(
              transformHitTests: false,
              position: Tween<Offset>(
                begin: const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: new SlideTransition(
                position: new Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(1.0, 0.0),
                ).animate(secondaryAnimation),
                child: child,
              ),
            );
            break;
          case PageTransitionType.upToDown:
            return SlideTransition(
              transformHitTests: false,
              position: Tween<Offset>(
                begin: const Offset(0.0, -1.0),
                end: Offset.zero,
              ).animate(animation),
              child: new SlideTransition(
                position: new Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(0.0, 1.0),
                ).animate(secondaryAnimation),
                child: child,
              ),
            );
            break;
          case PageTransitionType.downToUp:
            return SlideTransition(
              transformHitTests: false,
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).animate(animation),
              child: new SlideTransition(
                position: new Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(0.0, -1.0),
                ).animate(secondaryAnimation),
                child: child,
              ),
            );
            break;
          case PageTransitionType.scale:
            return ScaleTransition(
              alignment: alignment,
              scale: CurvedAnimation(
                parent: animation,
                curve: Interval(
                  0.00,
                  0.50,
                  curve: curve,
                ),
              ),
              child: child,
            );
            break;
          case PageTransitionType.rotate:
            return new RotationTransition(
              alignment: alignment,
              turns: animation,
              child: new ScaleTransition(
                alignment: alignment,
                scale: animation,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              ),
            );
            break;
          case PageTransitionType.size:
            return Align(
              alignment: alignment,
              child: SizeTransition(
                sizeFactor: CurvedAnimation(
                  parent: animation,
                  curve: curve,
                ),
                child: child,
              ),
            );
            break;
          case PageTransitionType.rightToLeftWithFade:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset.zero,
                    end: const Offset(-1.0, 0.0),
                  ).animate(secondaryAnimation),
                  child: child,
                ),
              ),
            );
            break;
          case PageTransitionType.leftToRightWithFade:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset.zero,
                    end: const Offset(1.0, 0.0),
                  ).animate(secondaryAnimation),
                  child: child,
                ),
              ),
            );
            break;
          default:
            return FadeTransition(opacity: animation, child: child);
        }
      });
}


