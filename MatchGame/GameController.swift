//
//  GameController.swift
//  MatchGame
//
//  Created by Mitchell Hudson on 2/23/21.
//

import Foundation


/*
 
1. Display Start button - GameState.start
     Tap start button -> GameState.ready
       Start Timer
       Choose random colors
       set GameState.playing

2. Shows the color labels and Yes No buttons - GameState.playing
     tap Yes or No
       check answer
         stop timer
         update score
         update streak
         update wins
         set GameState.over
 
3. Show the results - GameState.over
     start a timer
       On Timer
       set GameState.playing
 
 */



// Game Controller
class GameController: ObservableObject {
  // These variables are shared with the view
  @Published var colorA: GameColor = .Blue     // Color of the top text and text label
  @Published var colorB: GameColor = .Orange   // Text label on the bottom label
  @Published var colorC: GameColor = .Red      // Color of the bottom label
  @Published var seconds: String = "00:00"     // TODO: update and format the time
  @Published var score: Int = 500              // score
  @Published var streak: Int = 0               // Streak count
  @Published var wins: Bool = false            // ??? I was going to do something with this...
  @Published var gameState: GameState = .start // Keeps track of the game state, needs work
  
  var ms: Int = 0 // TODO: keep track of time
  
  var timer: Timer? // TODO: Get the timer working
  
  init() {
    
  }
  
  
  // Handles taps on buttons
  // Use the button label to decide what to do
  // TODO: Needs some work...
  func buttonTapped(label: String) {
    switch gameState {
    // Start Button
    case .start: // Start button
      gameState = .ready // Chaning the state displays the labels and Yes/No Buttons
      chooseColors()     // Choose some random colors
      
    // Ready - Thinking about using this for a countdown before starting
    // For now we'll check your answer
    case .ready:
      checkAnswer(answer: label)
      return
    
    // Playing - the timer should be running here
    case .playing:
      checkAnswer(answer: label)
    
    // Game Over - Maybe we don't need this, can set the state to .start and show
    // the start button again?
    case .over:
      gameState = .playing
    }
  }
  
  
  // Check your answer - Pass it the label. Button labels should probably be an enum
  func checkAnswer(answer: String) {
    // If colorA and colorC match your answer should be Yes!
    // If they don't your answer should be no
    if (colorA == colorC && answer == "Yes") || (colorA != colorB && answer == "No") {
      // Got it right
      wins = true   // Still not using this...
      score += 100  // Add some points
      streak += 1   // Up the streak
    } else {
      // Got it wrong
      score -= 100  // lose some points
      streak = 0    // reset that streak
    }
    // Select some new colors
    // TODO: go to the ready state, start a count down or delay before shwoing the next colors
    chooseColors()
  }
  
  // Set the color variables to star a game
  func chooseColors() {
    // Choose three colors at random
    colorA = randomColor()
    colorB = randomColor()
    colorC = randomColor()
    // The frequency of colors that match will 1 in 6. We might want this to me more like 1 / 2?
  }
  
  // Returns a random GameColor
  func randomColor() -> GameColor {
    // An array of all GameColors
    let colors: [GameColor] = [.Red, .Yellow, .Orange, .Green, .Blue, .Purple]
    // Return a color from the array
    return colors[Int.random(in: 0..<6)]
  }
  
  // Starts a timer
  func startTimer() {
    // This starts a timer updating in 1/10 secs this might need to be 1/100s
    timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
      self.updateTimer()
    })
    ms = 0 // reset the ms count
    // Might need to drop the timer and use a frame loop. Use delta time to calculate the time
  }
  
  // Clears the time
  func resetTimer() {
    timer?.invalidate()
  }

  // Handles updates to the timer
  func updateTimer() {
    ms += 1 // add a ms and format the time
    formatTime()
  }
  
  // Format the time to display in the UI
  func formatTime() {
    // TODO: Need to pad with 0
    seconds = "\(ms / 10):0\(ms % 10)"
  }
}
