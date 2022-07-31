
class DataFuture{

  List<Map<String, dynamic>> _dataList = [
    {
      "fullName": "Fiorella Gonzales",
      "address": "Av. Lima 23",
    },
  ];

  Future<List<Map<String, dynamic>>> getDataList() async{
    return Future.delayed(Duration(seconds: 5), (){
      return _dataList;
    });
  }

  // get infoList => _dataList;


}