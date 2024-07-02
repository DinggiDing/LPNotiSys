//
//  SwiftUIView 2.swift
//  
//
//  Created by 성재 on 6/30/24.
//

import SwiftUI

struct interButton: View {
    
    @State var fb = false
    @State var Hpress = false

    @Binding var selection : Int
        
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 40)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [MockData.colorset[selection][0], MockData.colorset[selection][1]]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .frame(width: 92, height: 36)
                    .shadow(color: MockData.colorset[selection][0].opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: .white.opacity(0.6), radius: 10, x: 10, y:10)
                    
                
                HStack(spacing: 13) {
                    
                    Text(MockData.type[selection])
                        .font(.system(size: 14, weight: .bold))
                        
                }
                .foregroundStyle(.white)
            }
        }
    }
}

//#Preview {
//    interButton(inter_text: "변경", fill_style1: Color.grad1, fill_style2: Color.grad1_2)
//}
