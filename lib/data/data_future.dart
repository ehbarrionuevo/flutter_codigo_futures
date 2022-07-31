
class DataFuture{

  List<Map<String, dynamic>> _dataList = [
    {
      "fullName": "Fiorella Gonzales",
      "address": "Av. Lima 23",
    },
    {
      "fullName": "José Tapia",
      "address": "Cll. Gonzales Prada 4534",
    },
  ];

  Future<List<Map<String, dynamic>>> getDataList() async{
    return Future.delayed(Duration(seconds: 2), (){
      return _dataList;
    });
  }

  // get infoList => _dataList;


}