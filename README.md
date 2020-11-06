Original App Design Project - README Template
===

# App name: I'm Here
By: Nick Fong, Min-yuan Lee(Mina), Yi-En Laih(Emily)
## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
[Description of your app]
I’m Here is an app that allows multiple groups of friends to message each other and share a map with their own locations in that instance of a group. They can also click the I’m here button and a message will appear in that group's chat of all the people in a .5 mile radius of the person who pressed the button.

### App Evaluation

- **Category:**
Productivity / Messaging / Social

- **Mobile:**
We plan to use it on an IOS mobile device.

- **Story:**
Users could join groups and see other people’s locations or even share their location to other people. There will be a chat box and to let people communicate. 

- **Market:**
Any person could use the app but to keep it safe, there will be an age restriction for children.

- **Habit:**
This app can be used at any time, but requires use from other users to see their location.

- **Scope:**
People will be able to join groups by invitation and after joining, they can see everyone in that group on that group’s map.
We would start implementing a location sharing app that people could form groups to share their location with.


## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

The user can sign up or sign in to the app.
The user can create or leave a group.
Once joined a group the user can pinpoint the location to meetup or share his/her location and the user can see his/her members location if they show their location.
There’s a chat box for the user to communicate with the group members.
Settings where users can change username and password.



**Optional Nice-to-have Stories**

The user’s location will have like a bitmoji image or other image.
Maybe add a forget password feature.
The user could add people to the friend’s list.


### 2. Screen Archetypes

* [Login]
   * Existing users could login using username and password or create a new account that directs you to the create new user page.

[Sign up]
    Users could upload a profile image and create username and password.

* [Lobby]
   * Users could see the group's messages(has the map and everything else in it), Settings, Invites, and the New Group icon–. They could click the icon to proceed to those screens.
   
* [Settings]
   * Users could change their passwords and username on this screen. There is also a Logout button where users could log out of the app.

* [New Group]
    *This page the creator of the new group inputs the name of the group and can either press create a new group and directs you back to the Lobby with that new group in it or cancel to cancel creating the new group.



* [Inbox]
   * Users could see their invitation to join a certain group on this page and they could accept or decline the invitation. 

* [Messenger]
  * Users could chat with the group members here. There is a button where the user could go back to the Lobby screen. At the bottom of the Messenger page, there is a Map icon where users could click it to go to the Map page.

*[Members]
* Users could see how many members are in the group. There is also a kick option to kick the members out. Members could add people to this group using usernames.

*[Map]
* Displays a map with everyone in your group.  There is an I’m Here button that sends a message into the messenger page with you and the people in a .5 mile radius of you.  It also has a pin that you could put on the map that also sends a message of where you put the pin.


### 3. Navigation

<img src="http://g.recordit.co/MBYBGRzSNA.gif" width=200>


## Wireframes
[Add picture of your hand sketched wireframes in this section]
https://xd.adobe.com/view/19ed0d82-74f4-4759-8da0-d5602369c9fe-4cbe/?hints=off

### [BONUS] Digital Wireframes & Mockups
<img src="http://g.recordit.co/MBYBGRzSNA.gif" width=200>

### [BONUS] Interactive Prototype
https://xd.adobe.com/view/19ed0d82-74f4-4759-8da0-d5602369c9fe-4cbe/?hints=off

## Schema 

### Models

<img src="http://g.recordit.co/w3WXyeLRst.gif" width=600>


User
Property
Type
Description
userId
Number
unique id for the user
userName
String
Unique username for the user
groupInvitations
Array[Boolean]
Invitations to join group
profilePic
File
Profile picture for the user
password
String
Login password for the user
latitude
Number
Users last updated latitude
longitude
Number
Users last updated longitude
userGroups
Array[String]
A list of group ID




Group
Property
Type
Description
groupId
String
unique id for the group
groupName
String
Unique username for the user
groupPic
File
Profile picture for the group
password
String
Login password for the user
latitude
Number
Users last updated latitude
members
Array[UserID]
A list of userID
membersLongitude
Array[longitude]
A list of longitude parallel to members
membersLatitude
Array[latitude]
A list of latitude parallel to members




### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]

Login/Sign Up Screen
Get user logged-in information
 
User Profile
Update user profile image
Display user information
Create New Group
 
Group Screen
Fetch groupID
Display all the groups that the user is in
Add/Send Invite to userName
 
Group Setting Screen
TableViewCells of members in that group
Adding new member feature
 
Chat Screen
Get groupID
Get profile image
 
Map Screen
Update user location
Get the map’s pin location
Display other members’ locations
Send I’m Here notification

### Login/Sign-up Page

<img src="http://g.recordit.co/qemF3otHVa.gif" width=600>



