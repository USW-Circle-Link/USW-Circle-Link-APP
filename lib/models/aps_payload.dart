class APNSPayload {
  final String? googleCaE;
  final String? googleCFid;
  final APS aps;
  final String? googleCSenderId;
  final String? gcmMessageId;

  APNSPayload({
    this.googleCaE,
    this.googleCFid,
    required this.aps,
    this.googleCSenderId,
    this.gcmMessageId,
  });

  factory APNSPayload.fromMap(dynamic map) {
    return APNSPayload(
      aps: APS.fromMap(map['aps']),
      googleCaE: map['google.c.a.e'] as String?,
      googleCFid: map['google.c.fid'] as String?,
      gcmMessageId: map['gcm.message_id'] as String?,
      googleCSenderId: map['google.c.sender.id'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'google.c.a.e': googleCaE,
      'google.c.fid': googleCFid,
      'aps': aps.toMap(),
      'google.c.sender.id': googleCSenderId,
      'gcm.message_id': gcmMessageId,
    };
  }

  @override
  String toString() {
    return 'APNSPayload(googleCaE: $googleCaE, googleCFid: $googleCFid, aps: $aps, googleCSenderId: $googleCSenderId, gcmMessageId: $gcmMessageId)';
  }
}

class APS {
  final Alert alert;
  final double? contentAvailable;

  APS({
    required this.alert,
    this.contentAvailable,
  });

  factory APS.fromMap(dynamic map) {
    return APS(
      alert: Alert.fromMap(map['alert']),
      contentAvailable: (map['content-available'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'alert': alert.toMap(),
      'content-available': contentAvailable,
    };
  }
}

class Alert {
  final String? title;
  final String? body;

  Alert({
    this.title,
    this.body,
  });

  factory Alert.fromMap(dynamic map) {
    return Alert(
      title: map['title'] as String?,
      body: map['body'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,
    };
  }
}
