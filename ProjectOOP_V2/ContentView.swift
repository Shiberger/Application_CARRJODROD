//
//  ContentView.swift
//  ProjectOOP_V2
//
//  Created by Hannarong Kaewkiriya on 15/11/2565 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                //Divider()
                Spacer()
                        
//                Image("logo_carrjodrod")
//                    .NavigationLink(destination: LoginPageUI())
//                    .resizable()
//                    .scaledToFit()
                
                NavigationLink(destination: AnimatedLoginPage()) {
                    Image("logo_carrjodrod")
                        .resizable()
                        .scaledToFit()
                }
                
                Divider()
                Spacer()
            }
            .background(Color("dark"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
