# Mac App Icon Customizer

*Copyright 2021 Caleb Evans*  
*Released under the MIT license*

This project is a collection of scripts for customizing your Mac application
icons, individually or in bulk. At the time, this tool does **not** support
Apple's official Mac applications; only third-party apps (either from the Mac
App Store, or downloaded elsewhere) are supported.

## Usage

### 1. Clone the repository

First, clone the repository to a folder of your choosing.

```
git clone https://github.com/elrumo/macOS_Big_Sur_icons_replacements.git
```

### 2. Download icons

The next step is to download the icons of your liking from
https://macosicons.com/. Name each downloaded icns according to the _exact_ name
of your application in the _Applications_ folder. Create a dedicated folder to
store them all, perhaps a folder named after the theme you have in mind.

For instance, an example file tree could look like this:

```
- big-sur-icon-set/
  - Atom.icns
  - Microsoft To Do.icns
  - Slack.icns
  - zoom.us.icns
```

## 3. Run the scripts

Finally, `cd` to the app-icon-customizer repository folder that you cloned down.
There are a few scripts in here for you to use as needed:

### set-app-icons.sh

The `set-app-icons.sh` script accepts one or more arguments, which can either 

#### Examples

```
./set-app-icons.sh ~/Documents/big-sur-icon-set
./set-app-icons.sh ~/Documents/big-sur-icon-set/*.icns
./set-app-icons.sh ~/Documents/big-sur-icon-set/Atom.icns
```

```
./set-app-icons.sh ~/Documents/big-sur-icon-set/*.icns
```

```
./set-app-icons.sh ~/Documents/big-sur-icon-set/Atom.icns
```

```
./set-app-icons.sh ~/Documents/big-sur-icon-set/Atom.icns ~/Documents/big-sur-icon-set/Slack.icns
```

### reset-app-icons.sh

If you are experimenting with different icons, and would like to start over at
any point, you can restore any application icon to its original state via the
`reset-app-icons.sh` script.

The syntax is the same as `set-app-icons.sh`, where one or more files or
directories are acceptable as input.

#### Examples

```
./reset-app-icons.sh ~/Documents/big-sur-icon-set
./reset-app-icons.sh ~/Documents/big-sur-icon-set/*.icns
./reset-app-icons.sh ~/Documents/big-sur-icon-set/Atom.icns
```

```
./reset-app-icons.sh ~/Documents/big-sur-icon-set/*.icns
```

```
./reset-app-icons.sh ~/Documents/big-sur-icon-set/Atom.icns
```

```
./reset-app-icons.sh ~/Documents/big-sur-icon-set/Atom.icns ~/Documents/big-sur-icon-set/Slack.icns
```
