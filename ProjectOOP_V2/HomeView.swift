//
//  Home.swift
//  ProjectOOP_V2
//
//  Created by Hannarong Kaewkiriya on 21/11/2565 BE.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct HomeView: View {
    @AppStorage("log_status") var logStatus: Bool = false
    // MARK: Hiding Native One
    init(){
        UITabBar.appearance().isHidden = true
    }
    @State var currentTab: Tab = .home
    
    var body: some View {
        
//        if logStatus{
//            Home()
//        }else{
//            AnimatedLoginPage()
//        }
        
        VStack(spacing: 0){
            TabView(selection: $currentTab){
                // MARK: Need to Apply BG For Each Tab View
                Text("Home")
                    .applyBG()
                    .tag(Tab.home)
                HomeTimer()
                    .applyBG()
                    .tag(Tab.time)
                CustomCamera()
                    .applyBG()
                    .tag(Tab.camera)
                SearchView()
                    .applyBG()
                    .tag(Tab.map)
                SettingView()
                    .applyBG()
                    .tag(Tab.settings)
            }
            // MARK: Custom Tab Bar
            CustomTabBar(currentTab: $currentTab)
        }
    }
    
//    @ViewBuilder
//    func Home() -> some View{
//        NavigationStack{
//            Text("Logged In")
//                .navigationTitle("CARRJODROD")
//                .toolbar {
//                    Button("Logout"){
//                        try? Auth.auth().signOut()
//                        GIDSignIn.sharedInstance.signOut()
//                        withAnimation(.easeInOut){
//                            logStatus = false
//                        }
//                    }
//                }
//
//        }
//    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension View{
    func applyBG()->some View{
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background{
                Color("black")
                    .ignoresSafeArea()
            }
    }
}
