class Payment {
  String firstname;
  String lastname;
  String cardNumber;
  String expDate;
  String cvcCode;
  int planId;
  String phoneNumber;

  Payment(
      {this.firstname,
      this.lastname,
      this.cardNumber,
      this.expDate,
      this.cvcCode,
      this.planId,
      this.phoneNumber});

  Payment.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    cardNumber = json['card_number'];
    expDate = json['exp_date'];
    cvcCode = json['cvc_code'];
    planId = json['plan_id'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['card_number'] = this.cardNumber;
    data['exp_date'] = this.expDate;
    data['cvc_code'] = this.cvcCode;
    data['plan_id'] = this.planId;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}
