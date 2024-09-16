import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start FlutterFlow + Google Sheets ApiFlow API Group Code

class FlutterFlowGoogleSheetsApiFlowAPIGroup {
  static String getBaseUrl() =>
      'https://gw.apiflow.online/api/60191aba31714202b463fe4674c076f7';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer YmI0NTk3YTllN2RkZGFlZDViOTdiYWM4ZTMyZmU4YjQ6MzI5M2UyYTJjYmMwNTgwZDUwOWIwYTU1ZWQ5Y2Q1ODc=',
  };
  static ListSheetRowsCall listSheetRowsCall = ListSheetRowsCall();
  static InsertNewRowCall insertNewRowCall = InsertNewRowCall();
  static GetSheetRowByIndexCall getSheetRowByIndexCall =
      GetSheetRowByIndexCall();
  static UpdateRowCall updateRowCall = UpdateRowCall();
  static GetAllDataCall getAllDataCall = GetAllDataCall();
  static InsertNewRowInSheet2Call insertNewRowInSheet2Call =
      InsertNewRowInSheet2Call();
  static GetSheet2RowByIndexCall getSheet2RowByIndexCall =
      GetSheet2RowByIndexCall();
  static UpdateSheet2RowCall updateSheet2RowCall = UpdateSheet2RowCall();
  static ListAllSheetsCall listAllSheetsCall = ListAllSheetsCall();
  static FindSheetCall findSheetCall = FindSheetCall();
  static CreateNewSheetCall createNewSheetCall = CreateNewSheetCall();
}

