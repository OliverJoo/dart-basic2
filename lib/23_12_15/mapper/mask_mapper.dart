import '../dto/MaskDto.dart';
import '../model/store.dart';

extension StoresToStore on Stores {
  Store toStore() {
    return Store(
      name: name ?? '아무개',
      address: addr ?? '주소 없음',
      stock: remainStat ?? 'null',
      type: type != null ? int.parse(type!) : 0,
    );
  }
}