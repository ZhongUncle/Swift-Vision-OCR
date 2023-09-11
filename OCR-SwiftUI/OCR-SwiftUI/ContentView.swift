//
//  ContentView.swift
//  swifttest
//
//  Created by ZhongUncle on 2023/9/11.
//

import SwiftUI
import Vision

struct ContentView: View {
    //这个字符串数组是为了存放获取的文本
    @State var textStrings = [String]()
    @State var name = "info"
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage(named: name)!)
            //这个循环是显示获取的文本
            ForEach(textStrings, id: \.self) { testString in
                Text(testString)
            }
        }
        .padding()
        //这样一打开App就自动识别了
        .onAppear(perform: {
            //生成执行需求的CGImage，也就是对这个图片进行OCR文本识别
            guard let cgImage = UIImage(named: name)?.cgImage else { return }

            //创建一个新的图像请求处理器
            let requestHandler = VNImageRequestHandler(cgImage: cgImage)

            //创建一个新的识别文本请求
            let request = VNRecognizeTextRequest(completionHandler: handleDetectedText)
            //使用accurate模式识别，不推荐使用fast模式，因为这是采用传统OCR的，精度太差了
            request.recognitionLevel = .accurate
            //设置偏向语言，其他语言一般不用，只有中文需要这个，如果不加这个那么识别会出错。跟中文一起能识别的其他文字只有英文
            //繁体中文为zh-Hant，其他语言码请见https://www.loc.gov/standards/iso639-2/php/English_list.php
            request.recognitionLanguages = ["zh_Hans"]

            do {
                //执行文本识别的请求
                try requestHandler.perform([request])
            } catch {
                print("Unable to perform the requests: \(error).")
            }
        })
    }
    //这个函数用来处理获取的文本
    func handleDetectedText(request: VNRequest?, error: Error?) {
        if let error = error {
            print("ERROR: \(error)")
            return
        }
        //results就是获取的结果
        guard let results = request?.results, results.count > 0 else {
            print("No text found")
            return
        }
        
        //通过循环将results的结果放到textStrings数组中
        //你可以在这里进行一些处理，比如说创建一个数据结构来获取获取文本区域的位置和大小，或者一些其他的功能。！！！通过observation的属性就可以获取这些信息！！！
        for result in results {
            if let observation = result as? VNRecognizedTextObservation {
                //topCandidates(1)表示在候选结果里选择第一个，最多有十个，你也可以在这里进行一些处理
                for text in observation.topCandidates(1) {
                    //将results的结果放到textStrings数组中
                    let string = text.string
                    textStrings.append(string)
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
