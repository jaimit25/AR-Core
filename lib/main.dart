// import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
// import 'package:flutter/material.dart';
// // https://github.com/giandifra/arcore_flutter_plugin/blob/master/example/lib/screens/runtime_materials.dart

// void main() {
//   runApp( MyApp());
// }

// class MyApp extends StatelessWidget {

//   void _onArCoreViewCreated(ArCoreController controller) {
//     arCoreController = controller;
//     arCoreController.onNodeTap = (name){
//       return onTapHandler(name);
//     } 
//     arCoreController.onPlaneTap = _onPlaneTapHandler;
//   }

   

// //When the native view is created, this method is executed.
// // Here we set our arCoreController, the onNodeTap and onPlaneTap callback:
// // onNodeTap:
// // called when we touch a node on the screen, the argument is the name of the node.

// // onPlaneTap: 
// //called when we touch a point on a plane automatically detected, the argument is a 
// //list of ArCoreHitTestResult.

// // ArCoreHitTestResult: 
// //is a class that contain some info of native class HitResult 
// //(it could change during the development of this plugin)
// // And, we define the onTapHanlder method:


//   @override
//   Widget build(BuildContext context) {

//      void onTapHandler(String name) {
//     showDialog<void>(
//       context: context,
//       builder: (BuildContext context) =>
//           AlertDialog(content: Text('onNodeTap on $name')),
//     );
//   }

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Hello"),
//         ),
//         body: ArCoreView(
//           onArCoreViewCreated: _onArCoreViewCreated,
//           enableTapRecognizer: true,
//         ),
//       ),
//     );
//   }
// }


import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

void main() {
  runApp( HelloWorld());
}


class HelloWorld extends StatefulWidget {
  @override
  _HelloWorldState createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  ArCoreController arCoreController;



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello World'),
        ),
        body: ArCoreView(
          onArCoreViewCreated: _onArCoreViewCreated,
        ),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;

    _addSphere(arCoreController);
    _addCylindre(arCoreController);
    _addCube(arCoreController);
  }

  void _addSphere(ArCoreController controller) {
    final material = ArCoreMaterial(
        color: Color.fromARGB(120, 66, 134, 244));
    final sphere = ArCoreSphere(
      materials: [material],
      radius: 0.1,
    );
    final node = ArCoreNode(
      shape: sphere,
      position: vector.Vector3(0, 0, -1.5),
    );
    controller.addArCoreNode(node);
  }

  void _addCylindre(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Colors.red,
      reflectance: 1.0,
    );
    final cylindre = ArCoreCylinder(
      materials: [material],
      radius: 0.5,
      height: 0.3,
    );
    final node = ArCoreNode(
      shape: cylindre,
      position: vector.Vector3(0.0, -0.5, -2.0),
    );
    controller.addArCoreNode(node);
  }

  void _addCube(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Color.fromARGB(120, 66, 134, 244),
      metallic: 1.0,
    );
    final cube = ArCoreCube(
      materials: [material],
      size: vector.Vector3(0.5, 0.5, 0.5),
    );
    final node = ArCoreNode(
      shape: cube,
      position: vector.Vector3(-0.5, 0.5, -3.5),
    );
    controller.addArCoreNode(node);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}