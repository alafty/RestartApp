//
//  ContentView.swift
//  Restart
//
//  Created by Mohamed El-Alafty on 18/07/2022.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingActive: Bool = true
    var body: some View {
        if(isOnboardingActive){
            OnboardingView()
        } else{
            HomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
