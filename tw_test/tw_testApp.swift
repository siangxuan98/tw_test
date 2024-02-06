//
//  tw_testApp.swift
//  tw_test
//
//  Created by Naik Siang Xuan on 07/02/2024.
//

import SwiftUI

@main
struct tw_testApp: App {
    @Environment(\.scenePhase) var scenePhase
    @AppStorage("appTheme") private var appTheme: String = "light"

    @StateObject var viewModel = HomeViewModel.shared
    
    init() {
        
        if let targetName = Bundle.main.object(forInfoDictionaryKey: "CFBundleExecutable") as? String {
            
            if (targetName == "tw_test_staging") {
                
                print(" * THIS IS A DEV RUN > " + targetName + " * ")
                
            } else {
                
                print(" * THIS IS A PRODUCTION RUN > " + targetName + " * ")
                
            }
            
        } else {
            
            print("Unable to determine the current target name.")
            
        }
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().preferredColorScheme(appTheme == "light" ? .light : .dark).environmentObject(viewModel)
        }.onChange(of: scenePhase) {
            switch scenePhase {
            case .active:
                print("App is in the foreground")
                // Perform actions when the app becomes active (in the foreground)
            case .inactive:
                print("App is inactive")
                // Perform actions when the app becomes inactive (e.g., transitioning to background)
            case .background:
                print("App is in the background")
                // Perform actions when the app is in the background
            @unknown default:
                fatalError("Unknown scene phase")
            }
        }
    }
}
