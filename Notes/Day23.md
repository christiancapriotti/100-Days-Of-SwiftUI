# Day 23

## 100 Days of SwiftUI

https://www.hackingwithswift.com/100/swiftui/23

- Have never heard of the `type(of:)` method. Extremely cool, especially how it lets you see the underbelly of what's actually going on in Swift. Example of what view modifiers are actually doing:

    ```swift
    Button("Hello, world!") {
        print(type(of: self.body))
    }    
    .background(.red)
    .frame(width: 200, height: 200)
    ```

    Prints:

    ```
    ModifiedContent<ModifiedContent<Button<Text>, _BackgroundStyleModifier<Color>>, _FrameLayout>
    ```

- Went over using the ternary operator for conditionally applying modifiers or adding views - it's just generally cleaner.

- Learned about environment variables, kind of. I've known that when you apply certain modifiers to containers it applies to all of the elements within the container, but I didn't know exactly how it works. Turns out there's not a great way of knowing whether the modifier you're working with is an environment or regular modifier.

- Views that are computed properties either need to be a container or marked as `@ViewBuilder`

- Great tip: Use a View extension when the modifier doesn’t need state; use a custom ViewModifier when you need to hold values (stored properties) inside the modifier.

## Youtube

[Adding images to a SwiftUI application | Bootcamp #7](https://www.youtube.com/watch?v=MeoiHFdIeR8&list=PLwvDm4VfkdphqETTBf-DdjCoAvhai1QpO&index=9)

Yet another overview of images, which I have a pretty good grasp of at this point! 

Went over basic modifiers such as:
- `.resizable`
- `.aspectRatio`
- `.scaledToFit`, `.scaledToFill`
- `.cornerRadius`
- `.clipShape`
- `.renderingMode`
