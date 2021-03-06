# Pre-work - *Tipz*

**Tipz** is a tip calculator application for iOS.

Submitted by: **Peter**

Time spent: 10 hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] UI animations
* [x] Remembering the bill amount across app restarts  
* [ ] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Gave life to the app through emojis !

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/zCY3Qai.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**
It is very matured way of doing mobile stuff , i find it very stable and lot of help online/youtube . Dragging and dropping is pretty annoying , the other way of building everything in code is very hard to maintain. lot of UI  option they look pretty and nice at runtime l
they should provide some autocomplete ui options there might be some already i don’t know hope you guys will teach me that ;-)
swift is very easy to read they have got ridden of lot of unwanted programing requirements, xcode tool is very helpful in assist frame work the debug is ok, lot of times it is stuck in the some internal libraries, git hub is a treasure chest lot of libraries the world is full of good hearted developers



outlets 
They seem to be inbuilt classes with each having their own variables, methods. They use lot of enum's 
actions are more like function good reuse.
ah the storyboard is big xml file, apple seem to be parsing it and building the ui and interfaces
each node represents an object and their attributes are the objects feature 

**  

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures?
 (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Swift manages memory by releasing the objects once their life time ends, but it also uses counter to make sure the objects are not active when they release , these counters depends on the references made to those objects it increments when a reference is made and does the revers when it deinit (setting it to nil) we do not need to worry about memory management. There are cases where we need to make sure there is not any circle/strong references
It can happen between classes having one to one relationships example person and apartment so developers where they get into strong reference mode and releasing one object does not releases the other we need to use week or unowned references to avoid such use cases .
Closure can also falls under the same case even though they are single object , these properties try to capture and operate on the values of their own class , so they end up in circle reference . It is like mom thinks kid is here just seeing his shirt , we need to educate shirt covers body but seeing that does not mean he is there shirt has a week reference it is ready for laundry if the kids is not there .
**



## License

    Copyright 2017 Peter Rajesh

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.