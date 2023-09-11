# Swift-Vision-OCR
OCR using Vision in UI and Command for Apple platforms.

## Description
This is an OCR for image for all Apple platforms, like iPad, iPhone, Mac and Apple TV. **Not only in app, but also in commandline**. Because it uses Vision, so it just support iOS 11, iPad OS 11, macOS 10.13, tvOS 11 and newer versions.

## Usage
If you want to see OCR in App, please open `OCR-SwiftUI` and click `OCR-SwiftUI.xcodeproj`. Maybe you need modify the `Team` in `Signing & Capabilities` to fix the error of building. 

![ocr display](/images/77b10be2b1e3cc35b4d7b08849c233c0.jpeg)


If you want to use OCR in Termial, please compile the `ocr.swift` using:

```
$ swiftc -o ocr ocr.swift
```

And you can use `./ocr` to recognize text from images. I prepare some images in `testImage` for you to try, so you can see:

```
$ ./ocr testImage/info.png 
通用：
种类：宗卷
创建时间：1970年1月1日星期四 08:00
修改时间：1980年1月1日星期二 00:00
格式：EXFAT
容量：511.88 GB
可用：300.78GB
已使用：211,106,529,280字节 （磁盘上的
211.11 GB)
```

## More
There are some articles maybe you want to read:
[SwiftUI和Swift命令行中如何使用Vision来识别获取图片（image）中的文字（OCR），以及一系列注意事项](https://blog.csdn.net/qq_33919450/article/details/132819164): This is a blog to discribe the details of this project.

[Codes for the Representation of Names of Languages](https://www.loc.gov/standards/iso639-2/php/English_list.php): This is table of ISO Language Code, maybe you need to know for change codes.

