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
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var opacityModifier: Double = 1.0
    @State private var mainText:String = "Share"
    
    let hapticFeedback = UINotificationFeedbackGenerator()
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            VStack{
                //MARK: Header
                VStack{
                    Text(mainText)
                        .font(.system(size: 55))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.top)
                        .transition(.opacity)
                        .id(mainText)
                    
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
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                //MARK: CENTER
                ZStack{
                    CircleElementView(ShapeColor: .white, ShapeOpacity: 0.2)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(isAnimating ? 0.9 : 0.6)
                        .offset(y: isAnimating ? 0 : 80)
                        .animation(.easeOut(duration: 1), value: isAnimating)
                        .offset(x: imageOffset.width * 1.5, y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 10)))
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if abs(imageOffset.width) <= 150 {
                                        imageOffset = gesture.translation
                                        withAnimation(.linear(duration: 0.25)) {
                                            opacityModifier = 0
                                            mainText = "Give"
                                        }
                                        
                                    }
                                })
                                .onEnded({ _ in
                                    withAnimation(.easeOut(duration: 0.4)){
                                        imageOffset = .zero
                                    }
                                    withAnimation(.linear(duration: 0.25)) {
                                        opacityModifier = 1
                                        mainText = "Share"
                                    }
                                })
                        )
                }
                .overlay(
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 30, weight: .light))
                        .foregroundColor(.white)
                        .opacity(isAnimating ? 0.5 : 0)
                        .offset(y: -20)
                        .opacity(opacityModifier)
                        .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                    , alignment: .bottom
                )
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
                                    withAnimation(.easeOut(duration: 0.4)){
                                        if buttonOffset < buttonWidth / 2{
                                            buttonOffset = 0
                                            hapticFeedback.notificationOccurred(.warning)
                                        } else {
                                            buttonOffset = buttonWidth - 80
                                            playSound(name: "chimeup", type: "mp3")
                                            hapticFeedback.notificationOccurred(.success)
                                            isOnboardingActive = false
                                            
                                        }
                                    }
                                }
                        )

                        Spacer()
                    }//: Draggable Circle
                    
                    
        
                }//: Background ZStack
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
            }
        }//: Main VStack
        .onAppear(perform: {
            isAnimating = true
        })
        .preferredColorScheme(.dark)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