class ListSheetRowsCall {
  Future<ApiCallResponse> call({
    String? sheet = '',
    int? start,
    int? limit,
    String? search = '',
  }) async {
    final baseUrl = FlutterFlowGoogleSheetsApiFlowAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'List sheet rows',
      apiUrl: '$baseUrl/sheets/$sheet/rows',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer YmI0NTk3YTllN2RkZGFlZDViOTdiYWM4ZTMyZmU4YjQ6MzI5M2UyYTJjYmMwNTgwZDUwOWIwYTU1ZWQ5Y2Q1ODc=',
      },
      params: {
        'start': start,
        'limit': limit,
        'search': search,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class InsertNewRowCall {
  Future<ApiCallResponse> call({
    String? sheet = '',
  }) async {
    final baseUrl = FlutterFlowGoogleSheetsApiFlowAPIGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "a": "value",
  "b": "value",
  "c": "value",
  "d": "value",
  "e": "value",
  "f": "value",
  "g": "value"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Insert new row',
      apiUrl: '$baseUrl/sheets/$sheet/rows',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer YmI0NTk3YTllN2RkZGFlZDViOTdiYWM4ZTMyZmU4YjQ6MzI5M2UyYTJjYmMwNTgwZDUwOWIwYTU1ZWQ5Y2Q1ODc=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetSheetRowByIndexCall {
  Future<ApiCallResponse> call({
    String? sheet = '',
    int? index,
  }) async {
    final baseUrl = FlutterFlowGoogleSheetsApiFlowAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get sheet row by index',
      apiUrl: '$baseUrl/sheets/$sheet/rows/$index',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer YmI0NTk3YTllN2RkZGFlZDViOTdiYWM4ZTMyZmU4YjQ6MzI5M2UyYTJjYmMwNTgwZDUwOWIwYTU1ZWQ5Y2Q1ODc=',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateRowCall {
  Future<ApiCallResponse> call({
    String? sheet = '',
    int? index,
  }) async {
    final baseUrl = FlutterFlowGoogleSheetsApiFlowAPIGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "a": "value",
  "b": "value",
  "c": "value",
  "d": "value",
  "e": "value",
  "f": "value",
  "g": "value"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update row',
      apiUrl: '$baseUrl/sheets/$sheet/rows/$index',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization':
            'Bearer YmI0NTk3YTllN2RkZGFlZDViOTdiYWM4ZTMyZmU4YjQ6MzI5M2UyYTJjYmMwNTgwZDUwOWIwYTU1ZWQ5Y2Q1ODc=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllDataCall {
  Future<ApiCallResponse> call({
    int? start,
    int? limit,
    String? search = '',
  }) async {
    final baseUrl = FlutterFlowGoogleSheetsApiFlowAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetAllData',
      apiUrl: '$baseUrl/sheets/1871543517/rows',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer YmI0NTk3YTllN2RkZGFlZDViOTdiYWM4ZTMyZmU4YjQ6MzI5M2UyYTJjYmMwNTgwZDUwOWIwYTU1ZWQ5Y2Q1ODc=',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$[:].date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? amount(dynamic response) => (getJsonField(
        response,
        r'''$[:].coins''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? hash(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].hash''',
      ));
}

class InsertNewRowInSheet2Call {
  Future<ApiCallResponse> call() async {
    final baseUrl = FlutterFlowGoogleSheetsApiFlowAPIGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "a": "1-Aug",
  "b": "30,210,517.00",
  "c": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Insert new row in Sheet2',
      apiUrl: '$baseUrl/sheets/1871543517/rows',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer YmI0NTk3YTllN2RkZGFlZDViOTdiYWM4ZTMyZmU4YjQ6MzI5M2UyYTJjYmMwNTgwZDUwOWIwYTU1ZWQ5Y2Q1ODc=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetSheet2RowByIndexCall {
  Future<ApiCallResponse> call({
    int? index,
  }) async {
    final baseUrl = FlutterFlowGoogleSheetsApiFlowAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Sheet2 row by index',
      apiUrl: '$baseUrl/sheets/1871543517/rows/$index',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer YmI0NTk3YTllN2RkZGFlZDViOTdiYWM4ZTMyZmU4YjQ6MzI5M2UyYTJjYmMwNTgwZDUwOWIwYTU1ZWQ5Y2Q1ODc=',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateSheet2RowCall {
  Future<ApiCallResponse> call({
    int? index,
  }) async {
    final baseUrl = FlutterFlowGoogleSheetsApiFlowAPIGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "a": "1-Aug",
  "b": "30,210,517.00",
  "c": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Sheet2 row',
      apiUrl: '$baseUrl/sheets/1871543517/rows/$index',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization':
            'Bearer YmI0NTk3YTllN2RkZGFlZDViOTdiYWM4ZTMyZmU4YjQ6MzI5M2UyYTJjYmMwNTgwZDUwOWIwYTU1ZWQ5Y2Q1ODc=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListAllSheetsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = FlutterFlowGoogleSheetsApiFlowAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'List all sheets',
      apiUrl: '$baseUrl/sheets/list',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer YmI0NTk3YTllN2RkZGFlZDViOTdiYWM4ZTMyZmU4YjQ6MzI5M2UyYTJjYmMwNTgwZDUwOWIwYTU1ZWQ5Y2Q1ODc=',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FindSheetCall {
  Future<ApiCallResponse> call({
    String? title = '',
  }) async {
    final baseUrl = FlutterFlowGoogleSheetsApiFlowAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Find sheet',
      apiUrl: '$baseUrl/sheets/find',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer YmI0NTk3YTllN2RkZGFlZDViOTdiYWM4ZTMyZmU4YjQ6MzI5M2UyYTJjYmMwNTgwZDUwOWIwYTU1ZWQ5Y2Q1ODc=',
      },
      params: {
        'title': title,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateNewSheetCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = FlutterFlowGoogleSheetsApiFlowAPIGroup.getBaseUrl();

    const ffApiRequestBody = '''
{
  "title": "Sheet title",
  "headers": [
    ""
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create new sheet',
      apiUrl: '$baseUrl/sheets/create',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer YmI0NTk3YTllN2RkZGFlZDViOTdiYWM4ZTMyZmU4YjQ6MzI5M2UyYTJjYmMwNTgwZDUwOWIwYTU1ZWQ5Y2Q1ODc=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End FlutterFlow + Google Sheets ApiFlow API Group Code

class PriceCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Price',
      apiUrl: 'https://lmbfvy.buildship.run/coinPrice',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'limit': 1000,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List? quotes(dynamic response) => getJsonField(
        response,
        r'''$.data[:].quote''',
        true,
      ) as List?;
  static List<double>? prices(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].quote.USD.price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
}

class TrendingCoinCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'TrendingCoin',
      apiUrl: 'https://lmbfvy.buildship.run/coinTrending',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'limit': 1000,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MostVisitedCoinCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'MostVisitedCoin',
      apiUrl: 'https://lmbfvy.buildship.run/MosVisitetCoin',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'limit': 1000,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RecentlyAddedCoinCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'RecentlyAddedCoin',
      apiUrl: 'https://lmbfvy.buildship.run/newCoin',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'limit': 1000,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAnalyticsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAnalytics',
      apiUrl: 'https://analyticsreporting.googleapis.com/v4/reports:batchGet',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class NewsLatestCall {
  static Future<ApiCallResponse> call({
    int? page = 1,
    String? search = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'NewsLatest',
      apiUrl: 'https://lmbfvy.buildship.run/latestNews',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': "sykcy9s1ncv8ypub8lnst6tufqewvhqhip12hv7e",
        'page': page,
        'items': 20,
        'sourceexclude':
            "bitcoinist, coinpedia, benzinga, coinpedia, cryptoticker, cryptopolitan, cryptoslate, Bitcoin, crypto, beincrypto, forbes, dailycoin, finbold, theblock, u, the block, blockworks, zycrypto, coincu, cryptonomist, reuters, UToday",
        'search': search,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? news(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].news_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].image_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sourcename(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].source_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sentiment(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].sentiment''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? type(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
