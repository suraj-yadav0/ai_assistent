import 'package:flutter/material.dart';

class ImageCreatorFeature extends StatefulWidget {
  const ImageCreatorFeature({super.key});

  @override
  State<ImageCreatorFeature> createState() => _ImageCreatorFeatureState();
}

class _ImageCreatorFeatureState extends State<ImageCreatorFeature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Image Creator'),

      ),

      body: ListView(
        children: [],
      ),
    );
  }
}