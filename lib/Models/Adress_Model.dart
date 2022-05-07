class AdressModel {
  late int _id;
  late String _AddressType;
  late String? _ContactPesronName;
  late String? _ContactPesronNo;
  late String? _Adress;
  late String? _Lattitude;
  late String? _longitude;

  AdressModel(
      {id,
      required AddressType,
      ContactPesronName,
      ContactPesronNo,
      Adress,
      Lattitude,
      longitude})
  {
    _AddressType=AddressType;
    _id =id;
    _Adress=Adress;
    _ContactPesronName=ContactPesronName;
    _ContactPesronNo=ContactPesronNo;
    _Lattitude=Lattitude;
    _longitude=longitude;
  }
  String get AddressType=> _AddressType;
  String? get Adress=> _Adress;
  String? get ContactPesronName=>_ContactPesronName;
  String? get ContactPesronNo=>_ContactPesronNo;
  String? get latitude=>_Lattitude;
  String? get longitude=>_longitude;



  AdressModel.fromJson(Map<String,dynamic>json){
    _id=json['id'];
    _ContactPesronNo=json['Contact_person_No']??"";    //Could not be null if it  is put empty string
    _ContactPesronName=json['Contact_person_Name']??'';
    _AddressType=json['Adress_type']??"";
    _Adress=json['Adress'];
    _longitude=json['Longitute'];
    _Lattitude=json['Lattitude'];

  }

}
