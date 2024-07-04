//
//  SwiftUIView.swift
//  
//
//  Created by 성재 on 7/2/24.
//

import SwiftUI
import BigUIPaging

struct DeckStyleView: View {
//    @State private var selection: Int = 0
    @Binding var selection: Int
    @Binding var ispopups: Bool

    var body: some View {
        VStack {
            HStack {
                Text("알림 문구 스타일")
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 4)
            
            HStack {
                Text("동기부여를 받도록 원하는 스타일을 선택하세요")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 4)
        }
        .padding(.top, 8)
        PageView(selection: $selection) {
            ForEach(0..<5, id: \.self) { id in
                DeckStyleSubView(value: id, title: MockData.title[id], bodytext: MockData.bodytext[id])
            }
        }
        .frame(height: UIScreen.main.bounds.height/4)
        .pageViewStyle(.cardDeck)
        
        PageIndicator(
            selection: $selection,
            total: 5
        )
        .pageIndicatorBackgroundStyle(.prominent)
        .padding(.bottom, 24)

        
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 40)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [.black.opacity(0.9), .black.opacity(0.9)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .frame(height: 44)
                    .shadow(color: .indigo.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: .white.opacity(0.6), radius: 10, x: 10, y:10)
                    
                
                HStack(spacing: 13) {
                    
                    Text("마음에 들어요")
                        .font(.system(size: 14, weight: .bold))
                        .onTapGesture {
                            ispopups.toggle()
                        }
                        
                }
                .foregroundStyle(.white)
            }
        }            
        .padding(.horizontal, 32)

    }
}

#Preview {
    DeckStyleView(selection: .constant(0), ispopups: .constant(true))
}

struct DeckStyleSubView: View {
    let value: Int
    let title: String
    let bodytext: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                Rectangle()
                    .fill(.white)
                    .ignoresSafeArea()
                HStack {
                    Rectangle().frame(width: 24, alignment: .center)
                        .foregroundStyle(value.color)
                    Spacer()
                }
                
                VStack(alignment: .center) {
                    Text("[ \(title) ]")
                        .font(.headline)
                    VStack {
                        Spacer()
                        Image(systemName: "number")
                        Spacer()
                        Text(bodytext)
                            .multilineTextAlignment(.center)
                            .lineSpacing(7.0)
                        Spacer()
                    }
                }
                .padding()
            }
        }
    }
}

extension Int {
    
    var color: Color {
        switch self % 10 {
        case 0: return .red
        case 1: return .orange
        case 2: return .yellow
        case 3: return .green
        case 4: return .mint
        case 5: return .teal
        case 6: return .blue
        case 7: return .indigo
        case 8: return .purple
        default: return .gray
        }
    }
}
