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

    var body: some View {

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
    }
}

#Preview {
    DeckStyleView(selection: .constant(0))
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
