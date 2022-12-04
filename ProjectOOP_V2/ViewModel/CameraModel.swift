//
//  CameraModel.swift
//  ProjectOOP_V2
//
//  Created by Hannarong Kaewkiriya on 4/12/2565 BE.
//

import SwiftUI
import AVFoundation

class CameraModel: ObservableObject{
    
    @Published var isTaken = false
    @Published var session = AVCaptureSession()
    @Published var alert = false
    
    // since were going to read pic data
    @Published var output = AVCapturePhotoOutput()
    @Published var preview : AVCaptureVideoPreviewLayer!
    
    func check(){
        
        // MARK: Get Camera Permission
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            setUp()
            return
            // Setting Up Session
        case .notDetermined:
            // Retusting for permission
            AVCaptureDevice.requestAccess(for: .video) { (status) in
                
                if status{
                    self.setUp()
                }
            }
        case .denied:
            self.alert.toggle()
            return
            
        default:
            return
        }
    }
    
    func setUp(){
        
        // MARK: Setting Up Camera
        
        do{
            // setting configs
            self.session.beginConfiguration()
            let cameraDevice = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back)
//            let cameraInput = try AVCaptureDeviceInput(device: cameraDevice!)
            
            // checking and adding to session
            
//            if self.session.canAddInput(cameraInput){
//                self.session.addInput(cameraInput)
//            }
            
            if self.session.canAddOutput(self.output){
                self.session.addOutput(self.output)
            }
            
            self.session.commitConfiguration()
            
        }
        catch{
            print(error.localizedDescription)
        }
        
    }
}

// MARK: Setting View for Preview
struct CameraPreview: UIViewRepresentable {
    
    @ObservedObject var camera : CameraModel
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        
        // Video or picture
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(camera.preview)
        
        // starting session
        camera.session.startRunning()
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}


