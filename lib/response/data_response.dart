import 'package:courses_app/utils/enums/app_enum.dart';

class DataResponse<T> {
  DataStatus? status;
  T? data;
  String? message;
  DataResponse(this.status, this.data, this.message);
  DataResponse.loading() : status = DataStatus.LOADIND;
  DataResponse.completed(this.data) : status = DataStatus.COMPLETED;
  DataResponse.error(this.message) : status = DataStatus.ERROR;

  @override
  String toString() {
    return "Status : $status \n Data : $data \n Error : $message ";
  }
}
