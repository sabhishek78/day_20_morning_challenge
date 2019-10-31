import 'main.dart';

import 'package:test/test.dart';

void main() {


  test('josephus', (){

    expect(josephus(10, 3),4);

  });
  test('groupSeats', (){

    expect(groupSeats([
      [1, 0, 0, 1, 0, 1, 1],
      [0, 1, 0, 1, 0, 1, 0],
      [0, 1, 1, 1, 1, 1, 1],
      [1, 0, 1, 1, 0, 0, 1],
      [1, 1, 1, 0, 1, 0, 1],
      [0, 1, 1, 1, 1, 1, 0],
    ], 2),2);

  });


  
}