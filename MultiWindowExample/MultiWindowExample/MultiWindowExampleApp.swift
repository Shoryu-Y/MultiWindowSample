//
//  MultiWindowExampleApp.swift
//  MultiWindowExample
//
//  Created by tatsubee on 2024/09/09.
//

import SwiftUI
import OpenWindow
import ChangeWindowSize

@main
struct MultiWindowExampleApp: App {
    var body: some Scene {
        WindowGroup(id: "FirstView") {
//            OpenWindow.FirstView()
            ChangeWindowSize.FirstView()
        }

        OpenWindow.TargetSceneWithID()
        OpenWindow.TargetSceneWithValue()
        OpenWindow.TargetSceneWithUserInteraction()

        ChangeWindowSize.TargetSceneWithDefaultSize()
        ChangeWindowSize.TargetSceneWithResizability()
    }
}
