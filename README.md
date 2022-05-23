# Archived? Or not? #
At current time, not. I've decided to unarchive this repository because I've examined Lua about memory leaks (Relly, that's is not problem for this) more and have talked with smart people about strings conversion. Finally, I could rewrite the wrapper  and now it works ideally.
Anyway, I don't know what may I propose more, so it final wrapper version and it still might serve as an example of Alien library interractions.

# TolkLua #
TolkLua is a Lua wrapper for [Tolk library](https://github.com/dkager/tolk). Here is fully provided all API of.
## Please note ##
TolkLua uses [Alien library](https://github.com/mascarenhas/alien) for loading main Tolk dynamic library, so you have to Alien be installed in your Lua distributive.

## Dependencies ##
+ [Lua any version](https://lua.org)
+ [Alien](https://github.com/mascarenhas/alien)
+ [Tolk](https://github.com/dkager/tolk)

## Installation ##
+ Place the Tolk DLLS either into your project directory or into Lua distributive binaries directory.
+ Place the wrapper body either into your project directory or into your Lua distributive directory where Lua searches the modules (see at package.path).

## Usage ##
The wrapper provides all API functions presented in Tolk library. All types converts to appropriated native, so you not have to convert it by itself.
### Including the Tolk using TolkLua wrapper ###
When you include the wrapper it returns the table with all methods without "Tolk_" prefix.
```lua
tolk = require "tolk"
tolk.Load()
```
  ### Using the Tolk library through the TolkLua Wrapper ###
As I said above, all types converts into native type both one way and the other.
```lua
tolk.IsLoaded()
  > true
tolk.Output("This is a test", true)
```
You don't need to do any manipulations with returning and passing strings.
```lua
tolk.DetectScreenReader()
  > NVDA
tolk.Speak("This is a test", true)
```
If you need to call a function without the wrapper convertations, you may call the subtable <em>raw</em> in main table. There you have to call a function as it is.
```lua
tolk.raw.Tolk_Load()
tolk.raw.Tolk_IsLoaded()
  > 1 -- The Alien library doesn't supports the boolean type, so it returns as int because boolean type C uses as integer representation.
  ```
  The TolkLua supports also IUP values.
  ```lua
  myCheck = iup.toggle{title="Test checkbox"}
  print(myCheck.value)
    > OFF
tolk.PreferSAPI(myCheck.value)
-- The method will convert this value to appropriate one correctly i.e. "ON"=true, "OFF"=false.
-- In this case PreferSAPI will be disabled.
```
## Tests ##
I am gonna replenish the tests examples where you can look how it works and how it can be used. Please look at "test" directory and explore the interesting one.
<em>Please note:</em> if you would run these test examples, you have to either place the tolk content and wrapper to main Lua distributive directory or place it at the tests directory before run each of (see the installation section).
## License ##
This wrapper obeys under Tolk library license. Please look it at main Tolk repository.
