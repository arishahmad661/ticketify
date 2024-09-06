class ResponseOrderIDModel {
  Message? message;

  ResponseOrderIDModel({this.message});

  ResponseOrderIDModel.fromJson(Map<String, dynamic> json) {
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    return data;
  }
}

class Message {
  late int amount;
  int? amountDue;
  int? amountPaid;
  int? attempts;
  int? createdAt;
  String? currency;
  String? entity;
  late String id;
  String? offerId;
  String? receipt;
  String? status;

  Message(
      {required this.amount,
        this.amountDue,
        this.amountPaid,
        this.attempts,
        this.createdAt,
        this.currency,
        this.entity,
        required this.id,
        this.offerId,
        this.receipt,
        this.status});

  Message.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    amountDue = json['amount_due'];
    amountPaid = json['amount_paid'];
    attempts = json['attempts'];
    createdAt = json['created_at'];
    currency = json['currency'];
    entity = json['entity'];
    id = json['id'];
    offerId = json['offer_id'];
    receipt = json['receipt'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['amount_due'] = this.amountDue;
    data['amount_paid'] = this.amountPaid;
    data['attempts'] = this.attempts;
    data['created_at'] = this.createdAt;
    data['currency'] = this.currency;
    data['entity'] = this.entity;
    data['id'] = this.id;
    data['offer_id'] = this.offerId;
    data['receipt'] = this.receipt;
    data['status'] = this.status;
    return data;
  }
}