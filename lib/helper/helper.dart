import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dimension.dart';

class XMargin extends StatelessWidget {
  final double x;
  const XMargin(this.x);
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: x);
  }
}

class YMargin extends StatelessWidget {
  final double y;
  const YMargin(this.y);
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: y);
  }
}

noticeSnackBar({String message, int duration = 3}) {
  HapticFeedback.vibrate();
  BotToast.showCustomNotification(
      toastBuilder: (cancelFunc) {
        return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 70,
              width: DimensionService().deviceWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.blue,
              ),
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Notice",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const YMargin(3),
                  Expanded(
                    child: Text(
                      "$message",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ));
      },
      duration: Duration(seconds: duration));
}

errorSnackBar({BuildContext context, String message, int duration = 3}) {
  HapticFeedback.vibrate();
  BotToast.showCustomNotification(
      toastBuilder: (cancelFunc) {
        return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 70,
              width: DimensionService().deviceWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.redAccent[700],
              ),
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Error",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const YMargin(3),
                  Expanded(
                    child: Text(
                      "$message",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ));
      },
      duration: Duration(seconds: duration));
}

successSnackBar({String message}) {
  HapticFeedback.vibrate();
  BotToast.showCustomNotification(
      toastBuilder: (cancelFunc) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.green,
              ),
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  const XMargin(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Success",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      const YMargin(3),
                      Text(
                        "$message",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              )),
        );
      },
      duration: const Duration(seconds: 4));
}

Future<bool> awaitConsent(context, width, height, message) async {
  return await showDialog<bool>(
    context: context,
    builder: (context) => Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          height: height * .25,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          width: width * .8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "NOTICE",
                style: TextStyle(fontFamily: "futurabold"),
              ),
              const YMargin(15),
              Text(
                "$message",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "futurabold"),
              ),
              const YMargin(10),
              Row(
                children: [
                  Expanded(
                    child: FlatButton(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: .5),
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () async {
                          Navigator.pop(context, false);
                        },
                        child: Text(
                          "CANCEL",
                          style: TextStyle(fontFamily: "futurabold"),
                        )),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: FlatButton(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: Colors.grey,
                        onPressed: () async {
                          Navigator.pop(context, true);
                        },
                        child: Text(
                          "CONFIRM",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "futurabold"),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
  // return await res();
}

Future<bool> onWillPop(BuildContext context) {
  return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Confirm Exit?',
              style: TextStyle(color: Colors.black, fontSize: 18.0)),
          content: Text(
            'Are you sure you want to exit Telah ? Tap \'Yes\' to exit \'No\' to cancel.',
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.red),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                // this line exits the app.
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              child: Text('Yes',
                  style: TextStyle(fontSize: 16.0, color: Colors.blue)),
            ),
            FlatButton(
              onPressed: () => Navigator.pop(context),
              // this line dismisses the dialog
              child: Text('No',
                  style: TextStyle(fontSize: 16.0, color: Colors.blue)),
            )
          ],
        ),
      ) ??
      false;
}

Future<bool> onLogOutPop(context) {
  return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Confirm Logout?',
              style: TextStyle(color: Colors.black, fontSize: 18.0)),
          content: Text(
            'Are you sure you want to log out from Telah ? Tap \'Yes\' to Logout \'No\' to cancel.',
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.blue),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text('Yes',
                  style: TextStyle(fontSize: 16.0, color: Colors.blue)),
            ),
            FlatButton(
              onPressed: () => Navigator.pop(context, false),
              // this line dismisses the dialog
              child: Text('No',
                  style: TextStyle(fontSize: 16.0, color: Colors.blue)),
            )
          ],
        ),
      ) ??
      false;
}

Future<void> showSuccessDialog({BuildContext context, String message}) async {
  Future _close() async {
    Navigator.pop(context);
  }

  return showDialog(
      barrierDismissible: false,
      context: context,
      child: WillPopScope(
        onWillPop: () {
          return;
        },
        child: Center(
          child: AlertDialog(
            backgroundColor: Colors.white,
            content: Container(
              constraints: BoxConstraints(
                maxHeight: 180,
              ),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 40,
                  ),
                  SizedBox(height: 20),
                  Expanded(
                      flex: 1,
                      child: Text(
                        message,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      )),
                  SizedBox(height: 10),
                  RaisedButton(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () async {
                      await _close();
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ));
}

Future<void> showFailureDialog({BuildContext context, String message}) async {
  Future _close() async {
    Navigator.pop(context);
  }

  return showDialog(
      barrierDismissible: false,
      context: context,
      child: WillPopScope(
        onWillPop: () {
          return;
        },
        child: Center(
          child: AlertDialog(
            backgroundColor: Colors.white,
            content: Container(
              constraints: BoxConstraints(
                maxHeight: 180,
              ),
              child: Column(
                children: <Widget>[
                  Icon(
                    // Icons.info,
                    Icons.cancel,
                    color: Colors.redAccent[700],
                    size: 40,
                  ),
                  SizedBox(height: 20),
                  Expanded(
                      flex: 1,
                      child: Text(
                        message,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      )),
                  SizedBox(height: 10),
                  RaisedButton(
                    color: Colors.redAccent[700],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () async {
                      await _close();
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ));
}
