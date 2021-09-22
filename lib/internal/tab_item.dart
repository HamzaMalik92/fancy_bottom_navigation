import 'package:flutter/material.dart';

const double ICON_OFF = -3;
const double ICON_ON = 0;
const double TEXT_OFF = 3;
const double TEXT_ON = 1;
const double ALPHA_OFF = 0;
const double ALPHA_ON = 1;
const int ANIM_DURATION = 350;

class TabItem extends StatefulWidget {
  TabItem(
      {required this.uniqueKey,
      required this.selected,
      required this.iconData,
      required this.title,
      required this.callbackFunction,
      required this.textColor,
      required this.iconColor});

  final UniqueKey uniqueKey;
  final String title;
  final IconData iconData;
  final bool selected;
  final Function(UniqueKey uniqueKey) callbackFunction;
  final Color textColor;
  final Color iconColor;

  @override
  _TabItemState createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  final double iconYAlign = ICON_ON;

  final double textYAlign = TEXT_OFF;

  final double iconAlpha = ALPHA_ON;

  @override
  Widget build(BuildContext context) {
    return Expanded(

      child: TextButton(

style: ButtonStyle(
  overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
),
        onPressed: (){
          widget.callbackFunction(widget.uniqueKey);

        },
        child: Container(
          child: Column(
            // fit: StackFit.loose,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                // color: Colors.red,
                height: 20,

                // height: double.infinity,
                // width: double.infinity,

                child: AnimatedAlign(
                  duration: Duration(milliseconds: ANIM_DURATION),
                  curve: Curves.easeIn,
                  alignment: Alignment(0, (widget.selected) ? ICON_OFF : ICON_ON),
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: ANIM_DURATION),
                    opacity: (widget.selected) ? ALPHA_OFF : ALPHA_ON,
                    child: IconButton(

                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      padding: EdgeInsets.all(0),
                      alignment: Alignment(0, 0),
                      icon: Icon(
                        widget.iconData,

                        color: widget.iconColor,
                      ),
                      onPressed: () {
                        widget.callbackFunction(widget.uniqueKey);
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                // color: Colors.red,
                height: 20,
                // width: double.infinity,
                child: AnimatedAlign(
                    duration: Duration(milliseconds: ANIM_DURATION),
                    alignment: Alignment(0, (widget.selected) ?  TEXT_OFF: TEXT_ON),
                    child: Text(
                      widget.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: widget.selected?Colors.transparent:widget.textColor,
                      fontSize: 13),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
