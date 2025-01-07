import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'exceptions.dart';

/// Network class to handle network requests
abstract class Network {
  Future<dynamic> get(
    String route, {
    Map<String, dynamic> incomingHeaders = const {},
  });
  Future<dynamic> post(
    String route, {
    Map<String, dynamic> form,
    Map<String, dynamic> incomingHeaders = const {},
  });
  Future<dynamic> delete(
    String route, {
    Map<String, dynamic> incomingHeaders = const {},
  });
  Future<dynamic> patch(
    String route, {
    Map<String, dynamic> form,
    Map<String, dynamic> incomingHeaders = const {},
  });
  Future<dynamic> put(
    String route, {
    Map<String, dynamic> form,
    Map<String, dynamic> incomingHeaders = const {},
  });
}

class NetworkImplementation extends Network {
  Map<String, String> createHeaders(Map<String, dynamic> incomingHeaders) {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      ...incomingHeaders.map((key, value) => MapEntry(key, value.toString())),
    };

    return headers;
  }

  dynamic handleResponse(http.Response response) {
    if (!isSuccessResponse(response.statusCode)) {
      throw CustomException(
        message:
            'An error occurred while processing your request: ${response.reasonPhrase}',
        statusCode: response.statusCode,
      );
    } else {
      return json.decode(response.body);
    }
  }

  bool isSuccessResponse(int number) => number >= 200 && number <= 299;

  @override
  Future delete(
    String route, {
    Map<String, dynamic> incomingHeaders = const {},
  }) async {
    Map<String, String> headers = createHeaders(incomingHeaders);

    try {
      http.Response response = await http.delete(
        Uri.parse(route),
        headers: headers,
      );

      return handleResponse(response);
    } on CustomException catch (e) {
      throw CustomException(message: e.toString(), statusCode: e.statusCode);
    } on TimeoutException catch (_) {
      throw CustomException(
        message: 'Network error, Connection timed out, please try again',
        statusCode: 499,
      );
    } catch (_) {
      throw CustomException(
        message: 'Network error, check your network connection',
        statusCode: 500,
      );
    }
  }

  @override
  Future get(
    String route, {
    Map<String, dynamic> incomingHeaders = const {},
  }) async {
    Map<String, String> headers = createHeaders(incomingHeaders);

    try {
      http.Response response = await http.get(
        Uri.parse(route),
        headers: headers,
      );

      return handleResponse(response);
    } on CustomException catch (e) {
      throw CustomException(message: e.toString(), statusCode: e.statusCode);
    } on TimeoutException catch (_) {
      throw CustomException(
        message: 'Network error, Connection timed out, please try again',
        statusCode: 499,
      );
    } catch (_) {
      throw CustomException(
        message: 'Network error, Connection timed out, please try again',
        statusCode: 499,
      );
    }
  }

  @override
  Future patch(
    String route, {
    Map<String, dynamic> form = const {},
    Map<String, dynamic> incomingHeaders = const {},
  }) async {
    Map<String, String> headers = createHeaders(incomingHeaders);

    try {
      http.Response response = await http.patch(
        Uri.parse(route),
        body: json.encode(form),
        headers: headers,
      );

      return handleResponse(response);
    } on CustomException catch (e) {
      throw CustomException(message: e.toString(), statusCode: e.statusCode);
    } on TimeoutException catch (_) {
      throw CustomException(
        message: 'Network error, Connection timed out, please try again',
        statusCode: 499,
      );
    } catch (_) {
      throw CustomException(
        message: 'Network error, Connection timed out, please try again',
        statusCode: 499,
      );
    }
  }

  @override
  Future<dynamic> post(
    String route, {
    Map<String, dynamic> form = const {},
    Map<String, dynamic> incomingHeaders = const {},
  }) async {
    Map<String, String> headers = createHeaders(incomingHeaders);

    try {
      http.Response response = await http.post(
        Uri.parse(route),
        body: json.encode(form),
        headers: headers,
      );

      return handleResponse(response);
    } on CustomException catch (e) {
      throw CustomException(message: e.toString(), statusCode: e.statusCode);
    } on TimeoutException catch (_) {
      throw CustomException(
        message: 'Network error, Connection timed out, please try again',
        statusCode: 499,
      );
    } catch (e) {
      throw CustomException(
        message: 'Network error, Connection timed out, please try again',
        statusCode: 499,
      );
    }
  }

  @override
  Future put(
    String route, {
    Map<String, dynamic> form = const {},
    Map<String, dynamic> incomingHeaders = const {},
  }) async {
    Map<String, String> headers = createHeaders(incomingHeaders);

    try {
      http.Response response = await http.put(
        Uri.parse(route),
        body: json.encode(form),
        headers: headers,
      );

      return handleResponse(response);
    } on CustomException catch (e) {
      throw CustomException(message: e.toString(), statusCode: e.statusCode);
    } on TimeoutException catch (_) {
      throw CustomException(
        message: 'Network error, Connection timed out, please try again',
        statusCode: 499,
      );
    } catch (_) {
      throw CustomException(
        message: 'Network error, Connection timed out, please try again',
        statusCode: 499,
      );
    }
  }
}
