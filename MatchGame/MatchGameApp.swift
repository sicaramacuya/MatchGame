//
//  MatchGameApp.swift
//  MatchGame
//
//  Created by Mitchell Hudson on 2/23/21.
//

import SwiftUI

@main
struct MatchGameApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView().environmentObject(GameController())
    }
  }
}
