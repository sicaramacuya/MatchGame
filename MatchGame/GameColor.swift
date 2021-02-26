//
//  GameColor.swift
//  MatchGame
//
//  Created by Mitchell Hudson on 2/24/21.
//

import Foundation
import UIKit

// Game Colors - We need both a color and a string for each
enum GameColor {
  // These are the colors
  case Red, Yellow, Orange, Green, Blue, Purple
  
  // This method returns the color
  // Might have been good to use the built in UI colors
  func toUIColor() -> UIColor {
    switch self {
    case .Red:
      return UIColor(red: 179 / 255, green: 47 / 255, blue: 60 / 255, alpha: 1)
    case .Orange:
      return UIColor(red: 248 / 255, green: 148 / 255, blue: 29 / 255, alpha: 1)
    case .Yellow:
      return UIColor(red: 231 / 255, green: 217 / 255, blue: 54 / 255, alpha: 1)
    case .Green:
      return UIColor(red: 57 / 255, green: 181 / 255, blue: 74 / 255, alpha: 1)
    case .Blue:
      return UIColor(red: 0 / 255, green: 114 / 255, blue: 188 / 255, alpha: 1)
    case .Purple:
      return UIColor(red: 146 / 255, green: 39 / 255, blue: 143 / 255, alpha: 1)
    }
  }
  
  // Returns the string color name for the color
  func toString() -> String {
    switch self {
    case .Red:
      return "Red"
    case .Yellow:
      return "Yellow"
    case .Orange:
      return "Orange"
    case .Green:
      return "Green"
    case .Blue:
      return "Blue"
    case .Purple:
      return "Purple"
    }
  }
}
