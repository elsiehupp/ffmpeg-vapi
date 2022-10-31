# `ffmpeg-vapi`: Vala Bindings for FFmpeg

[FFmpeg](https://ffmpeg.org/) is a collection of libraries and tools to process multimedia content such as audio, video, subtitles and related metadata.

This repository is an ongoing project to provide Vala bindings for FFmpeg. Due to my (Elsie Hupp's) somewhat dubious familiarity with both Vala and FFmpeg—I'm still learning!—significant deficiencies can be expected.

These bindings currently correspond with FFmpeg [4.2.7](https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/55a95339526ba3ad6c3c31721ab1ecfd957eb5b4).

## Known Limitations

As of yet, these bindings only target FFmpeg's `libcodec` and `libavutil`. Bindings for FFmpeg's other modules may be forthcoming, but they are not an immediate priority.

These bindings exclude most or all methods or features marked as "deprecated" by FFmpeg, on the assumption that any code using these bindings will have little need for legacy compatibility, as it will by necessity be new code due to the fact that the bindings themselves are new.

Many symbol names in these bindings will be heavily modified from their C counterparts in order to improve human readability. In general, these bindings will prefer natural English words to acronyms and other abbreviations. If you are already familiar enough with FFmpeg that these symbol renamings confuse you, apologies. For everyone else, the bindings include full documentation with updated symbol names, so no prior knowledge of FFmpeg or references to its documentation should be necessary.

## Maintainers

This binding is being developed by Elsie Hupp <<vala@elsiehupp.com>>. I do not currently have any relationship with the upstream maintainers of FFmpeg.

## Contributing

Feedback and contributions are welcome; you may contact me [via email](mailto:vala@elsiehupp.com) or [the Vala Discord server](https://discord.gg/YFAzjSVHt7), or, if you have a specific issue, by [filing an Issue here on GitHub](https://github.com/elsiehupp/ffmpeg-vapi/issues).

If you would like to take an active role in developing and maintaining this project, I will probably be happy to add you as a collaborator on this GitHub repository, as this arrangement is much more convenient than merging from a variety of forks.

## License

The license for `ffmpeg-vapi` corresponds with the license(s) of the underlying FFmpeg code: mainly LGPL with optional components licensed under the GPL. Please refer to the [LICENSE](https://github.com/elsiehupp/ffmpeg-vapi/blob/main/LICENSE.md) file for detailed information. (This LICENSE file is currently just a symbolic link to the LICENSE file in the FFmpeg Git submodule.)