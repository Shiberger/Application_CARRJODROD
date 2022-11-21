//
//  AnimatedLoginPage.swift
//  ProjectOOP_V2
//
//  Created by Hannarong Kaewkiriya on 15/11/2565 BE.
//

import SwiftUI
import Lottie
import AuthenticationServices
import GoogleSignIn
import GoogleSignInSwift
import Firebase

// MARK: Intergrating Apple Sign in
import AuthenticationServices

struct AnimatedLoginPage: View {
    
    var body: some View {
        
        LoginPageUI()
        
    }
}

struct AnimatedLoginPage_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedLoginPage()
    }
}

struct LoginPageUI : View {
    
    @StateObject var loginModel: LoginViewModel = .init()
    
    @State var show = false
    
    // Login Details
    
    @State var phNo = ""
    @State var otpcode = ""
    
    var body: some View{
        
        VStack{
            
            ZStack {
                Color("dark")
                    .ignoresSafeArea()
            
                VStack {
                    
                    AnimatedView(show: $show)
                    // Default Frame
                        .frame(height: UIScreen.main.bounds.height / 2)
                    
                    VStack {
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 10, content: {
                                Text("Login")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                
                                Text("Enter your phone number to continue")
                                    .foregroundColor(.gray)
                            })
                            
                            Spacer(minLength: 15)
                        }
                        
                        VStack {
                            HStack(spacing: 15){
                                
                                Text("Number")
                                    .foregroundColor(.gray)
                                
                                Rectangle()
                                    .fill(Color("dark"))
                                    .frame(width: 1, height: 18)
                                
                                TextField("", text: $loginModel.mobileNo)
                                    .disabled(loginModel.showOTPField)
                                    .opacity(loginModel.showOTPField ? 0.4 : 1)
                                    .overlay(alignment: .trailing, content: {
                                        Button("Change"){
                                            withAnimation(.easeInOut){
                                                loginModel.showOTPField = false
                                                loginModel.otpCode = ""
                                                loginModel.CLIENT_CODE = ""
                                            }
                                        }
                                        .font(.caption)
                                        .foregroundColor(.indigo)
                                        .opacity(loginModel.showOTPField ? 1 : 0)
                                        .padding(.trailing, 15)
                                    })
                            }
                            
                            Divider()
                                .background(Color("dark"))
                        }
                        
                        VStack {
                            HStack(spacing: 15){
                                
                                Text("OTP Code")
                                    .foregroundColor(.gray)
                                
                                Rectangle()
                                    .fill(Color("dark"))
                                    .frame(width: 1, height: 18)
                                
                                TextField("", text: $loginModel.otpCode)
                                    .disabled(!loginModel.showOTPField)
                                    .opacity(!loginModel.showOTPField ? 0.4 : 1)
                            }
                            
                            Divider()
                                .background(Color("dark"))
                        }
                        
                        .padding(.vertical)
                        
                        Button(action: loginModel.showOTPField ? loginModel.verifyOTPCode : loginModel.getOTPCode) {
                            Text(loginModel.showOTPField ? "Verify Code" : "Get Code")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical,10)
                                .frame(width: UIScreen.main.bounds.width - 60)
                                .background(Color("dark"))
                                .clipShape(Capsule())
                            
                        }.alert(loginModel.errorMessage, isPresented: $loginModel.showError) {
                            
                        }
                        
                        HStack {
                            
                            Rectangle()
                                .fill(Color.black.opacity(0.3))
                                .frame(height: 1)
                            
                            Text("OR")
                                .fontWeight(.bold)
                                .foregroundColor(Color.black.opacity(0.3))
                            
                            Rectangle()
                                .fill(Color.black.opacity(0.3))
                                .frame(height: 1)
                        }
                        
                        HStack(spacing: 20){
                            
                            // Login Apple Button
                            
                            SignInWithAppleButton { (request) in
                                
                                request.requestedScopes = [.email,.fullName]
                                
                            } onCompletion: { (result) in
                                
                                // getting error or success
                                
                                switch result {
                                case .success(let user):
                                    print("Success") //add new screen
                                    guard let credential = user.credential as?
                                            ASAuthorizationAppleIDCredential else{
                                        print("error with firebase")
                                        return
                                    }
                                    loginModel.appleAuthenticate(credential: credential)
                                case.failure(let error):
                                    print(error.localizedDescription)
                                }
                            }
                            .signInWithAppleButtonStyle(.black)
                            .frame(width: (UIScreen.main.bounds.width - 80) / 2)
                            .frame(height: 45)
                            .clipShape(Capsule())
                            .padding(.vertical, 10)
                            
//                            Button(action: {}, label: {
//
//                                HStack(spacing: 10) {
//
//                                    Image("apple-logo")
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fit)
//                                        .frame(width: 25, height: 25)
//
//                                    Text("Apple")
//                                        .fontWeight(.bold)
//                                        .foregroundColor(.white)
//                                }
//                                    .padding(.vertical,10)
//                                    .frame(width: (UIScreen.main.bounds.width - 80) / 2)
//                                    .background(Color("apple"))
//                                    .clipShape(Capsule())
//                            })
                            
                            
                            
                            // MARK: Native Google Sign in button
                            if let clientID = FirebaseApp.app()?.options.clientID{
                                GoogleSignInButton{
                                    GIDSignIn.sharedInstance.signIn(with:.init(clientID: clientID), presenting: UIApplication.shared.rootController()){user,error in
                                        if let error = error{
                                            print(error.localizedDescription)
                                            return
                                        }
                                        
                                        // MARK: Logging Google User into Firebase
                                        if let user{
                                            loginModel.logGoogleUser(user: user)
                                        }
                                    }
                                }
                                .signInWithAppleButtonStyle(.black)
                                .frame(width: (UIScreen.main.bounds.width - 80) / 2)
                                .frame(height: 45)
                                .clipShape(Capsule())
                                .padding(.vertical, 10)
                            }
                            
//                            Button(action: {}, label: {
//
//                                HStack(spacing: 10) {
//
//                                    Image("google-logo")
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fit)
//                                        .frame(width: 25, height: 25)
//
//                                    Text("Google")
//                                        .fontWeight(.bold)
//                                        .foregroundColor(.white)
//                                }
//                                    .padding(.vertical,10)
//                                    .frame(width: (UIScreen.main.bounds.width - 80) / 2)
//                                    .background(Color("google"))
//                                    .clipShape(Capsule())
//                            })
                            
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding()
                    
                    // Bottom to up transition
                    // archeive this frame property
                    .frame(height: show ? nil : 0)
                    .opacity(show ? 1 : 0)
                   
                    // hide back navigation button
                    .navigationBarBackButtonHidden(true)
                }
            }
        }
        .alert(loginModel.errorMessage, isPresented: $loginModel.showError) {
        }
    }
}

// Animated View

struct AnimatedView: UIViewRepresentable {
    
    @Binding var show: Bool
    
    func makeUIView(context: Context) -> AnimationView {
        
        let view = AnimationView(name: "CARCITY_ORANGE", bundle: Bundle.main)
        
        // on Complete
        view.play() { (status) in
            
            if status {
                
                // toggling view
                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)){
                    show.toggle()
        
                }
            }
        }
        
        return view
        
    }
    
    func updateUIView(_ uiView: AnimationView, context: Context) {
        
    }
}
