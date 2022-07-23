//
//  HomeView.swift
//  Restart
//
//  Created by Mohamed El-Alafty on 18/07/2022.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboarding") var isOnboardingActive:Bool = false
    var body: some View {
        VStack(spacing: 20){
            //Mark: - Header
            Spacer()
            
            ZStack {
                CircleElementView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
            }
            
            //Mark: - Center
            Text("The time that leads to mastery depends on the intensity of our focus")
                .font(.title3)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding()
            
            //Mark: - Footer
            Spacer()
            
            Button(action: {
                isOnboardingActive = true
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                    
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
