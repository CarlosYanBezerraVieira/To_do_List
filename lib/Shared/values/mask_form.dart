import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MaskForm {
  final maskFormatterTime = MaskTextInputFormatter(
    mask: '##:##',
    filter: {'#': RegExp(r'[0-9]')},
  );
  final maskFormatterDateTime = MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {'#': RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
}
