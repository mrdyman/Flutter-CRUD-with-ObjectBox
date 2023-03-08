import 'package:objectbox/objectbox.dart';

@Entity()
class Item {
  @Id()
  int itemId;
  String itemName;
  String barcode;

  Item({
    this.itemId = 0,
    required this.itemName,
    required this.barcode,
  });
}
