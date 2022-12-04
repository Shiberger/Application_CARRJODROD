//
//  CustomCamera.swift
//  ProjectOOP_V2
//
//  Created by Hannarong Kaewkiriya on 4/12/2565 BE.
//

import SwiftUI
import AVFoundation

struct CustomCamera: View {
    var body: some View {
        CameraView()
    }
}

struct CustomCamera_Previews: PreviewProvider {
    static var previews: some View {
        CustomCamera()
    }
}

//struct CameraView: View {
//
//    @StateObject var camera = CameraModel()
//    var body: some View{
//        ZStack{
//
//            // MARK: Going Camera Preview
//            CameraPreview(camera: camera)
//                .ignoresSafeArea(.all, edges: .all)
//
//            VStack{
//
//                if camera.isTaken{
//
//                    HStack{
//
//                        Spacer()
//
//                        Button(action: {}, label: {
//                            Image(systemName: "arrow.triangle.2.circlepath.camera")
//                                .foregroundColor(.black)
//                                .padding()
//                                .background(Color.white)
//                                .clipShape(Circle())
//                        })
//                        .padding(.trailing,10)
//                    }
//                }
//
//                Spacer()
//
//                HStack{
//
//                    // MARK: Taken Showing Save and again take button
//
//                    if camera.isTaken{
//
//                        Button(action: {}, label: {
//                            Text("Save")
//                                .foregroundColor(.black)
//                                .fontWeight(.semibold)
//                                .padding(.vertical,10)
//                                .padding(.horizontal,20)
//                                .background(Color.white)
//                                .clipShape(Capsule())
//                        })
//                        .padding(.leading)
//
//                        Spacer()
//                    }
//                    else{
//
//                        Button(action: {camera.isTaken.toggle()}, label: {
//
//                            ZStack{
//
//                                Circle()
//                                    .fill(Color.white)
//                                    .frame(width: 65, height: 65)
//
//                                Circle()
//                                    .stroke(Color.white,lineWidth: 2)
//                                    .frame(width: 75, height: 75)
//
//                            }
//                        })
//                    }
//                }
//            }
//        }
//        .onAppear(perform: {
//
//            camera.check()
//        })
//    }
//}
//
