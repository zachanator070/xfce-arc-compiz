# xfce-arc-compiz
I figured after taking all the effort to make my desktop look nice, perhaps others would want to do the same without the hastle 
that I went through to figure out all the dependancies and tricks to get things working together.

## Components
* [Arc GTK 3 Theme](https://github.com/horst3180/arc-theme.git)
* [Arc GTK 3 Icons](https://github.com/horst3180/arc-icon-theme.git)
* [Compiz](http://www.compiz.org/)

## Requirements
* Xubuntu 16.04

## Installation
```
./arc.sh
```
Run CompizConfig Settings Manager (```ccsm```) and be sure to enable these plugins:
* Commands
* Composite
* OpenGL
* Window Decoration
* Compiz Library Toolbox
* Regex Matching

NOTE: If you want the themes but do not want compiz, change line 12 of ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml to 
```
<value type="string" value="xfwm4"/>
```

## Uninstall
```
./uninstall.sh
```
NOTE: This removes all components installed on your machine and reverts dconf attributes to defaults. The only remaining files
are those found in this git repository.
