//
//  HomeView.swift
//  Restart-appl
//
//  Created by mert palas on 30.01.2024.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboarding") var isOnBoardingViewActive:Bool = false
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack{
       //header
            Spacer()
            
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.2)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y : isAnimating ? 50 : -50)
                    .animation(
                    Animation
                        .easeInOut(duration: 4)
                        .repeatForever()
                    ,  value: isAnimating
                        
                    )
            }
            //center
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
                // footer
                Spacer()
            
            Button(action: {
                withAnimation{
                    playSound(sound: "succes", type: "m4a")
                    isOnBoardingViewActive = true
                }
            }){
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                    
        Text("Restart")
                    .font(.system(.title3,design: .rounded))
                    .fontWeight(.bold)
        }// btn
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .buttonBorderShape(.capsule)
            
        }//vstack
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4,  execute:  {
                isAnimating = true
            })
        })
        
    }
}
        
        
        
        
        

#Preview {
    HomeView()
}
