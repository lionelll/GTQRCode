//
//  QRCode.swift
//  GTQRCode
//
//  Created by 谷田丰 on 15/6/1.
//  Copyright (c) 2015年 lchbl. All rights reserved.
//

import UIKit
import AVFoundation

// 1. 将类设置为公共类，外部才能访问到
public class QRCode: NSObject {
   
    // 开始扫描
    public func scan() {
        // 1. 判断会话能否添加输入设备
        if !session.canAddInput(videoInput) {
            println("无法添加输入设备")
            return
        }
        
        // 2. 判断能否添加输出设备
        if !session.canAddOutput(dataOutput) {
            println("无法添加输出设备")
            return
        }
        
        // 3. 添加设备
        session.addInput(videoInput)
        
        // 输出数据支持的格式，才能够获得 － 输出数据支持的格式
        println("前 － \(dataOutput.availableMetadataObjectTypes)")
        session.addOutput(dataOutput)
        println("后 － \(dataOutput.availableMetadataObjectTypes)")
        
        // 4. 设置输出识别的格式 & 代理
//        dataOutput.metadataObjectTypes = dataOutput.availableMetadataObjectTypes
//        dataOutput.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        
        
        // 5. 启动会话
        session.startRunning()
        
        // 6. 添加预览图层
        //view.layer.addSublayer(previewLayer)
//        view.layer.insertSublayer(drawLayer, atIndex: 0)
//        view.layer.insertSublayer(previewLayer, atIndex: 0)
    }

    
    
    // MARK: - 二维码扫描
    // 1. 拍摄会话 － 扫描桥梁
    lazy var session: AVCaptureSession = {
        return AVCaptureSession()
        }()
    
    // 2. 输入设备 － 摄像头
    lazy var videoInput: AVCaptureDeviceInput? = {
        // 拿到摄像头设备
        let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        if device == nil {
            return nil
        }
        
        return AVCaptureDeviceInput(device: device, error: nil)
        }()
    
    // 3. 输出数据
    lazy var dataOutput: AVCaptureMetadataOutput = {
        return AVCaptureMetadataOutput()
        }()
    
    // 4. 预览视图
    lazy var previewLayer: AVCaptureVideoPreviewLayer = {
        // 必须指定一个 session
        let layer = AVCaptureVideoPreviewLayer(session: self.session)
     //   layer.frame = self.view.bounds
        return layer
        }()
    
    // 5. 绘图涂层
    lazy var drawLayer: CALayer = {
        let layer = CALayer()
   //     layer.frame = self.view.bounds
        return layer
        }()

}
