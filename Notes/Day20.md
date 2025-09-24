# Day 20

## 100 Days of SwiftUI

https://www.hackingwithswift.com/100/swiftui/20

No project code today, just videos to review. Learned a few things:

- Material backgrounds look really nice:
   `.background(.regularMaterial, in: RoundedRectangle(cornerRadius: 8))`
- Gradients: `LinearGradient`, `RadialGradient`, `AngularGradient` 
    - Colors have gradients! `.background(.red.gradient)`
- `Image(decorative:)` is nice for decorative images so that they're not read out by VoiceOver
- I didn't know about the `Label` View, essentially an `HStack` with an `Image` and `Text`, but also adapts to where it's presented on the screen.

## Youtube

[Creating Shapes in SwiftUI | Bootcamp #3](https://www.youtube.com/watch?v=1dWHjdWgS5M&list=PLwvDm4VfkdphqETTBf-DdjCoAvhai1QpO&index=4)

Went over basic SwiftUI shapes: `Circle`, `Ellipse`, `Capsule`, `Rectangle`, `RoundedRectangle` and some of the common modifiers you can apply to them. I've never used `.stroke` or `.trim`!

[Color, UIColor, Color Literals, and Hex Colors in SwiftUI | Bootcamp #4](https://www.youtube.com/watch?v=pqnLevvM7Rs&list=PLwvDm4VfkdphqETTBf-DdjCoAvhai1QpO&index=6)

Went over basic colors, primary and secondary colors, color literals, `UIColor` in UIKit, and adding custom colors as an asset. Also went over shadows a little more, which can be a nice touch that make an app look more professional.