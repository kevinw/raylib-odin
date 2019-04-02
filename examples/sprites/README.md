# Live Reload Example

![a screenshot of the live reload demo](../../resources/screenshots/example_live_reload.png)

## `host.odin`

This is the "harness" that contains the `main` proc that stays running while you iterate on the game.

## `game.odin`

This is the "plugin" code that gets recompiled and reloaded by the host harness.

## `plugin`

A small library providing the live-reload/plugin functionality.
