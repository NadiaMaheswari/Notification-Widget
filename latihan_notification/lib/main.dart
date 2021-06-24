import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
          title: Text("Latihan Notification"),
        ),
        body: Center(
          child: Builder(
            builder: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    showToast();
                  },
                  child: Text("Show Toast"),
                ),
                MaterialButton(
                  onPressed: () {
                    showSnackBar();
                  },
                  child: Text("Show SnackBar"),
                ),
                MaterialButton(
                  onPressed: () {
                    showAlert(context);
                  },
                  child: Text("Show Alert"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showToast() {
    setState(() {
      Fluttertoast.showToast(
          msg: 'This is notification from toast',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP);
    });
  }

  void showSnackBar() {
    setState(() {
      final snackbar = SnackBar(
          content: Text("Notifikasi Snackbar"),
          duration: Duration(seconds: 5),
          action: SnackBarAction(label: 'Undo', onPressed: () {}));
      _scaffoldkey.currentState.showSnackBar(snackbar);
    });
  }

  void showAlert(BuildContext context) {
    setState(() {
      Widget buttonOk = MaterialButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

      Widget buttonCancel = MaterialButton(
        child: Text("Cancel"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

      AlertDialog alert = AlertDialog(
        title: Text("Simple Alert"),
        content: Text("This Is Alert Message"),
        actions: [
          buttonOk,
          buttonCancel,
        ],
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    });
  }
}
