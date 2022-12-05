//
//  ExpenseView.swift
//  ProjectOOP_V2
//
//  Created by Hannarong Kaewkiriya on 5/12/2565 BE.
//

import SwiftUI

struct ExpenseView: View {
    @State var progress: CGFloat = 0.5
    // MARK: Current Month
    @State var currentMonth: String = "Jan"
    @Namespace var animation
    var body: some View {
        VStack(spacing: 15){
            
            HStack{
                
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .frame(width: 40, height: 40)
                        .background{
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(.gray.opacity(0.4),lineWidth: 1)
                        }
                }
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.title3)
                        .rotationEffect(.init(degrees: -90))
                }
            }
            .foregroundColor(.white)
            .padding(.horizontal)
            
            // MARK: Customn Gradient Card
            VStack{
                Text("Saved Car Park This Month")
                    .fontWeight(.semibold)
                    .foregroundColor(.white.opacity(0.7))
                
                AnimatedNumberText(value: progress * 1299, font: .system(size: 35, weight: .black),isCurrency: true)
                    .foregroundColor(Color("Yellow"))
                    .padding(.top,5)
                    .lineLimit(1)
                
                // MARK: SpeedMeter
                SpeedMeter(progress: $progress)
            }
            .padding(.top,50)
            .frame(maxWidth: .infinity)
            .frame(height: 340)
            // MARK: Custom Background
            .background{
                RoundedRectangle(cornerRadius: 45, style: .continuous)
                    .fill(
                    
                        .linearGradient(colors: [
                        
                            Color("Yellow")
                                .opacity(0.4),
                            Color("Yellow")
                                .opacity(0.2),
                            Color("Yellow")
                                .opacity(0.1),
                        ] + Array(repeating: Color.clear, count: 5), startPoint: .topTrailing, endPoint: .bottomLeading)
                    )
            }
            .padding(.top,15)
            .padding(.horizontal,15)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15){
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8){
                            // MARK: Scroller Month
                            ForEach(months,id: \.self){month in
                                Text(month)
                                    .font(.callout)
                                    .foregroundColor(.gray)
                                    .padding(.vertical,8)
                                    .padding(.horizontal,15)
                                    .background{
                                        if currentMonth == month{
                                            Capsule()
                                                .matchedGeometryEffect(id: "MONTH", in: animation)
                                        }
                                    }
                                    .onTapGesture {
                                        withAnimation(.interactiveSpring(response: 0.7,dampingFraction: 0.8, blendDuration: 0)){
                                            currentMonth = month
                                            progress = progressArray[getIndex(month: month)]
                                        }
                                    }
                            }
                        }
                    }
                    
                    BottomContent()
                        .padding(.top)
                }
                .padding()
            }
            .padding(.top,30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.top,15)
        .background{
            Color("dark")
                .ignoresSafeArea()
        }
    }
    
    // MARK: Bottom Content
    @ViewBuilder
    func BottomContent()->some View{
        VStack(spacing: 15){
            ForEach(expenses){expense in
                HStack(spacing: 12){
                    
                    Image(expense.icon)
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                        .foregroundColor(.white)
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text(expense.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text(expense.subTitle)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(expense.amount)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding()
            }
        }
    }
    
    // MARK: Retreiving Index
    func getIndex(month: String)->Int{
        return months.firstIndex { value in
            return month == value
        } ?? 0
    }
    
}

struct ExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseView()
        
    }
}
