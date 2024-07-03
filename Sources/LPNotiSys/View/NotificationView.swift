//
//  SwiftUIView 2.swift
//  
//
//  Created by 성재 on 6/30/24.
//

import SwiftUI

struct NotificationView: View {
    let appName: String = "1 Day Diary"
    var timeAgo: String
    var content: String

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("icon", bundle: .module) // 실제 앱 아이콘 이미지로 변경
                    .resizable()
                    .frame(width: 32, height: 32)
                    .clipShape(RoundedRectangle(cornerRadius: 8.0))
                    .padding(.trailing, 8)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(appName)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Text(timeAgo)
                    .font(.system(size: 12))
                    .foregroundColor(.ivory1)
            }
            .padding(.bottom, 8)
            
            Text(content)
                .font(.system(size: 14))
                .foregroundColor(.white)
                .padding(.bottom, 4)
            
            Text("3 more notifications")
                    .font(.system(size: 12))
                    .foregroundColor(.ivory1)
        }
        .padding()
        .background(.thinMaterial)
        .cornerRadius(10)
        .shadow(radius: 10)
        .colorScheme(.dark)
    }
}

#Preview {
    NotificationView(
       timeAgo: "11:05 AM",
       content: "Content"
   )
}
