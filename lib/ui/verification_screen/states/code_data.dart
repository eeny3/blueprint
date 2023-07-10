/// Данные введенного кода верификации
class VerificationCodeData {
  /// Текст кода
  String code;
  /// Статус кода
  bool isCorrect;

  VerificationCodeData({
    this.code = '',
    this.isCorrect = true,
  });
}