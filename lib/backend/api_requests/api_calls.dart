import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SmartCarConnectCall {
  static Future<ApiCallResponse> call({
    String? clientId = 'db43eacf-4a95-44fc-a955-87c6e45afd8e',
    String? redirectUri = 'scdb43eacf-4a95-44fc-a955-87c6e45afd8e://exchange',
    String? scope =
        'read_vin read_vehicle_info read_location read_engine_oil read_battery read_charge read_fuel control_security read_odometer read_tires read_charge',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'SmartCar Connect',
      apiUrl: 'https://connect.smartcar.com/oauth/authorize',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'response_type': "code",
        'client_id': clientId,
        'scope': scope,
        'redirect_uri': redirectUri,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
