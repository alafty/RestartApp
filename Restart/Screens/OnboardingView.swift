//
//  OnboardingView.swift
//  Restart
//
//  Created by Mohamed El-Alafty on 18/07/2022.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("onboarding") var isOnboardingActive:Bool = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            VStack{
                //MARK: Header
                VStack{
                    Text("Share")
                        .font(.system(size: 55))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.top)
                    Text("""
                        It's not how much you give
                        but how much love you put in giving
                        """)
                    .font(.system(size: 20))
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                }
                //MARK: CENTER
                ZStack{
                    CircleElementView(ShapeColor: .white, ShapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                }
                //MARK: FOOTER
                ZStack {
                    Text("Get Started")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.white)
                        .offset(x: 10)
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(9)
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                                .frame(width: 80)
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(7)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(.white)
                        }
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged{gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded{ _ in
                                    if buttonOffset < buttonWidth / 2{
                                        buttonOffset = 0
                                    } else {
                                        buttonOffset = buttonWidth - 80
                                        isOnboardingActive = false
                                    }
                                }
                        )

                        Spacer()
                    }//: Draggable Circle
                    
                    
        
                }//: Background ZStack
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                
                
            }
        }//: Main VStack
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
