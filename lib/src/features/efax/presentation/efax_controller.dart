import 'package:ex_screen_efax/src/features/efax/presentation/efax_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EfaxController extends StateNotifier<EfaxState> {
  EfaxController() : super(EfaxState(value: const AsyncValue.data(null)));
}

final efaxControllerProvider =
    StateNotifierProvider<EfaxController, EfaxState>((ref) {
  // final AuthRepository auth = ref.watch(authRepositoryProvider);
  return EfaxController();
});
