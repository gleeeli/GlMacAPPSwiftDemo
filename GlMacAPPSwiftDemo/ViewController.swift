//
//  ViewController.swift
//  GlMacAPPSwiftDemo
//
//  Created by gleeeli on 2020/3/22.
//  Copyright © 2020 gleeeli. All rights reserved.
//

import Cocoa
import SnapKit
import Alamofire

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //自动布局
        let testView = NSView(frame: NSRect(x: 10, y: 20, width: 50, height: 50));
        testView.wantsLayer = true;
        testView.layer?.backgroundColor = NSColor.red.cgColor
        self.view.addSubview(testView);
        
        testView.snp.makeConstraints { (make) -> Void in
           make.width.height.equalTo(50)
           make.center.equalTo(self.view)
        }
        
        //网络请求
//        AF.request("https://httpbin.org/get", method: .get).responseString { response in
//            debugPrint(response)
//        }
//
        AF.request("https://www.baidu.com/").responseString { response in
            debugPrint(response)
        }
        
        let parameters: [String: [String]] = [
            "foo": ["bar"],
            "baz": ["a", "b"],
            "qux": ["x", "y", "z"]
        ]
        AF.request("https://httpbin.org/post", method: .post, parameters: parameters, encoder: URLEncodedFormParameterEncoder.default).responseString { response in
            debugPrint(response)
        }
        
        
        
        testDict()
    }
    
    func testDict()  {
        let jsonString = "{\"doubleOptional\":1.1,\"stringImplicitlyUnwrapped\":\"hello\",\"int\":1}"
        if let object = BasicTypes.deserialize(from: jsonString) {
            // …
            print("当前对象一个属性：\(object.stringImplicitlyUnwrapped ?? "123")")
//            object.toJSONString()
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

