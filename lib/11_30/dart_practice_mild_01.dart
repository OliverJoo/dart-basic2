void main() {
  int a = 43;
  int b = 30;

  // 더 큰수 판별하기
  print(a > b ? a : a==b ? 'eq' : b);

  // 짝수 홀수
  if((a.isEven && b.isOdd) || (a.isOdd && b.isEven)){
    print('Yes');
  } else{
    print('No');
  }
}
