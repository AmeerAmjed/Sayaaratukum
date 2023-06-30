import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';

enum RequestState {
  serverError,
  invalidRequest,
  unauthorized,
  forbidden,
  invalidData,
  internet,
  retry,
}

class RequestResult {
  final RequestState state;
  final String message;

  RequestResult(this.state, this.message);
}

RequestResult errorHandler(Response response) {
  switch (response.statusCode) {
    case null:
      return RequestResult(RequestState.internet, L10n.internetIssue.tr);
    case 500:
      return RequestResult(RequestState.serverError, 'مشكلة في السيرفر');
    case 400:
    case 401:
      return RequestResult(RequestState.invalidRequest, 'طلب غير صالح');
    case 403:
      return RequestResult(RequestState.forbidden, 'غير مصرح');
    case 422:
      return RequestResult(RequestState.invalidData, 'بيانات غير مطابقة');
    default:
      return RequestResult(RequestState.retry, 'حدث خطأ أعد المحاولة');
  }
}
