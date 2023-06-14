import 'package:ex_screen_efax/src/common_widgets/space_wiget.dart';
import 'package:ex_screen_efax/src/constants/keys.dart';
import 'package:ex_screen_efax/src/features/efax/presentation/attachment/attachment_formfield.dart';
import 'package:ex_screen_efax/src/features/efax/presentation/efax_size.dart';
import 'package:ex_screen_efax/src/features/efax/presentation/widgets/input_textfield.dart';
import 'package:ex_screen_efax/src/features/efax/presentation/efax_controller.dart';
import 'package:ex_screen_efax/src/features/efax/presentation/widgets/header.dart';
import 'package:ex_screen_efax/src/features/efax/presentation/widgets/input_label.dart';
import 'package:ex_screen_efax/src/features/efax/presentation/phone_number/phone_number_formfield.dart';
import 'package:ex_screen_efax/src/features/efax/presentation/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class EfaxScreen extends ConsumerStatefulWidget {
  const EfaxScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EfaxScreenState();
}

class _EfaxScreenState extends ConsumerState<EfaxScreen> {
  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(efaxControllerProvider);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const EfaxHeader(),
              const SpaceWidget(
                height: 35,
              ),
              FormBuilder(
                key: efaxFormKey,
                initialValue: const {
                  'sender': 'Cyril Mammar',
                },
                child: Column(
                  children: [
                    const InputLabel(title: "Destinataire*"),
                    const InputTextField(
                      name: "recipient_name",
                      label: "Prénom",
                      errorMessage: "Champ obligatoire",
                    ),
                    efaxIntraFieldSpace,
                    const PhoneNumberFormField(defaultCountryCode: 'FR'),
                    efaxFieldSpace,
                    const InputLabel(title: "Expéditeur*"),
                    const InputTextField(
                      name: "sender",
                      label: "Prénom",
                      errorMessage: "Champ obligatoire",
                    ),
                    efaxFieldSpace,
                    const InputLabel(title: "Objet*"),
                    const InputTextField(
                      name: "subject",
                      label: "Radio du thorax",
                      errorMessage: "Champ obligatoire",
                    ),
                    efaxFieldSpace,
                    const InputLabel(title: "Pièce jointe*"),
                    const AttachmentFormField(),
                    efaxFieldSpace,
                    SubmitButton(
                      onSubmit: () {
                        if (efaxFormKey.currentState!.validate()) {
                          efaxFormKey.currentState!.save();
                          print(efaxFormKey.currentState!.value);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Données récupérées avec succès dans efaxFormKey')),
                          );
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
