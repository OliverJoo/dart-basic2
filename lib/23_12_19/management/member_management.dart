import 'management.dart';

class MemberManagementImpl implements Management {
  static MemberManagementImpl? _instance;

  static const int backwardFromMember = 0;
  static const int searchMember = 1;
  static const int registerMember = 2;
  static const int modifyMemberInfo = 3;
  static const int deleteMember = 4;
  static const int cancelDeleteMember = 5;

  static const String memberMsg = '0.뒤로\t1.회원조회\t2.회원등록\t3.회원수정\t4.회원삭제\t5.삭제취소';


  MemberManagementImpl._();

  static MemberManagementImpl get instance {
    _instance ??= MemberManagementImpl._();
    return _instance!;
  }

  @override
  bool addInfo(Data data) {
    return false;
  }

  @override
  bool delDataInfo(int id) {
    return false;
  }

  @override
  List<Data> getAllDataListInfo() {
    return [];
  }

  @override
  bool modifyInfo(Data data) {
    return false;
  }
}
