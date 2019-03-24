# odin-raylib

Bindings for [raylib](http://www.raylib.com), a small C gamedev library, for the [odin programming language](https://odin.handmade.network/).

These are usable, but in a pre-alpha state and definitely a work in progress.

## Live-reloading

The library is setup to enable a live-reload harness.

![live reload example](Docs/live-reload.gif)

## TODO

- improve enums and int/int32 situation so the API doesn't need as much explicit casting
- clean up naming of bridge/host
- (maybe) implement a file watcher so that the live reload stuff doesn't need an external dependency like watchman
- fix up bindgen code so that raylib.h doesn't need to be hand-tweaked
