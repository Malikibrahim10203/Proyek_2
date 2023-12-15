import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

import 'package:smartfarm/model/response_model.dart';
import 'package:smartfarm/pages/deteksi/preview.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key, required this.cameras}) : super(key: key);

  final List<CameraDescription>? cameras;

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _cameraController;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  void _initCamera() async {
    _cameraController =
        CameraController(widget.cameras![0], ResolutionPreset.high);
    await _cameraController.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _takePicture() async {
  try {
    if (!_cameraController.value.isInitialized) {
      return;
    }
    XFile picture = await _cameraController.takePicture();
    ApiResponse apiResponse = await _uploadPicture(picture);
    
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PreviewPage(
          picture: picture,
          apiResponse: apiResponse,
        ),
      ),
    );
  } catch (e) {
    print('Error taking picture: $e');
  }
}

  Future<ApiResponse> _uploadPicture(XFile picture) async {
  try {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://103.149.71.213:8003/prediction'),
    );

    request.files.add(await http.MultipartFile.fromPath('file', picture.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData =
          json.decode(await response.stream.bytesToString());
          
      return ApiResponse.fromJson(responseData['data']);
    } else {
      print('Failed to upload picture. Status code: ${response.statusCode}');
      // Handle the error case if needed
      return ApiResponse(
        prediction: '',
        confidence: 0.0,
        imagePath: '',
        fileName: '',
        description: '',
        pengendalianHayati: '',
        pengendalianKimiawi: '',
      );
    }
  } catch (e) {
    print('Error uploading picture: $e');
    // Handle the error case if needed
    return ApiResponse(
      prediction: '',
      confidence: 0.0,
      imagePath: '',
      fileName: '',
      description: '',
      pengendalianHayati: '',
      pengendalianKimiawi: '',
    );
  }
}


  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Page'),
      ),
      body: _cameraController.value.isInitialized
          ? CameraPreview(_cameraController)
          : CircularProgressIndicator(),
      floatingActionButton: FloatingActionButton(
        onPressed: _takePicture,
        child: Icon(Icons.camera),
      ),
    );
  }
}