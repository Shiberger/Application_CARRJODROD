//
//  ContentView.swift
//  ProjectOOP_V2
//
//  Created by Hannarong Kaewkiriya on 15/11/2565 BE.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct ContentView: View {
    @AppStorage("log_status") var logStatus: Bool = false
    // MARK: Hiding Native One
//    init(){
//        UITabBar.appearance().isHidden = true
//    }
//    @State var currentTab: Tab = .bookmark
    
    var body: some View {
        if logStatus{
            HomeView()
        }else{
            AnimatedLoginPage()
        }
        
//        VStack(spacing: 0){
//            TabView(selection: $currentTab){
//                // MARK: Need to Apply BG For Each Tab View
//                Text("Bookmark")
//                    .applyBG()
//                    .tag(Tab.bookmark)
//                Text("Time")
//                    .applyBG()
//                    .tag(Tab.time)
//                Text("Camera")
//                    .applyBG()
//                    .tag(Tab.camera)
//                Text("Chat")
//                    .applyBG()
//                    .tag(Tab.chat)
//                Text("Settings")
//                    .applyBG()
//                    .tag(Tab.settings)
//            }
//            // MARK: Custom Tab Bar
//            CustomTabBar(currentTab: $currentTab)
//        }
    }
    
    @ViewBuilder
    func Home() -> some View{
        NavigationView{
            NavigationLink(destination: HomeView()) {
                Text("Logged In")
                    .navigationTitle("CARRJODROD")
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
//        NavigationView {
//            VStack {
//                //Divider()
//                Spacer()
//
////                Image("logo_carrjodrod")
////                    .NavigationLink(destination: LoginPageUI())
////                    .resizable()
////                    .scaledToFit()
//
//                NavigationLink(destination: AnimatedLoginPage()) {
//                    Image("logo_carrjodrod")
//                        .resizable()
//                        .scaledToFit()
//                }
//
//                Divider()
//                Spacer()
//            }
//            .background(Color("dark"))
//        }
//    }
}
        

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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
