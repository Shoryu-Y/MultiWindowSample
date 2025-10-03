//
//  MultiWindowExampleApp.swift
//  MultiWindowExample
//
//  Created by tatsubee on 2024/09/09.
//

import SwiftUI

import OpenWindow
import ChangeWindowSize
import AuthenticationWithPush

@main
struct visionOSMultiWindowExampleApp: App {
    var body: some Scene {
//        WindowGroup(id: "FirstView") {
//            OpenWindow.FirstView()
//            ChangeWindowSize.FirstView()
//        }

        if #available(visionOS 2.0, *) {
            AuthenticationWithPush.AuthScene()
            AuthenticationWithPush.MainScene()

            OpenWindow.TargetSceneWithID()
            OpenWindow.TargetSceneWithValue()
            OpenWindow.TargetSceneWithUserInteraction()

            ChangeWindowSize.TargetSceneWithDefaultSize()
            ChangeWindowSize.TargetSceneWithResizability()
        }
    }
}
