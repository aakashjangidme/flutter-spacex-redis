import 'basic_utils.dart';

extension Extension on Object {
  bool isNullOrEmpty() => this == null || this == '';

  bool isNullEmptyOrFalse() => this == null || this == '' || !this;

  bool isNullEmptyZeroOrFalse() =>
      this == null || this == '' || !this || this == 0;
  //
  void printLog() => Utils.pLog(this);
}

extension Initials on String {
  String getInitials() => Utils.initialMethod(this);
}

/*
extension ExtendedText on Widget {
  alignAtStart() {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: this,
    );
  }
}

*/
