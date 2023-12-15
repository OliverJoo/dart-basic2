import 'dart:convert';
import 'dart:io';
import '../dto/MaskDto.dart';
import 'package:http/http.dart' as http;

class MaskApi {
  Future<MaskDto> getMaskInfoResult() async {
    final response =
        await http.get(Uri.parse('http://104.198.248.76:3000/mask'));

    if (response.statusCode == HttpStatus.ok) {
      return MaskDto.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      throw FileSystemException('Not Found!');
    }
  }
}
