//
//  NewTimerViewTest.swift
//  ProjectOOP_V2
//
//  Created by Hannarong Kaewkiriya on 4/12/2565 BE.
//

import SwiftUI

struct NewTimerViewTest: View {
    @EnvironmentObject var pomodoroModel: PomodoroModel
    var body: some View {
            VStack(spacing: 15){
                Text("Add New Timer")
                    .font(.title2.bold())
                    .foregroundColor(.white)
                    .padding(.top,10)
                
                HStack(spacing: 15){
                    Text("\(pomodoroModel.hour) hr")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white.opacity(0.3))
                        .padding(.horizontal,20)
                        .padding(.vertical,12)
                    background{
                        Capsule()
                            .fill(.white.opacity(0.07))
                    }
                }
                .padding(.top,20)

                Button {

                } label: {
                    Text("Save")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .padding(.horizontal, 100)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background{
                RoundedRectangle(cornerRadius: 10,style: .continuous)
                    .fill(Color("dark"))
                    .ignoresSafeArea()
            }
    }
}

struct NewTimerViewTest_Previews: PreviewProvider {
    static var previews: some View {
        NewTimerViewTest()
    }
}
