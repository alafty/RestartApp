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
            Text("Home View")
                .font(.headline)
            Button(action: {
                isOnboardingActive = true
            }) {
                Text("Go to Onboarding")
            }

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
