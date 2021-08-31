import 'package:cbj_hub/domain/generic_devices/abstract_device/core_failures.dart';
import 'package:cbj_hub/domain/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_hub/infrastructure/gen/cbj_hub_server/protoc_as_dart/cbj_hub_server.pbgrpc.dart';
import 'package:cbj_hub/infrastructure/generic_devices/abstract_device/device_entity_dto_abstract.dart';
import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

abstract class DeviceEntityAbstract {
  DeviceEntityAbstract({
    required this.uniqueId,
    required this.deviceVendor,
    required this.deviceTypes,
    required this.defaultName,
    required this.roomId,
    required this.roomName,
    required this.stateMassage,
    required this.senderDeviceOs,
    required this.senderDeviceModel,
    required this.senderId,
    required this.compUuid,
    required this.deviceStateGRPC,
  });

  CoreUniqueId uniqueId;

  /// The default name of the GenericLight
  DeviceDefaultName defaultName;

  /// Room id that the smart GenericLight located in.
  CoreUniqueId roomId;

  /// Room name that the smart GenericLight located in.
  DeviceRoomName roomName;

  /// Did the massage arrived or was it just sent.
  /// Will be 'set' (need change) or 'ack' for acknowledge
  DeviceState deviceStateGRPC;

  /// If state didn't change the error description will be found here.
  DeviceStateMassage stateMassage;

  /// Sender GenericLight os type, example: android, iphone, browser
  DeviceSenderDeviceOs senderDeviceOs;

  /// The sender GenericLight model; example: onePlus 3T
  DeviceSenderDeviceModel senderDeviceModel;

  /// Last GenericLight sender id that activated the action
  DeviceSenderId senderId;

  /// The smart GenericLight type
  DeviceType deviceTypes;

  /// The smart GenericLight type
  DeviceVendor deviceVendor;

  /// Unique id of the computer that the GenericLight located in
  DeviceCompUuid compUuid;

  String getDeviceId();

  DeviceEntityDtoAbstract toInfrastructure() {
    return DeviceEntityDtoAbstract();
  }

  /// Please override the following methods
  Future<Either<CoreFailure, Unit>> executeDeviceAction(
      DeviceEntityAbstract newEntity);
}

class DeviceEntityNotAbstract extends DeviceEntityAbstract {
  DeviceEntityNotAbstract()
      : super(
          uniqueId: CoreUniqueId(),
          deviceVendor: DeviceVendor(
              VendorsAndServices.vendorsAndServicesNotSupported.toString()),
          deviceStateGRPC: DeviceState(DeviceTypes.typeNotSupported.toString()),
          compUuid: DeviceCompUuid(Uuid().v1().toString()),
          defaultName: DeviceDefaultName('No Name'),
          deviceTypes: DeviceType(DeviceTypes.light.toString()),
          roomId: CoreUniqueId(),
          roomName: DeviceRoomName('No name'),
          senderDeviceModel: DeviceSenderDeviceModel('a'),
          senderDeviceOs: DeviceSenderDeviceOs('b'),
          senderId: DeviceSenderId(),
          stateMassage: DeviceStateMassage('go'),
        );

  DeviceEntityDtoAbstract toInfrastructure() {
    return DeviceEntityDtoAbstract();
  }

  @override
  String getDeviceId() {
    // TODO: implement getDeviceId
    throw UnimplementedError();
  }

  @override
  Future<Either<CoreFailure, Unit>> executeDeviceAction(
      DeviceEntityAbstract newEntity) {
    // TODO: implement executeDeviceAction
    throw UnimplementedError();
  }

  /// The smart device id
// DeviceUniqueId? id;
//
// /// The default name of the device
// DeviceDefaultName? defaultName;
}

//
// part 'device_entity_abstract.freezed.dart';
//
// /// Abstract smart device that exist inside a computer, the implementations will
// /// be actual device like blinds lights and more
// @freezed
// abstract class DeviceEntityAbstract implements _$DeviceEntityAbstract {
//   /// All public field of device entity
//   const factory DeviceEntityAbstract({
//     /// The smart device id
//     required DeviceUniqueId? id,
//
//     /// The default name of the device
//     required DeviceDefaultName? defaultName,
//   }) = _DeviceEntityAbstract;
//
//   const DeviceEntityAbstract._();
//
//   /// Empty instance of DeviceEntity
//   factory DeviceEntityAbstract.empty() => DeviceEntityAbstract(
//         id: DeviceUniqueId(),
//         defaultName: DeviceDefaultName(''),
//       );
//
//   /// Will return failure if any of the fields failed or return unit if fields
//   /// have legit values
//   Option<DevicesFailure<dynamic>> get failureOption {
//     return defaultName!.value.fold((f) => some(f), (_) => none());
//     //
//     // return body.failureOrUnit
//     //     .andThen(todos.failureOrUnit)
//     //     .andThen(
//     //       todos
//     //           .getOrCrash()
//     //           // Getting the failureOption from the TodoItem ENTITY - NOT a failureOrUnit from a VALUE OBJECT
//     //           .map((todoItem) => todoItem.failureOption)
//     //           .filter((o) => o.isSome())
//     //           // If we can't get the 0th element, the list is empty. In such a case, it's valid.
//     //           .getOrElse(0, (_) => none())
//     //           .fold(() => right(unit), (f) => left(f)),
//     //     )
//     //     .fold((f) => some(f), (_) => none());
//   }
// }
