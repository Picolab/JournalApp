# JournalApp add-ons

In an ideal Manifold world, an owner would operate their account,
and keep track of various things on the UI cards.
In practice this is too complicated and error-prone.

## Standalone entry web page

I wanted a simpler web-based form for my wife to use to record sugar numbers as she tested herself two or three times a day.
In the pico which has the `io.picolabs.journal` ruleset, I created a channel for that purpose.

As an operator of the pico-engine for the Manifold instance holding my account,
I installed the `journal.html` file in the `public` folder,
then set up a bookmark to that URL (with the addition of a query string
consisting of the ECI of the special channel).
Now, she can go to that bookmarked page, type in the number, 
press Enter and close the browser tab (or leave it open for another time).
Either way this is noticeably simpler than opening Manifold,
navigating to the correct card, hitting the icon to open the card,
clicking in the correct box, typing in the number, pressing Enter,
and remembering to close the browser tab (because of an issue in which Manifold continuous polls
even if its tab is not the active tab).

## Ruleset to record entries in a spreadsheet

I also felt the need for a spreadsheet to hold the history from the journal,
and added the `io.picolabs.journal_recorder` ruleset to post to that spreadsheet.
This is similar to the technique described in the
"[Using a Google sheet to record data from a pico](https://picolabs.atlassian.net/wiki/spaces/docs/pages/650182695/Using+a+Google+sheet+to+record+data+from+a+pico)"
page from the Pico Labs documentation.

