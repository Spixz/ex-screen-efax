import 'package:ex_screen_efax/src/common_widgets/space_wiget.dart';
import 'package:ex_screen_efax/src/features/efax/presentation/attachment/attachment_select_media_button.dart';
import 'package:ex_screen_efax/src/features/efax/presentation/attachment/attachment_viewer.dart';
import 'package:file_picker_pro/file_data.dart';
import 'package:file_picker_pro/files.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AttachmentFormField extends StatefulWidget {
  const AttachmentFormField({super.key});

  @override
  State<AttachmentFormField> createState() => _AttachmentFormFieldState();
}

class _AttachmentFormFieldState extends State<AttachmentFormField> {
  FileData _tmpFileData = FileData();
  final List<FileData> _selectedfiles = [];
  late FormFieldState<dynamic> _formFieldState;

  void selectFile() async {
    Files.filePicker(
        fileData: _tmpFileData,
        maxFileSizeInMb: 100,
        onSelected: (fileData) {
          _tmpFileData = fileData;
          setState(() {
            _selectedfiles.add(_tmpFileData);
          });
          _formFieldState.didChange(_selectedfiles);
        });
  }

  void takePicture() {
    Files.cameraPicker(
        fileData: _tmpFileData,
        onSelected: (fileData) {
          _tmpFileData = fileData;
          setState(() {
            _selectedfiles.add(_tmpFileData);
          });
          _formFieldState.didChange(_selectedfiles);
        });
  }

  void removeFile(int index) {
    setState(() {
      _selectedfiles.removeAt(index);
    });
    _formFieldState.didChange(_selectedfiles);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AttachmentViewer(
          selectedfiles: _selectedfiles,
          onRemove: removeFile,
        ),
        FormBuilderField(
          name: "attachments",
          builder: (FormFieldState<dynamic> field) {
            _formFieldState = field;
            return Row(
              children: [
                Flexible(
                    flex: 1,
                    child: AttachmentSelectMediaButton(
                      icon: Icons.add_circle_outline,
                      label: "Ajouter un document",
                      onPressed: selectFile,
                    )),
                const SpaceWidget(
                  width: 10,
                ),
                if (!kIsWeb)
                  Flexible(
                      flex: 1,
                      child: AttachmentSelectMediaButton(
                        icon: Icons.photo_camera_outlined,
                        label: "Scanner un document",
                        onPressed: takePicture,
                      )),
              ],
            );
          },
          validator: (value) {
            // if (_selectedfiles.isEmpty) {
            //   return "Champ obligatoire";
            // }
            return null;
          },
        ),
      ],
    );
  }
}
