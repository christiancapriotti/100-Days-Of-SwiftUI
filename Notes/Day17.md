# Day 17

## 100 Days of SwiftUI

https://www.hackingwithswift.com/100/swiftui/17

Went over lots of good information even for an extremely simple app. Used some things that I haven't really had to use professionally in the past:

- `TextField` has an option to use `value:` so that you can add a `format:` versus simply using `text:`. Handy for things like numbers and percentages.
- You can use `Locale` to get user's regional settings, such as their currency.
- `.pickerStyle(.navigationLink)` handles navigating you to a new page with picker options (you must be within a `NavigationStack`).
- `@FocusState` is another type of state property wrapper for, well, focus. Helpful for controlling a Boolean based on what the user is currently (or not currently) focused on.
- `Picker` has a `.tag` view modifier so that the type of each selection matches the type of the bound state variable.
- `ToolbarItemGroup(placement: .keyboard)` is great for adding a "Done" button on the keyboard, handy for decimal and number pads which don't have a "Done" key.

## Youtube

I got through videos 9-15 today:

9. How to use Structs in Swift
10. How to use Enums in Swift
11. How to use Classes in Swift
12. How to use Access Control
13. How to use Arrays and Sets in Swift
14. How to use Dictionaries in Swift
15. How to use For Loops in Swift

- Though I'm quite familiar with enums at this point, I liked how this was put: "Enum is the same as Struct except we know all cases at runtime"
- Just a note to myself after watching the access control video - I think I should use `private(set)` more. `public` properties should be rare.
- Learned about using `Array.indices.contains` to check if an array is safe to subscript.. I've always used `count` in the past.

Once again, not too many new bits of information from these beginner videos - but I'm still glad I'm taking the time to go through them. Can never have too much reinforcement. Trying to get through the beginner ones quick so I can move on to the more intermediate & advanced playlists.