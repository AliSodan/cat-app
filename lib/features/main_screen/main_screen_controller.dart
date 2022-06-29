import 'package:riverpod/riverpod.dart';

final catListButtonBooleanProvider=StateProvider.autoDispose<bool>((ref)=>false);
final searchCatsButtonBooleanProvider=StateProvider.autoDispose<bool>((ref)=>false);
final gategoryButtonBooleanProvider=StateProvider.autoDispose<bool>((ref)=>false);