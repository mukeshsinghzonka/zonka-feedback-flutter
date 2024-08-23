class Customer {
  final String? nps;
  final String ?ces;
  Customer({
     this.nps,
     this.ces,
  });

  Map<String, dynamic> toJsonCustomer() {
    return {'nps': nps??"", 'ces': ces??""};
  }
}
