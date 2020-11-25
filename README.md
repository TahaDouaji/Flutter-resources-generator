# Flutter Resource Generator

Resource generator is a dart code file to generate static references to images & colors, to make dealing with assets files much easier since in this way we can have autocomplete feature also.

## Getting Started
1. Create a directory named "bin" beside "lib" folder
2. Create a directory named "generated" inside "lib" folder
3. Copy file "assets_generator.dart" to the "bin" directory
4. Create an "assets" folder and add to it "images" folder and "colors.json" file.
5. Now in terminal use this command
```
flutter pub run <your project name>:assets_generator
 #e.g. flutter pub run flutter_app:assets_generator
```
Then you will find "generated" directory inside lib folder and into it dart file called "r.g.dart"

## How to use it

```
import 'package:flutter_app/generated/r.g.dart';

Container(
	color: Resources.colors.white,
	child: SvgPicture.asset(
              Resources.images.ic_logo,
            )
)
```

