//
//  MyFlutterViewController.swift
//  iOS_demo
//
//  Created by 华惠友 on 2023/12/14.
//

import UIKit
import Flutter

class MyFlutterViewController: FlutterViewController {

    var channel:FlutterBasicMessageChannel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 基本数据传输
        channel = FlutterBasicMessageChannel(name: "com.flutter.test.BasicMessageChannel", binaryMessenger: binaryMessenger)
              channel.setMessageHandler { (message, reply) in
                if let dict = message as? Dictionary<String, Any> {
                  let name:String = dict["name"] as? String ?? ""
                  let age:Int = dict["age"] as? Int ?? 0
                  reply(["name":"hello,\(name)","age":age-1])
                }
              }
        
        // 事件流数据传输
        let eventChannelManager = EventChannelManager(messager: binaryMessenger)
        eventChannelManager.config()
        
        // 方法调用
        let channel = FlutterMethodChannel(name: "plugin_apple", binaryMessenger: binaryMessenger)
        channel.setMethodCallHandler {
            (call: FlutterMethodCall, result: @escaping FlutterResult) in
            if (call.method == "apple_one") {
                result(["result": "success", "code": 200] as [String : Any])
            }
            if (call.method == "apple_two") {
                result(["result": "success", "code": 404] as [String : Any])
            }
        }
    }
}


class EventChannelManager: NSObject {
  var channel: FlutterEventChannel
  var eventSink: FlutterEventSink?
  var count = 0
  var timer: Timer?
  init(messager: FlutterBinaryMessenger) {
    channel = FlutterEventChannel(name: "test_event_channel", binaryMessenger: messager)
  }
  func config() {
    channel.setStreamHandler(self)
  }
  func startTimer() {
   timer = Timer(timeInterval: TimeInterval(1), target: self, selector: #selector(triggerEventChannel), userInfo: nil, repeats: true)
    RunLoop.current.add(timer!, forMode: .common)
  }
  @objc func triggerEventChannel() {
    count += 1
    eventSink?("当时数值为：\(count)")
  }
}
extension EventChannelManager : FlutterStreamHandler {
  func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
    self.eventSink = events
    startTimer()
    return nil
  }
  func onCancel(withArguments arguments: Any?) -> FlutterError? {
    return nil
  }
}
