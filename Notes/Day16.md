# Day 16

## 100 Days of SwiftUI

https://www.hackingwithswift.com/100/swiftui/16

Went over really basic SwiftUI components:
- `Form`
- `Section`
- `Button`
- `Text`
- `TextField`
- `Picker`

---
Went over the `@State` property wrapper, and how it allows you to modify the state of a struct. It's intended to only be used on very small views, and Apple suggests properties marked with the wrapper always be marked `private`.

Looked into Apple's documentation on `@State`, goes more in depth on things like `@Binding` and `@Bindable`.. also explains how to share state with subviews:
https://developer.apple.com/documentation/swiftui/state

---

Went into using two way binding (ability to both read and write) with `State` properties, like so:

```swift
@State private var myText = "Example text"

...
var body: some View {
    ...
    TextField("Example textfield:", text: $myText)
```

---

Using the `ForEach` struct to loop over Views, and using `\.self` as an identifier:
```swift
private var names = ["Christian", "Tessa", "Andrew"]

ForEach(names, id: \.self)
```

---

Also some refreshing on the safe area and how you can modify the Navigation Bar to help prevent overlapping text when using a scroll view.

Some navigation bar stuff:
```swift
NavigationStack {
    ...
}
.navigationTitle()
.navigationBarTitleDisplayMode() (.large, .inline, .automatic)
```

## YouTube
I really like [Swiftful Thinking](https://www.youtube.com/@SwiftfulThinking) as a creator - he has a bunch of playlists and similar to me starting 100 Days of SwiftUI being an intermediate iOS developer yet starting with the basics - I'm going to start with his [Swift Basics](https://www.youtube.com/playlist?list=PLwvDm4VfkdpiLvzZFJI6rVIBtdolrJBVB) series just to refresh and see if there's tiny little tidbits of learning within them to fill in any potential gaps.

I suspect I won't be learning too much new information as I go through a lot of the series today, but I'll briefly jot down some things I found valuable or brushed up on below:

- `Double` vs `CGFloat` - essentially the same thing, but you use `Double` for math/data and `CGFloat` for UI
- You can print out a `Bool`'s description!
    ```swift
    let myBool: Bool = true
    print(myBool.description)
    ```
- Nice reminder that tuples can have more than two values, I've grown accustomed to only seeing two.
- Nice refresher on Stack vs Heap:
    - Value types (structs/enums) are stored on the stack, and each thread has its own stack.
    - Reference types (classes, actors, functions) live on the heap, which is shared.
    - Makes sense why views are structs, and I’m looking forward to digging into concurrency for more depth here.

----

So I got through videos 1–8 today:
1. How to code in Swift
2. How to use basic Types in Swift (Bool, String, Int)
3. How to use Strings in Swift
4. What are Operators in Swift
5. How to use Functions in Swift
6. What are Closures in Swift
7. How to use Tuples in Swift
8. What is Object Oriented Programming for Swift

Didn’t have too many new takeaways (which is *probably* a good thing).. most of these initial days will be mostly reinforcing the basics; but I'm really excited to get to the more complex topics soon.