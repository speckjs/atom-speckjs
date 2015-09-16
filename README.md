![Build Status](https://travis-ci.org/speckjs/atom-speckjs.svg?branch=master)

# SpeckJS for Atom

## About
SpeckJS is an npm module that parses JavaScript and outputs unit-tests. SpeckJS currently supports the [Tape](https://github.com/substack/tape), [Jasmine](https://github.com/jasmine/jasmine), and [Mocha](https://github.com/mochajs/mocha)/[Chai](https://github.com/chaijs/chai) testing frameworks. Along with our Atom plugin, we have plugins available for [Grunt](https://github.com/speckjs/grunt-speckjs), [Gulp](https://github.com/speckjs/gulp-speckjs), as well as a [standalone npm package](https://github.com/speckjs/speckjs).

Our goal with SpeckJS is to make it as easy as possible to get started using Test-Driven Development on a new project, to quickly add unit-tests to your existing project, or anywhere in between. We know the value of well-tested code, and SpeckJS is here to make that simpler than ever.

## How to Use

### Installation
Open Atom's Settings and navigate to the `Install` view.

For easy access, use Atom's command palette: `cmd-shift-p` (OSX) or `ctrl-shift-p` (Linux/Windows)
and search for `Settings View: Install Packages and Themes`.

In the text field under `Install Packages`, make sure the `Packages` tab is selected.
Now, simply search for `speckjs`, click `install`, and you're all set!

<!-- ONCE NEW TAG LINE HAS BEEN UPDATED, INSERT GIF OF "INSTALL PACKAGE" -> SEARCH "speckjs" -> CLICK INSTALL -->


### Creating a SpeckJS Comment
The first line of a SpeckJS comment is the `title`, describing your test block.
```
// test > sum function
```

Next, use SpeckJS' domain-specific language (DSL) to create an assertion of what you wish to test. Here's the format of the DSL:
```
// # <actual> <assertion-type> <expected> (<description>)
```

You can add as many (or as few) assertions as you'd like.
```
// # sum(1, 2) == 3 (returns the sum of both params)
// # sum(3, 4) == 7 (returns the sum of both params)
```

That's it! Here's a complete SpeckJS comment for the simple sum function:
```
// test > sum function
// # sum(1, 2) == 3 (returns the sum of both params)
// # sum(3, 4) == 7 (returns the sum of both params)
```

Comments can also be written using block style comments:
```
/*
test > sum function
# sum(1, 2) == 3 (returns the sum of both params)
# sum(3, 4) == 7 (returns the sum of both params)
*/
```

### Using the Plugin
We offer several easy ways to use SpeckJS in Atom.

* From Atom's Command Palette, enter `Speckjs:Build`
![From Command Palette](http://i.imgur.com/eBoLu2N.gif)

* From the Menu Bar, select Packages > SpeckJS > Build
![From Menu](http://i.imgur.com/oXt5cxB.gif)

* Use the hotkey: `ctrl-alt-s`

### Changing the Test Framework
By default, SpeckJS will build your test files using the Tape framework, but you can change this in the options.
Here, we'll update our settings to build Jasmine tests, instead:

![From Menu](http://i.imgur.com/4HoHsxn.gif)

### Supported Assertion Types
These are the assertion types currently supported, and you can extend this list to include others in [`parsing/comment-conversion.js`](https://github.com/speckjs/speckjs/blob/master/parsing/comment-conversion.js).
```
==   : equal
===  : deep equal
!==  : not equal
!=== : not deep equal
```

## Support
SpeckJS is also available as a plugin for the following platforms:

[Grunt](https://github.com/speckjs/grunt-speckjs)

[Gulp](https://github.com/speckjs/gulp-speckjs)
