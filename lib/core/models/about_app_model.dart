class AboutAppModel {
  String? aboutUs;
  String? privacyPolicy;
  String? msg;
  dynamic? status;

  AboutAppModel({
    this.aboutUs,
    this.privacyPolicy,
    this.msg,
    this.status,
  });

  factory AboutAppModel.fromJson(Map<String, dynamic> json) {
    return AboutAppModel(
      aboutUs: json['data']['about_us'],
      privacyPolicy: json['data']['privacy_policy'] ,
      msg: json['msg'] as String?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': {
        'about_us': aboutUs,
        'privacy_policy': privacyPolicy,
      },
      'msg': msg,
      'status': status,
    };
  }
}
