//
//  SwiftUIView.swift
//  
//
//  Created by 성재 on 6/26/24.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State private var date = Date()
    @State private var isNotienabled: Bool = false
    @State private var isTimeenabled: Bool = false
    @State private var isSentenabled: Bool = false

    
    var body: some View {
        VStack {
            Form {
                Section {
                    Toggle("알림", isOn: $isNotienabled)
                        .tint(Color.maingra)
                    if !isNotienabled {
                        Text("꾸준한 일기 작성을 위해 알림을 켜주세요.")
                            .foregroundStyle(.gray)
                    }
                } header: {
                    Text("알림")
                }
                
                Section {
                    Toggle("시간 지정하기", isOn: $isTimeenabled)
                        .tint(Color.maingra)
                    if isTimeenabled {
                        DatePicker("알림 시간", selection: $date, displayedComponents: [.hourAndMinute])
                    }
                } header: {
                    Text("알림 시간 설정하기")
                }
                
                Section {
                    Button("알림 문구 스타일 지정하기") {
                        
                    }
                      
                } header: {
                    Text("알림 문구 설정하기")
                }
                
            }
            .background(Color.ivory1)
            .scrollContentBackground(.hidden)
        }
        .navigationBarTitle("알림 설정")

    }
}

public extension Color {
    static let ivory1 = Color(UIColor(named: "ivory1", in: .module, compatibleWith: nil)!)
    static let maingra = Color(UIColor(named: "maingra", in: .module, compatibleWith: nil)!)
}

#Preview {
    SwiftUIView()
}
