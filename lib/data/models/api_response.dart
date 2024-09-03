class ApiResponse<T> {
  final T? data;
  final String? error;
  final int? code;

  ApiResponse({this.data, this.error, this.code});
}