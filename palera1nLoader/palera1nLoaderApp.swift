//
//  palera1nLoaderApp.swift
//  palera1nLoader
//
//  Created by Lakhan Lothiyi on 11/11/2022.
//

import SwiftUI

@main
struct palera1nLoaderApp: App {
    @State var triggerRespring = false
    
    var body: some Scene {
        WindowGroup {
            ContentView(triggerRespring: $triggerRespring)
                .preferredColorScheme(triggerRespring ? .dark : .none)
                .scaleEffect(triggerRespring ? 0.95 : 1)
                .brightness(triggerRespring ? -1 : 0)
                .statusBarHidden(triggerRespring)
                .onChange(of: triggerRespring) { _ in
                    if triggerRespring == true {
                        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { timer in
                            
                            // TY amy for respring bug
                            guard let window = UIApplication.shared.windows.first else { return }
                            while true {
                               window.snapshotView(afterScreenUpdates: false)
                            }
                            
                        }
                    }
                }
        }
    }
}
