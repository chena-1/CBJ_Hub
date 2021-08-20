import 'package:cbj_hub/domain/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_hub/domain/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_hub/domain/generic_devices/generic_light_device/generic_light_entity.dart';
import 'package:cbj_hub/domain/generic_devices/generic_light_device/generic_light_value_objects.dart';
import 'package:cbj_hub/infrastructure/generic_devices/abstract_device/device_entity_dto_abstract.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_light_device_dtos.freezed.dart';
part 'generic_light_device_dtos.g.dart';

@freezed
abstract class GenericLightDeviceDtos
    implements _$GenericLightDeviceDtos, DeviceEntityDtoAbstract {
  factory GenericLightDeviceDtos(
      {
      // @JsonKey(ignore: true)
      String? deviceDtoClass,
      String? id,
      required String? defaultName,
      required String? roomId,
      required String? roomName,
      required String? deviceStateGRPC,
      String? stateMassage,
      required String? senderDeviceOs,
      required String? senderDeviceModel,
      required String? senderId,
      required String? lightSwitchState,
      required String? deviceTypes,
      required String? compUuid,
      required String? deviceVendor

      // required ServerTimestampConverter() FieldValue serverTimeStamp,
      }) = _GenericLightDeviceDtos;

  GenericLightDeviceDtos._();

  @override
  final String deviceDtoClassInstance = (GenericLightDeviceDtos).toString();

  factory GenericLightDeviceDtos.fromDomain(GenericLightDE genericLightDE) {
    return GenericLightDeviceDtos(
      deviceDtoClass: (GenericLightDeviceDtos).toString(),
      id: genericLightDE.uniqueId.getOrCrash(),
      defaultName: genericLightDE.defaultName.getOrCrash(),
      roomId: genericLightDE.roomId.getOrCrash(),
      roomName: genericLightDE.roomName.getOrCrash(),
      deviceStateGRPC: genericLightDE.deviceStateGRPC.getOrCrash(),
      stateMassage: genericLightDE.stateMassage.getOrCrash(),
      senderDeviceOs: genericLightDE.senderDeviceOs.getOrCrash(),
      senderDeviceModel: genericLightDE.senderDeviceModel.getOrCrash(),
      senderId: genericLightDE.senderId.getOrCrash(),
      lightSwitchState: genericLightDE.lightSwitchState!.getOrCrash(),
      deviceTypes: genericLightDE.deviceTypes.getOrCrash(),
      compUuid: genericLightDE.compUuid.getOrCrash(),
      deviceVendor: genericLightDE.deviceVendor.getOrCrash(),
      // serverTimeStamp: FieldValue.serverTimestamp(),
    );
  }

  factory GenericLightDeviceDtos.fromJson(Map<String, dynamic> json) =>
      _$GenericLightDeviceDtosFromJson(json);

  DeviceEntityAbstract toDomain() {
    return GenericLightDE(
      uniqueId: CoreUniqueId.fromUniqueString(id),
      defaultName: DeviceDefaultName(defaultName),
      roomId: CoreUniqueId.fromUniqueString(roomId),
      roomName: DeviceRoomName(roomName),
      deviceStateGRPC: DeviceState(deviceStateGRPC),
      stateMassage: DeviceStateMassage(stateMassage),
      senderDeviceOs: DeviceSenderDeviceOs(senderDeviceOs),
      senderDeviceModel: DeviceSenderDeviceModel(senderDeviceModel),
      senderId: DeviceSenderId.fromUniqueString(senderId),
      deviceVendor: DeviceVendor(deviceVendor),
      compUuid: DeviceCompUuid(compUuid),
      lightSwitchState: GenericLightSwitchState(lightSwitchState),
    );
  }
}

// class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
//   const ServerTimestampConverter();
//
//   @override
//   FieldValue fromJson(Object json) {
//     return FieldValue.serverTimestamp();
//   }
//
//   @override
//   Object toJson(FieldValue fieldValue) => fieldValue;
// }
