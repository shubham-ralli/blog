---
layout: post
title: "The math behind 3.5 x 4.5 cm in pixels"
date: 2026-10-05 11:59:20 +0530
permalink: /3-5x4-5-cm-in-pixels/
description: "Where 413 x 531 comes from, why I hardcoded it into the passport photo resizer, and the cm to pixel formula at 300 DPI."
canonical_url: "https://pixellize.io/blog/3-5cm-x-4-5cm-photo-size-in-pixels"
---

When we built the passport photo resizer, one number got hardcoded: **413 x 531**. People kept asking where it comes from, so here is the short version, with the math.

## The conversion

Pixels are not centimeters. They depend on DPI, the dots printed per inch. The formula is just:

```
pixels = cm / 2.54 * dpi
```

For a 3.5 x 4.5 cm photo at 300 DPI:

```
width  = 3.5 / 2.54 * 300 = 413 px
height = 4.5 / 2.54 * 300 = 531 px
```

So 3.5 x 4.5 cm is **413 x 531 px** at 300 DPI. And 35 x 45 mm is the same size, just different units.

![The resizer with a photo in the 3.5 x 4.5 cm frame at 413 by 531 pixels]({{ '/assets/img/px-editor.webp' | relative_url }})

## Why 300 DPI

Change the DPI and the pixel count changes with it:

| DPI | Pixels | Use |
|-----|--------|-----|
| 300 | 413 x 531 | print, passport, visa, forms |
| 96  | 132 x 170 | on-screen only |
| 72  | 99 x 128  | legacy screen |

Official photos get printed onto ID cards, so 300 DPI keeps the face sharp. A screen-size 132 x 170 image looks fine in a browser and turns soft on the printed card. That mismatch is behind a lot of rejected uploads.

![Print at 300 DPI is 413 by 531 pixels, screen at 96 DPI is 132 by 170]({{ '/assets/img/px-dpi.webp' | relative_url }})

## Why I hardcoded it instead of exposing DPI

Most people searching this just need the number. Exposing DPI as a setting would have added a decision, and a wrong one causes a rejection. So the tool ships locked to 413 x 531 at 300 DPI, the value that works for passport, visa, PAN, and exam forms. You position the face, set the file size in KB, and download. No unit math on your side.

If you want to skip the math entirely, the tool is here: [3.5 x 4.5 cm resizer](https://pixellize.io/resize-image-to-3-5cmx4-5cm). The full writeup with the complete size table lives on the [Pixellize blog](https://pixellize.io/blog/3-5cm-x-4-5cm-photo-size-in-pixels).
