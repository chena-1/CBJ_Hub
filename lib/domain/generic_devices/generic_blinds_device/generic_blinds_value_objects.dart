import 'package:cbj_hub/domain/generic_devices/abstract_device/core_failures.dart';
import 'package:cbj_hub/domain/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_hub/domain/generic_devices/generic_blinds_device/generic_blinds_validators.dart';
import 'package:dartz/dartz.dart';

class GenericBlindsSwitchState extends ValueObjectCore<String> {
  factory GenericBlindsSwitchState(String? input) {
    assert(input != null);
    return GenericBlindsSwitchState._(
      validateGenericBlindsStateNotEmty(input!),
    );
  }

  const GenericBlindsSwitchState._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}
