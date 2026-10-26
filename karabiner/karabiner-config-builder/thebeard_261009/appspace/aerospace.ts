import { bind, aerospace, shift, opt, cmd, macro } from "karabiner-config-builder";

export default [
    bind("spacebar", aerospace("fullscreen")),
    bind("hyphen", macro(aerospace("fullscreen off"), aerospace("resize smart -200"))),
    bind("equal_sign", macro(aerospace("fullscreen off"), aerospace("resize smart +200"))),

    bind("semicolon", aerospace("layout tiles horizontal vertical")),
    bind(opt("semicolon"), aerospace("layout accordion horizontal vertical")),
    bind(cmd("semicolon"), aerospace("layout floating tiling")),

    bind("return_or_enter", aerospace("move-workspace-to-monitor --wrap-around next")),
    bind("tab", aerospace("workspace-back-and-forth")),

    bind("left_arrow", aerospace("focus left")),
    bind("down_arrow", aerospace("focus down")),
    bind("up_arrow", aerospace("focus up")),
    bind("right_arrow", aerospace("focus right")),

    bind(cmd("left_arrow"), aerospace("move left")),
    bind(cmd("down_arrow"), aerospace("move down")),
    bind(cmd("up_arrow"), aerospace("move up")),
    bind(cmd("right_arrow"), aerospace("move right")),

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

    bind(shift("quote"), aerospace("move-node-to-workspace --focus-follows-window ex")),
    bind(shift("0"), aerospace("move-node-to-workspace --focus-follows-window 0")),
    bind(shift("1"), aerospace("move-node-to-workspace --focus-follows-window 1")),
    bind(shift("2"), aerospace("move-node-to-workspace --focus-follows-window 2")),
    bind(shift("3"), aerospace("move-node-to-workspace --focus-follows-window 3")),
    bind(shift("4"), aerospace("move-node-to-workspace --focus-follows-window 4")),
    bind(shift("5"), aerospace("move-node-to-workspace --focus-follows-window 5")),
    bind(shift("6"), aerospace("move-node-to-workspace --focus-follows-window 6")),
    bind(shift("7"), aerospace("move-node-to-workspace --focus-follows-window 7")),
    bind(shift("8"), aerospace("move-node-to-workspace --focus-follows-window 8")),
    bind(shift("9"), aerospace("move-node-to-workspace --focus-follows-window 9")),
];
