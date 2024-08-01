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
    @AppStorage("LPN_savedTime") private var savedTime: String = "21:00:00"

    @State private var date = Date()
    @State private var isNotienabled: Bool = false
    @AppStorage("LPN_isTime") private var isTimeenabled: Bool = false
    @AppStorage("LPN_typeSent") private var typeSelected: Int = 0
    
    let manager = NotificationManager.instance
    @State private var popups: Bool = false


    // public initializer 추가
    public init() {
        // AppStorage에 저장된 시간을 Date 객체로 변환하여 초기값 설정
        if let savedDate = timeFormatter.date(from: savedTime) {
            _date = State(initialValue: savedDate)
        }
    }
    
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
                    Text("꾸준한 일기 작성을 위한 나만의 알림 설정하기", bundle: .module)
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
                    Text("다음으로 표시", bundle: .module)
                }
                
                Section {
                    Toggle(NSLocalizedString("알림", bundle: .module, comment: ""), isOn: $isNotienabled)
                        .onChange(of: isNotienabled) {
                            if !isNotienabled {
                                isTimeenabled = false
                            }
                        }
                        .allowsHitTesting(false)
                        .tint(Color.maingra)
                    
                    if !isNotienabled {
                        HStack {
                            Text("꾸준한 일기 작성을 위해", bundle: .module)
                                .foregroundStyle(.gray)
                            Spacer()
                            Button(action: {
                                openAppSettings()
                            }, label: {
                                Text("알림 켜기", bundle: .module)
                            })
                        }
                    }
                } header: {
                    Text("알림", bundle: .module)
                }
                
                Section {
                    Toggle(NSLocalizedString("시간 지정하기", bundle: .module, comment: ""),  isOn: $isTimeenabled)
                        .tint(Color.maingra)
                        .allowsHitTesting(isNotienabled)
                        .onChange(of: isTimeenabled) {
                            if !isTimeenabled {
                                savedTime = "21:00:00"
                            }
                        }
                    
                    if isTimeenabled {
                        DatePicker(NSLocalizedString("알림 시간", bundle: .module, comment: ""), selection: $date, displayedComponents: [.hourAndMinute])
                            .onChange(of: date) { newDate in
                                // 선택한 시간을 AppStorage에 저장
                                savedTime = timeFormatter.string(from: newDate)
                            }
                    }
                } header: {
                    Text("알림 시간 설정하기", bundle: .module)
                }
                
                Section {
                    HStack {
                        Text("알림 문구 스타일", bundle: .module)
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
                    Text("알림 문구 설정하기", bundle: .module)
                }
                
            }
            .background(Color.ivory1)
            .scrollContentBackground(.hidden)
        }
        .sheet(isPresented: $popups, content: {
            DeckStyleView(selection: $typeSelected, ispopups: $popups)
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(40)
        })
        .onAppear {
            getpushnotiauth()
            manager.requestAuthorization()
            manager.scheduleNotification(idx: typeSelected, handm: savedTime)
        }
        .onChange(of: typeSelected) {
            manager.scheduleNotification(idx: typeSelected, handm: savedTime)
        }
        .onChange(of: savedTime) {
            manager.scheduleNotification(idx: typeSelected, handm: savedTime)
        }

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
    
    // 시간 포맷터 설정
    private var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter
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
