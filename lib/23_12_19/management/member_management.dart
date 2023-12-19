import 'package:untitled/23_12_19/model/member_info.dart';

import 'management.dart';

class MemberManagementImpl implements Management {
  static MemberManagementImpl? _instance;

  static const int backFromMember = 0;
  static const int searchMember = 1;
  static const int registerMember = 2;
  static const int modifyMemberInfo = 3;
  static const int deleteMember = 4;
  static const int cancelDeleteMember = 5;

  static const String memberMsg =
      '0.뒤로\t1.회원조회\t2.회원등록\t3.회원수정\t4.회원삭제\t5.삭제취소';
  static const memberCommandRange = '0 and 5!\n';

  MemberManagementImpl._();

  static MemberManagementImpl get instance {
    _instance ??= MemberManagementImpl._();
    return _instance!;
  }

  Data searchInfo(int id) {
    print('MemberManagementImpl searchInfo');
    // for test
    return MemberInfo(
        name: 'name',
        address: 'address',
        gender: 'gender',
        phone: 'phone',
        birthday: DateTime.parse('2000-10-10'));
  }

  bool cancelDelDataInfo(int id) {
    print('MemberManagementImpl cancelDelDataInfo');
    return false;
  }

  @override
  bool addInfo(Data data) {
    print('MemberManagementImpl addInfo');
    return false;
  }

  @override
  bool delDataInfo(int id) {
    print('MemberManagementImpl delDataInfo');
    return false;
  }

  @override
  List<Data> getAllDataListInfo() {
    print('MemberManagementImpl getAllDataListInfo');
    return [];
  }

  @override
  bool modifyInfo(Data data, int id) {
    print('MemberManagementImpl modifyInfo');
    return false;
  }
}
