import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:nopapp/helper/colors.dart';

class AppBtn extends StatelessWidget {
  final String? title;
  final AnimationController btnCntrl;
  final Animation? btnAnim;
  final VoidCallback? onBtnSelected;

  const AppBtn(
      {required Key key,
      this.title,
      required this.btnCntrl,
      this.btnAnim,
      this.onBtnSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
      builder: _buildBtnAnimation,
      animation: btnCntrl,
    );
  }

  Widget _buildBtnAnimation(BuildContext context, Widget? child) {
    return CupertinoButton(
      child: Container(
        width: btnAnim!.value,
        height: 45,
        margin: EdgeInsetsDirectional.only(top: 25),
        alignment: FractionalOffset.center,
        decoration: new BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [colors.grad1Color, colors.grad2Color],
              stops: [0, 1]),
          borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
        ),
        child: btnAnim!.value > 75.0
            ? Text(title!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: colors.white, fontWeight: FontWeight.normal))
            : new CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(colors.white),
              ),
      ),
      onPressed: () {
        onBtnSelected!();
      },
    );
  }
}
