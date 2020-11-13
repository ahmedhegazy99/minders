// Help to store datetime in firestore
import 'package:cloud_firestore/cloud_firestore.dart';

DateTime dateTimeFromTimestamp(Timestamp timestamp) =>
    DateTime.parse(timestamp.toDate().toString());
Timestamp dateTimeToTimestamp(DateTime dateTime) =>
    Timestamp.fromDate(dateTime);
