# Pre-work - Tip Calculator

Tip Calculator is a tip calculator application for iOS.

Submitted by: Jeremy Goh

Time spent: 7 hours spent in total (spent some of that time reading documentation)

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [X] UI animations
* [X] Remembering the bill amount across app restarts (if <10mins)
* [X] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:
* [X] Prevent duplicate decimals

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

This walkthrough was done with bill amount remembered across app restarts < 5 seconds so as to demonstrate the functionality without waiting!

![Video Walkthrough](http://i.imgur.com/G8iwPsF.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

I did the layout using a hybrid of storyboard and programmatic views. I need to figure out AutoLayout to get it to work with other screens. I did the layout for an iPhone 7

Setting a default tip percentage doesn't change your current calculation (this is intended).

## License

    Copyright 2017 Jeremy Goh

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.