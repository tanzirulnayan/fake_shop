import 'package:fake_shop/models/common/error_model.dart';

class TextResponse extends ErrorModel {
  TextResponse({
    required this.text,
  }) : super(
          hasError: true,
          errorType: 'Error',
          errorMessage: 'Oops! Something went wrong.',
        );

  String text;
}
