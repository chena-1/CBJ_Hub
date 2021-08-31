import 'package:cbj_hub/domain/generic_devices/abstract_device/device_entity_abstract.dart';
import 'package:cbj_hub/domain/generic_devices/abstract_device/value_objects_core.dart';
import 'package:cbj_hub/domain/generic_devices/generic_rgbw_light_device/generic_rgbw_light_entity.dart';
import 'package:cbj_hub/domain/generic_devices/generic_rgbw_light_device/generic_rgbw_light_value_objects.dart';
import 'package:cbj_hub/infrastructure/generic_devices/abstract_device/device_entity_dto_abstract.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_rgbw_light_device_dtos.freezed.dart';
part 'generic_rgbw_light_device_dtos.g.dart';

@freezed
abstract class GenericRgbwLightDeviceDtos
    implements _$GenericRgbwLightDeviceDtos, DeviceEntityDtoAbstract {
  factory GenericRgbwLightDeviceDtos({
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
    required String? deviceTypes,
    required String? compUuid,
    required String? deviceVendor,
    required String? lightSwitchState,
    required String? lightColorTemperature,
    required String? lightBrightness,

    // required ServerTimestampConverter() FieldValue serverTimeStamp,
  }) = _GenericRgbwLightDeviceDtos;

  GenericRgbwLightDeviceDtos._();

  @override
  final String deviceDtoClassInstance = (GenericRgbwLightDeviceDtos).toString();

  factory GenericRgbwLightDeviceDtos.fromDomain(
      GenericRgbwLightDE genericRgbwLightDE) {
    return GenericRgbwLightDeviceDtos(
      deviceDtoClass: (GenericRgbwLightDeviceDtos).toString(),
      id: genericRgbwLightDE.uniqueId.getOrCrash(),
      defaultName: genericRgbwLightDE.defaultName.getOrCrash(),
      roomId: genericRgbwLightDE.roomId.getOrCrash(),
      roomName: genericRgbwLightDE.roomName.getOrCrash(),
      deviceStateGRPC: genericRgbwLightDE.deviceStateGRPC.getOrCrash(),
      stateMassage: genericRgbwLightDE.stateMassage.getOrCrash(),
      senderDeviceOs: genericRgbwLightDE.senderDeviceOs.getOrCrash(),
      senderDeviceModel: genericRgbwLightDE.senderDeviceModel.getOrCrash(),
      senderId: genericRgbwLightDE.senderId.getOrCrash(),
      lightSwitchState: genericRgbwLightDE.lightSwitchState!.getOrCrash(),
      deviceTypes: genericRgbwLightDE.deviceTypes.getOrCrash(),
      compUuid: genericRgbwLightDE.compUuid.getOrCrash(),
      deviceVendor: genericRgbwLightDE.deviceVendor.getOrCrash(),
      lightColorTemperature:
          genericRgbwLightDE.lightColorTemperature!.getOrCrash(),
      lightBrightness: genericRgbwLightDE.lightBrightness!.getOrCrash(),
      // serverTimeStamp: FieldValue.serverTimestamp(),
    );
  }

  factory GenericRgbwLightDeviceDtos.fromJson(Map<String, dynamic> json) =>
      _$GenericRgbwLightDeviceDtosFromJson(json);

  DeviceEntityAbstract toDomain() {
    return GenericRgbwLightDE(
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
      lightSwitchState: GenericRgbwLightSwitchState(lightSwitchState),
      lightColorTemperature:
          GenericRgbwLightColorTemperature(lightColorTemperature),
      lightBrightness: GenericRgbwLightBrightness(lightBrightness),
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
