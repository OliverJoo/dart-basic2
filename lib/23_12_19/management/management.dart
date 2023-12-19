abstract interface class Management{
  bool addInfo(Data data);

  bool modifyInfo(Data data);

  bool delDataInfo(int id);

  List<Data> getAllDataListInfo();
}

abstract interface class Data{
}