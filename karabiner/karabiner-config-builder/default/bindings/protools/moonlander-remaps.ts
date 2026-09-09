import {
    bind,
    key,
    hyper,
    ctrl,
    shift,
    opt,
    cmd,
    type GroupDefinition,
    group,
} from "karabiner-config-builder";

export default function (): GroupDefinition {
    return group(
        {
            description: "Pro Tools remaps [moonlander]",
        },

        bind("f17", key(ctrl("backslash")), {
            description: "Pro Tools Command: New playlist",
        }),
        bind("f20", key(ctrl("f2")), {
            description: "Pro Tools SF Command: Toggle Slip/Grid modes",
        }),
        bind("right_command", key("right_command"), {
            tapped: key(hyper("equal_sign")),
            description: "Pro Tools SF Command: Toggle mix window",
        }),
        bind("right_option", key("right_option"), {
            tapped: key(shift(opt(cmd("o")))),
            description:
                "Pro Tools SF Command: Open current session directory in Finder",
        }),
        bind("right_control", key("right_control"), {
            tapped: key(ctrl("keypad_7")),
            description: "Pro Tools SF Command: Toggle click mute",
        }),
    );
}
