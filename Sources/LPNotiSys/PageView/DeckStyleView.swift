//
//  SwiftUIView.swift
//  
//
//  Created by 성재 on 7/2/24.
//

import SwiftUI
import BigUIPaging

struct PageView: View {
    @State private var selection: Int = 1

    var body: some View {

        PageView(selection: $selection) {
            ForEach(1...10, id: \.self) { id in
                Text("Page \(id)")
            }
        }
        .pageViewStyle(.scroll)
    }
}

#Preview {
    PageView()
}
