class PaymentSuccessResponseModel {
  final String? paymentId;
  final String? orderId;
  final String? signature;

  PaymentSuccessResponseModel({
    this.paymentId,
    this.orderId,
    this.signature,
  });

  Map<dynamic, dynamic> toJson() {
    return {
      'paymentId': paymentId,
      'orderId': orderId,
      'signature': signature,
    };
  }

  factory PaymentSuccessResponseModel.fromJson(Map<String, dynamic> json) {
    return PaymentSuccessResponseModel(
      paymentId: json['paymentId'],
      orderId: json['orderId'],
      signature: json['signature'],
    );
  }

  factory PaymentSuccessResponseModel.fromMap(Map<String, dynamic> map) {
    return PaymentSuccessResponseModel(
      paymentId: map['razorpay_payment_id'] ?? '',
      orderId: map['razorpay_order_id'] ?? '',
      signature: map['razorpay_signature'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'razorpay_payment_id': paymentId,
      'razorpay_order_id': orderId,
      'razorpay_signature': signature,
    };
  }
}
