//
//  SettingView.swift
//  ProjectOOP_V2
//
//  Created by Hannarong Kaewkiriya on 3/12/2565 BE.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct SettingView: View {
    @AppStorage("log_status") var logStatus: Bool = false
    // MARK: Hiding Native One
    init(){
        UITabBar.appearance().isHidden = true
    }
    @State var currentTab: Tab = .home
    
    var body: some View {
        
        if logStatus{
            Home()
        }else{
            AnimatedLoginPage()
        }
        
    }
    
    @ViewBuilder
    func Home() -> some View{
        NavigationStack{
            Text("Settings Application")
                .navigationTitle("Settings")
                .toolbar {
                    Button("Logout"){
                        try? Auth.auth().signOut()
                        GIDSignIn.sharedInstance.signOut()
                        withAnimation(.easeInOut){
                            logStatus = false
                        }
                    }
                }
            
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

//extension View{
//    func applyBG()->some View{
//        self
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background{
//                Color("BG")
//                    .ignoresSafeArea()
//            }
//    }
//}
