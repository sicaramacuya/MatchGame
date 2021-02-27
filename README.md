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


