import 'package:cbj_hub/domain/generic_devices/abstract_device/core_failures.dart';
import 'package:cbj_hub/domain/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_hub/domain/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_hub/domain/generic_devices/generic_blinds_device/generic_blinds_value_objects.dart';
import 'package:cbj_hub/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_hub/infrastructure/generic_devices/abstract_device/device_entity_dto_abstract.dart';
import 'package:cbj_hub/infrastructure/generic_devices/generic_blinds_device/generic_blinds_device_dtos.dart';
import 'package:dartz/dartz.dart';

/// Abstract smart GenericBlinds that exist inside a computer, the
/// implementations will be actual GenericBlinds like blinds blindss and more
class GenericBlindsDE extends DeviceEntityAbstract {
  /// All public field of GenericBlinds entity
  GenericBlindsDE({
    required CoreUniqueId uniqueId,
    required CoreUniqueId roomId,
    required DeviceVendor deviceVendor,
    required DeviceDefaultName defaultName,
    required DeviceRoomName roomName,
    required DeviceState deviceStateGRPC,
    required DeviceStateMassage stateMassage,
    required DeviceSenderDeviceOs senderDeviceOs,
    required DeviceSenderDeviceModel senderDeviceModel,
    required DeviceSenderId senderId,
    required DeviceCompUuid compUuid,
    DevicePowerConsumption? powerConsumption,
    required this.blindsSwitchState,
  }) : super(
          uniqueId: uniqueId,
          defaultName: defaultName,
          roomId: roomId,
          deviceTypes: DeviceType(DeviceTypes.blinds.toString()),
          deviceVendor: deviceVendor,
          deviceStateGRPC: deviceStateGRPC,
          compUuid: compUuid,
          roomName: roomName,
          senderDeviceModel: senderDeviceModel,
          senderDeviceOs: senderDeviceOs,
          senderId: senderId,
          stateMassage: stateMassage,
        );

  /// State of the blinds on/off
  GenericBlindsSwitchState? blindsSwitchState;

  /// Empty instance of GenericBlindsEntity
  factory GenericBlindsDE.empty() => GenericBlindsDE(
      uniqueId: CoreUniqueId(),
      defaultName: DeviceDefaultName(''),
      roomId: CoreUniqueId(),
      roomName: DeviceRoomName(''),
      deviceStateGRPC: DeviceState(''),
      senderDeviceOs: DeviceSenderDeviceOs(''),
      senderDeviceModel: DeviceSenderDeviceModel(''),
      stateMassage: DeviceStateMassage(''),
      senderId: DeviceSenderId(),
      deviceVendor: DeviceVendor(''),
      compUuid: DeviceCompUuid(''),
      powerConsumption: DevicePowerConsumption(''),
      blindsSwitchState: GenericBlindsSwitchState(DeviceActions.off.toString()));

  //
  // /// Will return failure if any of the fields failed or return unit if fields
  // /// have legit values
  Option<CoreFailure<dynamic>> get failureOption =>
      defaultName.value.fold((f) => some(f), (_) => none());
  //
  // return body.failureOrUnit
  //     .andThen(todos.failureOrUnit)
  //     .andThen(
  //       todos
  //           .getOrCrash()
  //           // Getting the failureOption from the TodoItem ENTITY - NOT a failureOrUnit from a VALUE OBJECT
  //           .map((todoItem) => todoItem.failureOption)
  //           .filter((o) => o.isSome())
  //           // If we can't get the 0th element, the list is empty. In such a case, it's valid.
  //           .getOrElse(0, (_) => none())
  //           .fold(() => right(unit), (f) => left(f)),
  //     )
  //     .fold((f) => some(f), (_) => none());
  // }

  @override
  String getDeviceId() {
    return uniqueId.getOrCrash()!;
  }

  @override
  DeviceEntityDtoAbstract toInfrastructure() {
    return GenericBlindsDeviceDtos(
      deviceDtoClass: (GenericBlindsDeviceDtos).toString(),
      id: uniqueId.getOrCrash(),
      defaultName: defaultName.getOrCrash(),
      roomId: roomId.getOrCrash(),
      roomName: roomName.getOrCrash(),
      deviceStateGRPC: deviceStateGRPC.getOrCrash(),
      stateMassage: stateMassage.getOrCrash(),
      senderDeviceOs: senderDeviceOs.getOrCrash(),
      senderDeviceModel: senderDeviceModel.getOrCrash(),
      senderId: senderId.getOrCrash(),
      deviceTypes: deviceTypes.getOrCrash(),
      compUuid: compUuid.getOrCrash(),
      blindsSwitchState: blindsSwitchState!.getOrCrash(),
      deviceVendor: deviceVendor.getOrCrash(),
      // serverTimeStamp: FieldValue.serverTimestamp(),
    );
  }

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> executeDeviceAction(
      DeviceEntityAbstract newEntity) async {
    print('Please override this method in the non generic implementation');
    return left(const CoreFailure.actionExcecuter(
        failedValue: 'Action does not exist'));
  }

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> turnOnBlinds() async {
    print('Please override this method in the non generic implementation');
    return left(const CoreFailure.actionExcecuter(
        failedValue: 'Action does not exist'));
  }

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> turnOffBlinds() async {
    print('Please override this method in the non generic implementation');
    return left(const CoreFailure.actionExcecuter(
        failedValue: 'Action does not exist'));
  }
}
