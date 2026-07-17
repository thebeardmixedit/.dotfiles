import { bind, aerospace, opt, cmd, macro } from "karabiner-config-builder";

export default [
    bind("spacebar", aerospace("fullscreen")),
    bind(
        "hyphen",
        macro(aerospace("fullscreen off"), aerospace("resize smart -200")),
    ),
    bind(
        "equal_sign",
        macro(aerospace("fullscreen off"), aerospace("resize smart +200")),
    ),

    bind("semicolon", aerospace("layout tiles horizontal vertical")),
    bind(opt("semicolon"), aerospace("layout accordion horizontal vertical")),
    bind(cmd("semicolon"), aerospace("layout floating tiling")),

    bind(
        "return_or_enter",
        aerospace("move-workspace-to-monitor --wrap-around next"),
    ),

    bind(opt("h"), aerospace("focus left")),
    bind(opt("j"), aerospace("focus down")),
    bind(opt("k"), aerospace("focus up")),
    bind(opt("l"), aerospace("focus right")),

    bind(cmd("h"), aerospace("move left")),
    bind(cmd("j"), aerospace("move down")),
    bind(cmd("k"), aerospace("move up")),
    bind(cmd("l"), aerospace("move right")),

    bind("quote", aerospace("workspace ex")),
    bind("0", aerospace("workspace 0")),
    bind("1", aerospace("workspace 1")),
    bind("2", aerospace("workspace 2")),
    bind("3", aerospace("workspace 3")),
    bind("4", aerospace("workspace 4")),
    bind("5", aerospace("workspace 5")),
    bind("6", aerospace("workspace 6")),
    bind("7", aerospace("workspace 7")),
    bind("8", aerospace("workspace 8")),
    bind("9", aerospace("workspace 9")),

    bind(
        cmd("quote"),
        aerospace("move-node-to-workspace --focus-follows-window ex"),
    ),
    bind(
        cmd("0"),
        aerospace("move-node-to-workspace --focus-follows-window 0"),
    ),
    bind(
        cmd("1"),
        aerospace("move-node-to-workspace --focus-follows-window 1"),
    ),
    bind(
        cmd("2"),
        aerospace("move-node-to-workspace --focus-follows-window 2"),
    ),
    bind(
        cmd("3"),
        aerospace("move-node-to-workspace --focus-follows-window 3"),
    ),
    bind(
        cmd("4"),
        aerospace("move-node-to-workspace --focus-follows-window 4"),
    ),
    bind(
        cmd("5"),
        aerospace("move-node-to-workspace --focus-follows-window 5"),
    ),
    bind(
        cmd("6"),
        aerospace("move-node-to-workspace --focus-follows-window 6"),
    ),
    bind(
        cmd("7"),
        aerospace("move-node-to-workspace --focus-follows-window 7"),
    ),
    bind(
        cmd("8"),
        aerospace("move-node-to-workspace --focus-follows-window 8"),
    ),
    bind(
        cmd("9"),
        aerospace("move-node-to-workspace --focus-follows-window 9"),
    ),
];
