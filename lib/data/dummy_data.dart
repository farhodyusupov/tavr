class DummyData {
  final int id;
  final String sex;
  final int age;

  const DummyData({
    required this.id,
    required this.age,
    required this.sex
  });
}




List<DummyData> dummyList = const [
  DummyData(id: 1,sex: "Male",age: 25),
  DummyData(id: 2,sex: "Female",age: 26),
  DummyData(id: 3,sex: "Male",age: 23),
  DummyData(id: 4,sex: "Male",age: 27),
  DummyData(id: 5,sex: "Female",age: 45),
  DummyData(id: 6,sex: "Female",age: 35),
  DummyData(id: 7,sex: "Female",age: 27),
  DummyData(id: 8,sex: "Male",age: 22),
  DummyData(id: 9,sex: "Female",age: 33),
  DummyData(id: 10,sex: "Male",age: 42),
];