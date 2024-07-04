// The Swift Programming Language
// https://docs.swift.org/swift-book
//
//  SwiftUIView.swift
//
//
//  Created by 성재 on 6/26/24.
//

import SwiftUI

public struct LPNotiSysView: View {
    
    // MARK: AppStorage에 저장할 것
    @State private var date = Date()
    @State private var isNotienabled: Bool = false
    @State private var isTimeenabled: Bool = false
    @State private var isSentenabled: Bool = false
    @State private var typeSelected: Int = 0
    
    let manager = NotificationManager.instance
    @State private var popups: Bool = false

    // public initializer 추가
    public init() {}
    
    public var body: some View {
        VStack {
            
            VStack {
                HStack {
                    Text("Notification")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal, 32)
                
                HStack {
                    Text("꾸준한 일기 작성을 위한 나만의 알림 설정하기")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                    Spacer()
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 4)
            }
            .padding(.top, 8)
            
            Form {
                Section {
                    NotificationView(
                        timeAgo: isTimeenabled ? Date().formatDate(date) : "1h ago",
                        content: MockData.exbodytext[typeSelected]
                    )
                    .blur(radius: isNotienabled ? 0 : 3.0)
                    .animation(.easeInOut)

                } header: {
                    Text("다음으로 표시")
                }
                
                Section {
                    Toggle("알림", isOn: $isNotienabled)
                        .onChange(of: isNotienabled) {
                            if !isNotienabled {
                                isTimeenabled = false
                            }
                        }
                        .disabled(true)
                        .tint(Color.maingra)
                    
                    if !isNotienabled {
                        HStack {
                            Text("꾸준한 일기 작성을 위해")
                                .foregroundStyle(.gray)
                            Spacer()
                            Button(action: {
                                openAppSettings()
                            }, label: {
                                Text("알림 켜기")
                            })
                        }
                    }
                } header: {
                    Text("알림")
                }
                
                Section {
                    Toggle("시간 지정하기", isOn: $isTimeenabled)
                        .tint(Color.maingra)
                        .allowsHitTesting(isNotienabled)
                    
                    if isTimeenabled {
                        DatePicker("알림 시간", selection: $date, displayedComponents: [.hourAndMinute])
                    }
                } header: {
                    Text("알림 시간 설정하기")
                }
                
                Section {
                    HStack {
                        Text("알림 문구 스타일")
                        Spacer()
                        interButton(selection: $typeSelected)
                            .onTapGesture {
                                popups.toggle()
                            }
                            .blur(radius: isNotienabled ? 0 : 3.0)
                            .allowsHitTesting(isNotienabled)


                    }
                    .padding(.vertical, 4)
                      
                } header: {
                    Text("알림 문구 설정하기")
                }
                
            }
            .background(Color.ivory1)
            .scrollContentBackground(.hidden)
        }
        .sheet(isPresented: $popups, content: {
            DeckStyleView(selection: $typeSelected)
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(40)
        })
        .onAppear {
            getpushnotiauth()
            manager.requestAuthorization()
            manager.scheduleNotification(idx: typeSelected)
        }
        .navigationBarTitle("알림 설정")
        
    }
    
    private func getpushnotiauth() {
        UNUserNotificationCenter.current().getNotificationSettings(completionHandler: {
            setting in
            if setting.authorizationStatus == .authorized {
                self.isNotienabled = true
            } else {
                self.isNotienabled = false
            }
        })
    }
    
    private func openAppSettings() {
        if let appSettings = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(appSettings) {
                UIApplication.shared.open(appSettings)
            }
        }
    }
}


#Preview {
    LPNotiSysView()
}




public extension Color {
    static let ivory1 = Color(UIColor(named: "ivory1", in: .module, compatibleWith: nil)!)
    static let maingra = Color(UIColor(named: "maingra", in: .module, compatibleWith: nil)!)
    static let mainpoint = Color(UIColor(named: "mainpoint", in: .module, compatibleWith: nil)!)
    static let grad1 = Color(UIColor(named: "grad1", in: .module, compatibleWith: nil)!)
    static let grad1_2 = Color(UIColor(named: "grad1_2", in: .module, compatibleWith: nil)!)

    static let grad2 = Color(UIColor(named: "grad2", in: .module, compatibleWith: nil)!)
    static let grad2_2 = Color(UIColor(named: "grad2_2", in: .module, compatibleWith: nil)!)

    static let grad3 = Color(UIColor(named: "grad3", in: .module, compatibleWith: nil)!)
    static let grad3_2 = Color(UIColor(named: "grad3_2", in: .module, compatibleWith: nil)!)

    static let grad4 = Color(UIColor(named: "grad4", in: .module, compatibleWith: nil)!)
    static let grad4_2 = Color(UIColor(named: "grad4_2", in: .module, compatibleWith: nil)!)

    static let grad5 = Color(UIColor(named: "grad5", in: .module, compatibleWith: nil)!)
    static let grad5_2 = Color(UIColor(named: "grad5_2", in: .module, compatibleWith: nil)!)

}

extension Date {
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm a"
        return formatter.string(from: date)
    }
}
