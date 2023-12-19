abstract interface class Management{
  Data searchInfo(int id);

  bool addInfo(Data data);

  bool modifyInfo(Data data, int id);

  bool delDataInfo(int id);

  List<Data> getAllDataListInfo();

}

abstract interface class Data{
}