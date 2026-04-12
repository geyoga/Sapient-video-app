//
//  TestComponentView.swift
//  Sapient
//
//  Created by georgius on 11/04/26.
//

import SwiftUI

struct TestComponentView: View {
    var body: some View {
        Text("Hello, world!")
            .frame(width: 200, height: 100)
            .font(.title)
            .padding()
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.capsule)
    }
}

#Preview {
    TestComponentView()
}
