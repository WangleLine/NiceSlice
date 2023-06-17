### NiceSlice
An extended nine-slice library for Gamemaker.

In version 2.3.2, Gamemaker introduced a feature called *nine-slice*,
which allows the user to easily create visual elements that scale to various sizes without distortion.

This is done by scaling, tiling, or otherwise transforming only the connecting pieces of a sprite element, but keeping corners unchanged.

<img
  src="https://i.imgur.com/DKphaUv.png"
  alt="Alt text"
  title="Optional title"
  style="display: inline-block; margin: 0 auto; width: 320px">

However, Gamemaker's native nine-slice feature does not allow the user to change the internal scale of a nine-sliced sprite,
which is bad news for anyone trying to, say, render scaled-up pixelart UI elements.
 
I was so bothered by this, I made a library.

[Internal Scale Example](https://github.com/YoYoGames/GameMaker-Feature-Requests/assets/34343336/45c7e8dc-7733-4f12-b736-2f9ae18c8e57)
 
~ Line
