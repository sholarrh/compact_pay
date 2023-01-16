import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import '../utils/app_colors.dart';
import 'my_text.dart';

class ImageButton extends StatefulWidget {
  const ImageButton({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageButton> createState() => _ImageButtonState();
}

class _ImageButtonState extends State<ImageButton> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return Column(
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50.0),
                foregroundColor: white,
                backgroundColor: darkBlue,
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            onPressed: () => data.pickImage(ImageSource.camera),
            child: Row(
              children: [
                const Icon(Icons.camera_alt_outlined),
                const SizedBox(
                  width: 10,
                ),
                MyText(
                  'Camera',
                  fontSize: 14,
                )
              ],
            )),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50.0),
                foregroundColor: white,
                backgroundColor: darkBlue,
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            onPressed: () => data.pickImage(ImageSource.gallery),
            child: Row(
              children: [
                const Icon(Icons.image),
                const SizedBox(
                  width: 10,
                ),
                MyText(
                  'Gallery',
                  fontSize: 14,
                )
              ],
            )),
      ],
    );
  }
}
