enum postTag{
  Food,
  Electronics,
  Clothing,
  Services,
  HealthCare,

}

String tagToString (Object o) => o.toString().split('.').last;
postTag tagFromString (String tagString) => postTag.values.firstWhere((e) => tagString == tagToString(e), orElse: ()=> null);
