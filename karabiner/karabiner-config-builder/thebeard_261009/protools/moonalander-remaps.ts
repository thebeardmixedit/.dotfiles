import {
    group,
    fromDevice,
    bind,
    key,
    hyper,
    ctrl,
    shift,
    opt,
    cmd,
    type GroupDefinition,
    type Manipulator,
} from "karabiner-config-builder";

export function moonlanderRemaps(): GroupDefinition {
    return group(
        {
            description: "Pro Tools remaps [moonlander]",
            conditions: [
                fromDevice({
                    is_keyboard: true,
                    product_id: 6505,
                    vendor_id: 12951,
                }),
            ],
        },

        bind("f18", key(ctrl("backslash")), {
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
            description: "Pro Tools SF Command: Open current session directory in Finder",
        }),
        bind("right_control", key("right_control"), {
            tapped: key(ctrl("keypad_7")),
            description: "Pro Tools SF Command: Toggle click mute",
        }),
    );
}

export function moonlanderMarkerBindings(): Manipulator[] {
    return [
        bind("comma", key(opt(cmd("left_arrow"))), {
            description: "Pro Tools Marker: Go to previous",
        }),
        bind("period", key(opt(cmd("right_arrow"))), {
            description: "Pro Tools Marker: Go to next",
        }),
        bind(shift("comma"), key(shift(opt(cmd("left_arrow")))), {
            description: "Pro Tools Marker: Go to previous",
        }),
        bind(shift("period"), key(shift(opt(cmd("right_arrow")))), {
            description: "Pro Tools Marker: Go to next",
        }),
        bind("slash", key(cmd("keypad_5")), {
            description: "Pro Tools Marker: Open Marker Window",
        }),
    ];
}
