import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Contracts extends StatefulWidget {
  @override
  _ContractsState createState() => _ContractsState();
}

class _ContractsState extends State<Contracts> {
  late Future _future;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                center: Alignment.center,
                radius: 0.8,
                colors: [
                  const Color(0xFF221A4D), // blue sky
                  const Color(0xFF000000), // yellow sun
                ],
              )),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 5.0, 10.0, 5.0),
                  child: SafeArea(
                    child: FutureBuilder(
                      future: _future,
                      builder: (context, snapshot) => Text(
                        snapshot.hasData ? '${snapshot.data}' : ' Reading...',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontFamily: 'Normal', color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(
              center: Alignment.center,
              radius: 0.8,
              colors: [
                const Color(0xFF221A4D), // blue sky
                const Color(0xFF000000), // yellow sun
              ],
            )),
            child: TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/allSongs'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFFFF94F0)),
                ),
                child: Text(
                  'Agree',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 2,
                      fontFamily: 'Normal'),
                )),
          )
        ],
      ),
    );
  }

  void initState() {
    _future = getContracts();
    super.initState();
  }

  Future<String> getContracts() async {
    String contracts =
        'By clicking \"Agree\" you confirm that you have read and you agree to '
        'the terms of use and privacy policy of the service. '
        'Use of the Service is subject to them and indicates that you have '
        'read them in full and you agree to them.\n\n\n';
    final List futures = await Future.wait([
      getFileData('assets/PrivacyPolicy'),
      getFileData('assets/Contract'),
    ]);
    for (String contract in futures) {
      contracts += contract;
      contracts += "\n\n\n\n\n\n\n";
    }
    return contracts;
  }

  /// Assumes the given path is a text-file-asset.
  Future<String> getFileData(String path) async {
    return await rootBundle.loadString(path);
  }
}
