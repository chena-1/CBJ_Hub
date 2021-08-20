import 'package:cbj_hub/domain/generic_devices/abstract_device/core_failures.dart';
import 'package:cbj_hub/domain/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_hub/domain/generic_devices/generic_light_device/generic_light_validators.dart';
import 'package:dartz/dartz.dart';

class GenericLightSwitchState extends ValueObjectCore<String> {
  factory GenericLightSwitchState(String? input) {
    assert(input != null);
    return GenericLightSwitchState._(
      validateGenericLightStateNotEmty(input!),
    );
  }

  const GenericLightSwitchState._(this.value);

  @override
  final Either<CoreFailure<String>, String> value;
}
