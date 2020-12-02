import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class General {
  static sizeBoxHorizontial(space) {
    return SizedBox(
      width: space,
    );
  }

  static sizeBoxVerical(space) {
    return SizedBox(
      height: space,
    );
  }

  static buildTxt(
      {@required String txt,
      Color color = Colors.black,
      double fontSize,
      double lineHeight = 1,
      bool isBold = false,
      bool isUnderLine = false,
      isCenter = true}) {
    return Text(
      txt,
      textAlign: isCenter ? TextAlign.center : null,
      style: TextStyle(
          color: color,
          height: lineHeight,
          decoration: isUnderLine ? TextDecoration.underline : null,
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
    );
  }

  static confirmDialogue(context,
      {@required String txt, Function onPress}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[General.buildTxt(txt: txt, fontSize: 14.0)],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: General.buildTxt(txt: 'CONFIRM'),
              onPressed: onPress,
            ),
          ],
        );
      },
    );
  }

  static roundBox({String color = '#fef1df', @required String txt}) {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Color(General.getColorHexFromStr(color))),
      child: General.buildTxt(txt: txt, fontSize: 13.0),
    );
  }

  static noResultFound({@required txt}) {
    return Center(
      child: General.buildTxt(txt: txt),
    );
  }

  static customSpinner(
    BuildContext context,
  ) {
    return Center(
      child: SpinKitDoubleBounce(
        color: Theme.of(context).primaryColor,
        size: 50.0,
      ),
    );
  }

  static customThreeBounce(BuildContext context,
      {Color color = Colors.white, size = 20.0}) {
    return Center(
      child: SpinKitThreeBounce(
        color: color,
        size: size,
      ),
    );
  }

  static buildStackWidget({String hintTxt, @required Widget childWidget}) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Positioned(
          top: -3.0,
          child: General.buildTxt(
              txt: hintTxt, color: Colors.black54, fontSize: 12.0),
        ),
        childWidget
      ],
    );
  }

  static bulletList({@required Widget txtWidget}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          height: 7.0,
          width: 7.0,
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        sizeBoxHorizontial(4.0),
        Expanded(
          child: txtWidget,
        )
      ],
    );
  }

  static confirmDelete(context, {Function onPress}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: General.buildTxt(
              txt: "Delete", fontSize: 14.0, isCenter: false, isBold: true),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                General.buildTxt(txt: "Are you sure to delete?", fontSize: 14.0)
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: General.buildTxt(txt: "Confirm"),
              onPressed: onPress,
            ),
          ],
        );
      },
    );
  }

  static buildCard(
      {@required Widget cardChild,
      double borderRaduis = 5.0,
      Color color = Colors.white,
      double padding = 10.0}) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRaduis)),
      child: Container(
        padding: EdgeInsets.all(padding),
        child: cardChild,
      ),
    );
  }

  static buttonSpinner() {
    return Container(
      width: 15.0,
      height: 15.0,
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }

  static appbar({@required onPress, @required BuildContext context}) {
    return AppBar(
      elevation: 0.0,
      leading: appBarBaackButton(context),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.0),
        )
      ],
    );
  }

  static gredientEditButton() {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Color(0xFF090000),
              Color(0xFF090000),
              Color(0xFF960102),
              Color(0xFFd45f60),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
          )),
      child: Icon(
        Icons.edit,
        color: Colors.white,
        size: 20.0,
      ),
    );
  }

  static dismissLoadingDialog(context) {
    if (Navigator.of(context).canPop()) Navigator.pop(context);
  }

  static sectionTitle({String txt1, String txt2}) {
    return Row(
      children: <Widget>[
        General.buildTxt(txt: txt1, fontSize: 18.0, isBold: true),
        General.sizeBoxHorizontial(6.0),
        General.buildTxt(txt: txt2, fontSize: 18.0)
      ],
    );
  }

  static ringSpinner(BuildContext context,
      {Color color = Colors.white, size = 20.0, lineWidth = 4.0}) {
    return Center(
      child: SpinKitRing(color: color, lineWidth: lineWidth, size: size),
    );
  }

  static Future<void> showDialogue(String txt, BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                sizeBoxVerical(10.0),
                buildTxt(txt: txt, lineHeight: 1.4, isCenter: false)
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static appBarBaackButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Image.asset(
        'assets/images/12.png',
        scale: 3,
      ),
    );
  }

  static int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }
}
