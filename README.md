# MatchGame

Sample iOS color matching game. This game mocks up one of those "brain training" games based on the [Stroop Effect](https://faculty.washington.edu/chudler/words.html). 

The game is built using SwiftUI and shows how you might construct a single view application with SwiftUI. 

## Concepts Covered 

- SwiftUI 
  - Layout
    - ZStack
    - VSatck
    - HStack
    - Spacer
  - UI Elements 
    - Text
    - Button
    - Rectangle
    - EmptyView
  - Logic
    - if else
- ObservableObject
  - @Published
  - @EnvironmentObject
- Timers

## The Game 

The game shows two colored text labels and asks if the color name of the top label matches the color of the bottom label. The bottom is displayed in a color that doesn't necessarily match the text. 

The challenge is disaccosiating your perception of the color name and the actual color. 

Read more about the  [Stroop Effect](https://faculty.washington.edu/chudler/words.html). 

## SwiftUI 

[SwiftUI](https://developer.apple.com/documentation/swiftui/) is Apple's newset addition to the Swift ecosystem. SwiftUI is a language for creating user interfaces. I think it's a huge improvement over storyboard. 

At this time it only works with 

- iOS13+ 
- macOS15+
- Mac Catalyst 13+
- tvOS 13+
- watchOS 6+

It promises better performance than storyboards and seems to be a lot easier to use. 

### Layout 

Layout is accomplisehed through the use of Stacks which come in three flavors: 

- ZStack
- VStack
- HStack

These arrange all of their child objects along an axis with some rules or options you specify. 

This example app uses all three to create an interesting and complex layout. 

#### ZStack 

The ZStack arranges elements front to back. Here it is used in two places. 

The whole app is contained insde of a ZStack with the background color in the back and all of the other elements inside a VStack in the front. 

The game displays a green circle with a check mark or a red circle with an x to show the result of a game. This is appears in front of the color labels and arrangement is handled with a ZStack. The labels are in a VStack in the back and the results indicator is in the front. 

#### VStack 

The VStack arranges elements along a vertical axis. Here the game screen is broken down into three areas with the score at the top, the color labels an results in the center, and buttons at the bottom. The VStack arranges everything. 

Spacers are used to add a space between elements pushing the score to the top and the buttons to the bottom. 

#### HStack

The HStack arranges elements along a horizontal axis. Here the HStack is used to arrange the score keeping elements in a horizontal row along the top and the buttons along the bottom. 

#### Spacer

The Spacer is an element that can fill the available space are add a fixed amount of space between elements. 

Here the Spacer is used to add space between the score and the color labels, and between the color labels and the buttons. This pushes the score to the top and the buttons to the bottom of the screen. 

### UIElements 

SwiftUI supplies a range of UI Elements. All of the familiar elements from UIKit are present. 

In this app I used: Text, Rectangle, Button, and EmptyView. 

#### Text 

The Text element displays text. It can be single or multiline and styled in all the ways you would exepct. 

#### Button

The Button element creates a standard iOS button and can be styled. The button takes an Action to handle taps, and a label which is a Text object to display. This provides a lot of options for styling the button. 

#### Rectangle 

The Rectangle draws a rectangular field. It can be colored and styled in various ways. I used the Rectangle here for the background behind the color labels. 

#### EmptyView

The EmptyView is place holder for a view that might not always be diplayed. I used the EmptyView here to handle the results prompt. When the results are not seen an EmptyView is used. 

The EmptyView is also used to hide the buttons at the bottom while the results are displayed. 

### Logic in SwiftUI 

SwiftUI is Switch but the code doesn't allow for all of the standard Swift. Think of SwiftUI as it's own language. SwiftUI has it's own version things like for loops and if else. 

I used an if else here to handle which view is displayed based on state of the application. 

### ObservableObject

Observable is an object that emits chnages that can be published and observed from other objects. Your SwiftUI interface can observe changes in an ObservableObject and update as appropriate. 

Here I created a single GameController class that is an ObservableObject. This object handles all of the game logic and publishes the properties that need to be observed by the UI. 

Read more about [ObservableObject](https://developer.apple.com/documentation/combine/observableobject)

#### @Published

Mark properties that can be observed with the @Published.

Read more about [@Published](https://developer.apple.com/documentation/combine/published)

#### @EnvironmentObject

The @EnvironmentObject marks an observable object supplied by the parent. 

Read more about [@EnvironmentObject](https://developer.apple.com/documentation/swiftui/environmentobject)

### Timers

Timers are used by the app to track the time it takes to play a game, and track the short pause between games. 

Read more about [Timer](https://developer.apple.com/documentation/foundation/timer)


## Game Play

I'm using the the term "game" here to represent one session of play. This would include displaying the colors and color word labels, starting the timer, waiting for a a Yes or No input. Tapping Yes or No ends the game and displays the results. 

In this implementation the results are displayed for 1 second before a new game is started. 

A correct answer is: Yes when the color name at the top matches the actual color of the text below or No when they don't match. For each correct answer the score increases by 100 and for each incorrect answer the score decreases by 100. 

A streak represents how many correct answers were provided in a row. When an incorrect answer occurs the streak is reset to 0. 

Currently colors are chosen from a list of 6: 

1. Red
2. Orange
3. Yellow
4. Green 
5. Blue
6. Purple

Internally GameController holds three colors: colorA (color and the text in the upper label), colorB (text of the lower label), and colorC (color of thelower label). When a game begins colors are assigned assigned randomly to each from the list. Yes is the correct answer when colorA and colorC match.

The odds of a Yes being correct is about 1 in 6. This makes No the most common answer. The game might be more interesting if the odds of a correct answer were 1 in 2. This might be an interesting experiment. 

With the current implementation there is not way to exit the game after starting. This is on the TODO list below. 

## TODO

This app is not finished it needs some work. Here is a list of areas that could be improved. 

- TODO: Add some motion! SwiftUI supports animation. Need to research this! 
- TODO: The center block shifts down when the buttons are removed. Might use a Spacer here
- TODO: Time might be better as 00:0 or 00:00 this means the timer needs to run 0.01
- TODO: Buttons are only active when you tap the text, make the tapable area larger
- TODO: Need a way to exit game. Add another button? Add a play again button?
- TODO: The colors are sometimes hard to read for example yellow
- TODO: The frequancy of a Yes answer might need some consideration. Currently the
   colors are randomly chosen. This means that match is about 1 in 6. Might be
   more challenging if matches were more like 1 in 2.
  - TODO: Add a count down 1, 2, 3 before starting the game. 
