// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
//
// class CameraScreen extends StatefulWidget {
//   final CameraController cameraController;
//
//   const CameraScreen({required this.cameraController});
//
//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }
//
// class _CameraScreenState extends State<CameraScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _startCameraPreview();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     widget.cameraController.dispose();
//   }
//
//   Future<void> _startCameraPreview() async {
//     try {
//       await widget.cameraController.initialize();
//       await widget.cameraController.startImageStream((CameraImage image) {
//         // Process the camera image
//       });
//     } catch (e) {
//       print('Error starting camera preview: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Camera'),
//       ),
//       body: FutureBuilder<void>(
//         future: widget.cameraController.initialize(),
//         builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return CameraPreview(widget.cameraController);
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }
