import 'package:flutter/material.dart';
import 'package:infugion_ui/screens/home_page.dart';

class ChangePage extends StatefulWidget {
  static const routeName = '/change';
  @override
  _ChangePageState createState() => _ChangePageState();
}

class _ChangePageState extends State<ChangePage> {
  final _engController = TextEditingController();
  final _csController = TextEditingController();
  final _sciController = TextEditingController();
  final _gkController = TextEditingController();
  final _socController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            topContainer(),
            Container(
              padding: EdgeInsets.all(50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _engController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'English',
                      labelStyle: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  TextField(
                    controller: _csController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'CS',
                      labelStyle: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  TextField(
                    controller: _sciController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Science',
                      labelStyle: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  TextField(
                    controller: _gkController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'GK',
                      labelStyle: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  TextField(
                    controller: _socController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Social Science',
                      labelStyle: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    onPressed: () {
                      if (_engController.text.trim().isEmpty ||
                          _csController.text.trim().isEmpty ||
                          _sciController.text.trim().isEmpty ||
                          _gkController.text.trim().isEmpty ||
                          _socController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please fill all values..'),
                          ),
                        );
                        return;
                      }
                      if ((double.parse(_engController.text) > 100 ||
                              double.parse(_engController.text) < 0) ||
                          (double.parse(_csController.text) > 100 ||
                              double.parse(_csController.text) < 0) ||
                          (double.parse(_sciController.text) > 100 ||
                              double.parse(_sciController.text) < 0) ||
                          (double.parse(_gkController.text) > 100 ||
                              double.parse(_gkController.text) < 0) ||
                          (double.parse(_socController.text) > 100 ||
                              double.parse(_socController.text) < 0)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('All Values should be between 0 and 100'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }
                      var data = [
                        double.parse(_engController.text),
                        double.parse(_csController.text),
                        double.parse(_sciController.text),
                        double.parse(_gkController.text),
                        double.parse(_socController.text),
                      ];
                      Navigator.of(context).pushNamed(
                        HomePage.routeName,
                        arguments: {
                          'data': data,
                        },
                      );
                    },
                    child: Text('Save and Load'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget topContainer() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.2),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(100.0),
          top: Radius.circular(5.0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // IconButton(
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          //   icon: Icon(
          //     Icons.arrow_back_ios,
          //     color: Colors.white,
          //     size: 26.0,
          //   ),
          // ),
          Text(
            'Subject Analyser',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
