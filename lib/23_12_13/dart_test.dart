void main() {
  print(solution([1, 2, 3, 4, 5], 1, 3));
  // print(solution([1, 3, 5], 1, 2));
}

List<int> solution(List<int> numbers, num1, num2) {
  // 1안 for문으로 배열 자르기
  final List<int> intList = [];
  for (int i = num1; i < num1 + num2; i++) {
    intList.add(numbers[i]);
  }
  return intList;

  // 2안 sublist 로 배열 자르기(보기는 쉽게)
  // int numSum = num1 + num2;
  // int numberLength = numbers.length;
  // return numbers.sublist(num1, numSum > numberLength ? numberLength : numSum);

  // 3안 그냥 한줄 코드
  // return numbers.sublist(num1, (num1 + num2) > numbers.length ? numbers.length : num1 + num2);
}


// 잘못 써놔서 다시 적었어요. list가 [0,1,2,3,4,5,6]일때..................list.sublist(0, 4) 는 (for i=0; i<4; i++) 형태의 리스트라고 보시면 돼요.  ==> 결국 [0, 1, 2, 3] 이 리턴돼죠. 그리고 list.sublist(1, 4) 이면 (for i=1; i<4;i++) ==> 결국 [1, 2, 3]