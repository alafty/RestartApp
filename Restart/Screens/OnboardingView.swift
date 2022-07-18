//
//  OnboardingView.swift
//  Restart
//
//  Created by Mohamed El-Alafty on 18/07/2022.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("onboarding") var isOnboardingActive:Bool = true
    var body: some View {
        VStack(spacing: 20){
            Text("Onboarding View")
                .font(.headline)
            Button(action: {
                isOnboardingActive = false
            }) {
                Text("Go to Home")
            }

        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
