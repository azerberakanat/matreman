import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

import 'anaSayfa.dart';

class DosyaIndirme extends StatefulWidget {
  @override
  _DosyaIndirmeState createState() => _DosyaIndirmeState();
}

class _DosyaIndirmeState extends State<DosyaIndirme> {


  String _filePath = "";

  Future<String> get _localDevicePath async {
    final _devicePath = await getApplicationDocumentsDirectory();
    return _devicePath.path;
  }

  Future<File> _localFile({String path, String type}) async {
    String _path = await _localDevicePath;

    var _newPath = await Directory("$_path/$path").create();
    return File("${_newPath.path}/azer.$type");
  }

  Future _indirmePDF() async {
    final _response =
    await http.get(Uri.parse(
        "http://www.africau.edu/images/default/sample.pdf"));
    if (_response.statusCode == 200) {
      final _file = await _localFile(path: "azer", type: "pdf");
      final _saveFile = await _file.writeAsBytes(_response.bodyBytes);
      Logger().i("Dosya yazma işlemi tamamlandı. Dosya konumu ${_saveFile.path}");
      setState(() {
        _filePath = _saveFile.path;
      });
    } else {
      Logger().e(_response.statusCode);
    }
  }

  Future _videoindirme() async {
    final _response = await http.get(Uri.parse(
        "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_2mb.mp4"));
    if (_response.statusCode == 200) {
      final _file = await _localFile(type: "mp4", path: "videos");
      final _saveFile = await _file.writeAsBytes(_response.bodyBytes);
      Logger().i("Dosya yazma işlemi tamamlandı. Dosya konumu ${_saveFile.path}");
      setState(() {
        _filePath = _saveFile.path;
      });
    } else {
      Logger().e(_response.statusCode);
    }
  }

  Future<bool> _onBackPressed() {

    return showDialog(
      context: context,
      builder: (context) => anaSayfa()
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: Icon(Icons.file_download),
                label: Text("Örnek PDF"),
                onPressed: () {
                  _indirmePDF();
                },
              ),
              TextButton.icon(
                icon: Icon(Icons.file_download),
                label: Text("Örnek Video"),
                onPressed: () {
                  _videoindirme();
                },
              ),
              Text(_filePath),
              TextButton.icon(
                icon: Icon(Icons.shop_two),
                label: Text("Göster"),
                onPressed: () async {
                  final _openFile = await OpenFile.open(_filePath);
                  Logger().i(_openFile);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}