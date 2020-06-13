## [1.2.0] - 2020-06-13

- Implemented new animation logic using Animated Builder
    - More performant approach as flutter engine handles the color animation transition.
    - Colors now gradually transit from each other instead of instant transition.
    - No updation of state.
    - Colors now match the google color accents.
    - Refactored code.

-  Upstreamed changes from flutter
    - Enable configuring minHeight for LinearProgressIndicator and update default to match spec
      https://github.com/flutter/flutter/commit/fc77aea34eec02f3625863614a96148de93c0649

    - Make CircularProgressIndicator's animation match native
      https://github.com/flutter/flutter/commit/e5bd2b3d556ab393e93167070edefe11122c5d39

## [1.1.0] - 2020-05-04

- Added ColoredRefreshIndicator and a modified refresh progress indicator from flutter's source.
- Updated example app.

## [1.0.1] - 2020-04-25

- Added example app.

## [1.0.0] - 2020-04-25

- Initial release.
