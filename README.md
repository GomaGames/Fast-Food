# Fast-Food
Thanksgiving 2015 game project


### Installing dependencies

1. Install haxe 3.2.0
1. Install OpenFL
    - `haxelib install openfl`
    - `haxelib run openfl setup`
1. Install HaxeFlixel
    - `haxelib install flixel`

test that everything is working

`lime test neko`


### Using vim

Install [vaxe](https://github.com/jdonaldson/vaxe)

```
'' Haxe Plugin
Plug 'jdonaldson/vaxe'
```

When opening the project, it should ask you for a target, choose mac 64 bit (selection *19*)

or enter the `:LimeTarget` command to choose the target. 'mac -neko -64'

```
:LimeTarget
Select Lime Target
1 android : Create Google Android applications
2 android -arm7 : Compile for arm-7a and arm5
3 android -arm7-only : Compile for arm-7a for testing
4 blackberry : Create BlackBerry applications
5 blackberry -simulator : Build/test for the device simulator
6 flash : Create SWF applications for Adobe Flash Player
7 html5 : Create HTML5 canvas applications
8 html5 -minify : Minify output using the Google Closure compiler
9 html5 -minify -yui : Minify output using the YUI compressor
10 ios : Create Apple iOS applications
11 ios -simulator : Build/test for the device simulator
12 ios -simulator -ipad : Build/test for the iPad Simulator
13 linux : Create Linux applications
14 linux -64 : Compile for 64-bit instead of 32-bit
15 linux -neko : Build with Neko instead of C++
16 linux -neko -64 : Build with Neko 64-bit instead of C++
17 mac : Create Apple Mac OS X applications
18 mac -neko : Build with Neko instead of C++
19 mac -neko -64 : Build with Neko 64-bit instead of C++
20 webos : Create HP webOS applications
21 windows : Create Microsoft Windows applications
22 windows -neko : Build with Neko instead of C++
23 windows -neko -64 : Build with Neko 64-bit instead of C++
Type number and <Enter> or click with mouse (empty cancels):

```

to build and test on the selected target, run the command `:make`


## Using Sublime Text

_TODO_


## HaxeFlixel

[HaxeFlixel Handbook](http://haxeflixel.com/documentation/haxeflixel-handbook/)
