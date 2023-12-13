import 'dart:async';

Future<String> timeoutFuture() async {
  await Future.delayed(Duration(seconds: 6));
  return 'ok';
}

Future<void> main() async {
  try {
    final String result = await timeoutFuture().timeout(const Duration(seconds: 5));
  } on TimeoutException catch (e) {
    print(e.toString());
  }
}
