import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;

Future<void> main(List<String> args) async {
  final dir = File(p.join('lib', 'generated', 'r.g.dart'));

  if (dir.existsSync()) dir.deleteSync();

  var result = "import 'package:flutter/painting.dart'; \n\n\n";

  result += "class Resources {";

  result += "\n   static final RImage images = RImage();";
  result += "\n   static final RColor colors = RColor();";

  result += " \n }\n";

  result += "class RImage { \n";

  //Images generator

  var directory = Directory("assets/images");

  directory.listSync(recursive: false).toList().forEach((it) {
    var name = it.path.replaceAll("\\", "/").split("/").last.split(".").first;
    var path = it.path.replaceAll(" ", "_").replaceAll("\\", "/");
    result += " final String $name = \"$path\";\n";
  });

  result += " \n} \n \n";

  //Colors generator

  await new File('assets/colors.json').readAsString().then((String jsonColors) {
    result += "class RColor { \n";

    final colorsMap = json.decode(jsonColors) as Map;

    colorsMap.keys.forEach((key) {
      result += "final Color $key = Color(";
      result += fromHex(colorsMap[key]).toString();
      result += ");\n";
    });
    result += " \n} \n  \n";
  });

  var output = Directory(p.join('lib', 'generated', 'r.g.dart'));

  var generatedFile = File(output.path);
  generatedFile.writeAsStringSync(result);
}

int fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return (int.parse(buffer.toString(), radix: 16));
}
