//
//  ContentView.swift
//  GeometryChallenge
//
//  Created by Víctor Ávila on 28/09/24.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                            Text("Row #\(index)")
                                .font(.title)
                                .frame(maxWidth: .infinity)
                                .background(Color(hue: min((proxy.frame(in: .global).minY / (fullView.size.height * 20)) + 0.1, 1.0),
                                                  saturation: ((2/pow(fullView.size.height, 2))*pow(proxy.frame(in: .global).minY, 2)) - ((2/fullView.size.height)*proxy.frame(in: .global).minY) + 1.0,
                                                  brightness: 1))
                                .rotation3DEffect(.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                                .opacity(proxy.frame(in: .global).minY / 200)
                                .scaleEffect(max(0.000651 * proxy.frame(in: .global).maxY + 0.434, 0.5))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
