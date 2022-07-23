//
//  CircleElementView.swift
//  Restart
//
//  Created by Mohamed El-Alafty on 23/07/2022.
//

import SwiftUI

struct CircleElementView: View {
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    
    var body: some View {
        Circle()
            .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
            .frame(width: 260, height: 260, alignment: .center)
        Circle()
            .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 60)
            .frame(width: 260, height: 260, alignment: .center)
    }
}

struct CircleElementView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea()
            CircleElementView(ShapeColor: .white, ShapeOpacity: 0.2)
        }
    }
}
