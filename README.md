# Flutter Resource Generator

Resource generator is a dart code file to generate static references to images & colors, to make dealing with assets files much easier since in this way we can have autocomplete feature also.

## Getting Started
1. Clone this repository
2. Create a directory named "bin" beside "lib" folder
3. Create a directory named "generated" inside "lib" folder
3. Copy file "assets_generator.dart" to the "bin" directory
5. Create an "assets" directory and add to it "images" directory and "colors.json" file.
6. Now in terminal use this command
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
### Color Json file example

```
{
  "white": "#FFFFFF",
  "black": "#000000",
  "textBlack": "#3E3C41",
  "green": "#11B719",
  "silver": "#c8ccd5"
}
```

