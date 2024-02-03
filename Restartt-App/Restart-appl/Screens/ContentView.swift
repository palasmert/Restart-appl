//
//  ContentView.swift
//  Restart-appl
//
//  Created by mert palas on 30.01.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @AppStorage("onboarding") var isonboardingViewActive:Bool = true
    var body: some View {
        ZStack{
            if isonboardingViewActive{
                OnboardingView()
            }else {
                HomeView()
            }
        }
            
    }
}

struct ContentView_Previews:PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}

