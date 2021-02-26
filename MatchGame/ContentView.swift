//
//  ContentView.swift
//  MatchGame
//
//  Created by Mitchell Hudson on 2/23/21.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var env: GameController
  
  var body: some View {
    
    // Wrapper
    ZStack {
      // Background Color
      Color(hue: 0.473, saturation: 0.03, brightness: 0.3)
        .ignoresSafeArea()
      // Main Container
      VStack {
        // Top row
        HStack {
          // Score
          Text("Score: \(env.score)")
            .frame(maxWidth: .infinity)
            .padding(5)
          // Time
          Text("\(env.seconds)")
            .frame(maxWidth: .infinity)
            .padding(5)
          // Steak
          Text("Streak: 0")
            .frame(maxWidth: .infinity)
            .padding(5)
        }
        
        Spacer()
        
        // Center color labels
        ZStack {
          colorDisplay()
          resultsDisplay()
        }
        
        Spacer()
        
        // Button/s at the bottom
        buttonBlock()
      }
    }
  }
  
  // TODO: Move that top row in here...
  func scoreDisplay() {
    
  }
  
  
  // Display Colors in center
  func colorDisplay() -> AnyView {
    // Display some text that says Start
    if env.gameState == .start {
      return AnyView(Text("Ready!"))
    }
    // Display the Color Labels
    return AnyView(VStack {
      // Top label colorA, color ColorA
      TextDisplay(str: env.colorA.toString(), color: Color(env.colorA.toUIColor()))
      // Bottom label colorB, color * colorC *
      TextDisplay(str: env.colorB.toString(), color: Color(env.colorC.toUIColor()))
    })
  }
  
  // Display the results
  func resultsDisplay() -> AnyView {
    // if game is over show the results
    // Now I remember why I have .over state and wins !!!!
    if env.gameState == .over {
      return AnyView(
        // if wins true show check otherwise x
        Text(env.wins ? "✓" : "✖️")
          .font(.system(size: 30))
          .frame(width: 60, height: 60, alignment: .center)
          .background(env.wins ? Color.green : Color.red)
          .cornerRadius(50))
    }
    // If gamestate is not .over return an empty view
    return AnyView(EmptyView())
  }
  
  // Shows the buttons at the bottom
  func buttonBlock() -> AnyView {
    // If game state .ready show Yes and No
    if env.gameState == .ready {
      return AnyView(HStack(alignment: .bottom) {
        ButtonDisplay(str: "Yes")
        ButtonDisplay(str: "No")
      })
    }
    
    // Otherwise show the Start button
    return AnyView(HStack(alignment: .bottom) {
      ButtonDisplay(str: "Start")
    })
  }
  
  
  func ButtonDisplay(str: String) -> AnyView {
    return AnyView(
      Button(action: {
        env.buttonTapped(label: str)
      }, label: {
        Text(str)
          .foregroundColor(.white)
          .font(.system(size: 24))
      })
      .frame(maxWidth: .infinity)
      .padding(16)
      .background(Color(white: 1.0, opacity: 0.5))
    )
  }
  
  
  func TextDisplay(str: String, color: Color = Color.black) -> AnyView {
    return AnyView(
      ZStack {
        Rectangle()
          .fill(Color(white: 0.9))
          .frame(width: UIScreen.screenWidth - 40, height: 70, alignment: .center)
          .cornerRadius(10)
        Text(str)
          .padding()
          .foregroundColor(color)
          .font(.system(size: 30, weight: .heavy, design: .default))
          
      }
    )
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environmentObject(GameController())
  }
}


extension UIScreen {
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
