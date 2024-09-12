import 'package:hive/hive.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';

part 'customer_model.g.dart';

@HiveType(typeId: HiveTypeId.customerResponse)
class Customer  extends HiveObject {
  @HiveField(0)
  final String? nps;
  @HiveField(1)
  final String ?ces;

  Customer({
     this.nps,
     this.ces,
  });

  Map<String, dynamic> toJsonCustomer() {
    return {'nps': nps??"", 'ces': ces??""};
  }
}
