// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ex_screen_efax/src/features/efax/domain/efax_class.dart';

class EfaxState {
  final Efax? efax;
  AsyncValue value;
  EfaxState({
    this.efax,
    required this.value,
  });
}
