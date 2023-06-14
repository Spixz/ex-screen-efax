import 'dart:io';

import 'package:ex_screen_efax/src/constants/colors.dart';
import 'package:file_picker_pro/file_data.dart';
import 'package:flutter/material.dart';

class AttachmentViewer extends StatelessWidget {
  final List<FileData> selectedfiles;
  final Function onRemove;
  const AttachmentViewer(
      {super.key, required this.selectedfiles, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: selectedfiles.length,
            itemBuilder: (context, index) {
              if (selectedfiles[index].fileMimeType.contains("image")) {
                return Stack(fit: StackFit.passthrough, children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        height: 200,
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Image.file(
                          File(selectedfiles[index].filePath),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Positioned(
                    top: 5,
                    right: 6,
                    child: Opacity(
                      opacity: 0.8,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(const CircleBorder()),
                          backgroundColor: MaterialStateProperty.all(
                              closeButtonBackgroundColor),
                        ),
                        onPressed: () => onRemove(index),
                        child: const Icon(
                          Icons.close,
                          color: closeButtonForegroundColor,
                        ),
                      ),
                    ),
                  ),
                ]);
              }
              return SizedBox(
                width: double.infinity,
                child: ListTile(
                  title: Text(selectedfiles[index].fileName),
                  trailing: IconButton(
                    icon: const Icon(Icons.close,
                        color: closeButtonForegroundColor),
                    onPressed: () => onRemove(index),
                  ),
                ),
              );
            }));
  }
}
