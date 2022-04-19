class ApiRespose {
  final bool _isSuccess;
  final String? _message;
  dynamic response = null;
  ApiRespose(this._isSuccess, this._message, {this.response});
  String? get message => _message;
  bool get isSuccess => _isSuccess;
  // ignore: unused_element
  dynamic get _response => response;
}
