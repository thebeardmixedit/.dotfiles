import { aerospace, bind, cmd, script, shift } from "karabiner-config-builder";

const focusAppspace = "~/.dotfiles/bin/focus-appspace";
const focusSfspace = "~/.dotfiles/bin/focus-sfspace";

export default [
    bind(
        "f",
        script(focusAppspace, {
            args: [
                "com.apple.finder",
                "fd",
                `osascript -e 'tell application "Finder" to make new Finder window to folder (path to home folder as text)'`,
            ],
        }),
    ),
    bind(
        cmd("f"),
        aerospace("move-node-to-workspace --focus-follows-window fd"),
    ),
    bind(
        "u",
        script(focusAppspace, {
            args: ["com.uaudio.console3", "ua"],
        }),
    ),
    bind(
        cmd("u"),
        aerospace("move-node-to-workspace --focus-follows-window ua"),
    ),
    bind(
        "p",
        script(focusAppspace, {
            args: ["com.avid.ProTools", "pt"],
        }),
    ),
    bind(
        cmd("p"),
        aerospace("move-node-to-workspace --focus-follows-window pt"),
    ),
    bind(
        "l",
        script(focusAppspace, {
            args: ["com.apple.logic10", "lg"],
        }),
    ),
    bind(
        cmd("l"),
        aerospace("move-node-to-workspace --focus-follows-window lg"),
    ),
    bind(
        "a",
        script(focusAppspace, {
            args: ["com.ableton.live", "ab"],
        }),
    ),
    bind(
        cmd("a"),
        aerospace("move-node-to-workspace --focus-follows-window ab"),
    ),
    bind(
        "t",
        script(focusAppspace, {
            args: ["com.mitchellh.ghostty", "tm"],
        }),
    ),
    bind(
        cmd("t"),
        aerospace("move-node-to-workspace --focus-follows-window tm"),
    ),
    bind(
        "b",
        script(focusAppspace, {
            args: [
                "com.brave.Browser",
                "br",
                'open -na "Brave Browser" --args --new-window',
            ],
        }),
    ),
    bind(
        cmd("b"),
        aerospace("move-node-to-workspace --focus-follows-window br"),
    ),
    bind(
        "m",
        script(focusAppspace, {
            args: ["com.apple.MobileSMS", "ms"],
        }),
    ),
    bind(
        cmd("m"),
        aerospace("move-node-to-workspace --focus-follows-window ms"),
    ),
    bind(shift("m"), script(focusAppspace, { args: ["com.apple.mail", "ml"] })),
    bind(
        shift(cmd("m")),
        aerospace("move-node-to-workspace --focus-follows-window ml"),
    ),
    bind(
        "y",
        script(focusAppspace, {
            args: [
                "com.brave.Browser.app.agimnkijcaahngcdmfeangaknmldooml",
                "yt",
            ],
        }),
    ),
    bind(
        cmd("y"),
        aerospace("move-node-to-workspace --focus-follows-window yt"),
    ),
    bind("z", script(focusAppspace, { args: ["us.zoom.xos", "zm"] })),
    bind(
        cmd("z"),
        aerospace("move-node-to-workspace --focus-follows-window zm"),
    ),
    bind("c", script(focusAppspace, { args: ["com.apple.iCal", "ca"] })),
    bind(
        cmd("c"),
        aerospace("move-node-to-workspace --focus-follows-window ca"),
    ),
    bind("r", script(focusAppspace, { args: ["com.apple.reminders", "rm"] })),
    bind(
        cmd("r"),
        aerospace("move-node-to-workspace --focus-follows-window rm"),
    ),
    bind(
        "n",
        script(focusAppspace, {
            args: ["com.apple.Notes", "nt"],
        }),
    ),
    bind(
        cmd("n"),
        aerospace("move-node-to-workspace --focus-follows-window nt"),
    ),
    bind(
        shift("s"),
        script(focusAppspace, { args: ["com.spotify.client", "sp"] }),
    ),
    bind(
        shift(cmd("s")),
        aerospace("move-node-to-workspace --focus-follows-window sp"),
    ),
    bind("g", script(focusAppspace, { args: ["com.openai.chat", "ai"] })),
    bind(
        cmd("g"),
        aerospace("move-node-to-workspace --focus-follows-window ai"),
    ),
    bind(
        shift("a"),
        script(focusAppspace, {
            args: ["com.apple.audio.AudioMIDISetup", "am"],
        }),
    ),
    bind(
        shift(cmd("a")),
        aerospace("move-node-to-workspace --focus-follows-window am"),
    ),
    bind("i", script(focusAppspace, { args: ["com.adobe.illustrator", "il"] })),
    bind(
        cmd("i"),
        aerospace("move-node-to-workspace --focus-follows-window il"),
    ),
    bind("s", script(focusSfspace)),
    bind(
        cmd("s"),
        aerospace("move-node-to-workspace --focus-follows-window sf"),
    ),
    bind(
        "k",
        script(focusAppspace, {
            args: ["org.pqrs.Karabiner-Elements.Settings", "kr"],
        }),
    ),
    bind(
        cmd("k"),
        aerospace("move-node-to-workspace --focus-follows-window kr"),
    ),
];
