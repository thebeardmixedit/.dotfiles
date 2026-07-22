import {
    setup,
    profile,
    group,
    layer,
    inApp,
    fromDevice,
    key,
    exceptFromDevice,
    bind,
    none,
    exceptInApp,
    ctrl,
    hyper,
    shift,
    opt,
    cmd,
    shell,
} from "karabiner-config-builder";

import aerospaceBindings from "./bindings/aerospace.ts";
import appBindings from "./bindings/apps.ts";
import finderBindings from "./bindings/finder.ts";
import {
    normalPtMarkerBindings,
    moonlanderPtMarkerBindings,
} from "./bindings/protools/markers.ts";
import {
    moonlanderPtCommandBindingsLeft,
    moonlanderPtCommandBindingsRight,
} from "./bindings/protools/commands.ts";

export default setup({
    global: {
        show_in_menu_bar: false,
    },
    profiles: [
        profile(
            {
                name: "Main",
                virtual_hid_keyboard: { keyboard_type_v2: "ansi" },
            },

            group(
                {
                    description: "Moonlander group",
                    conditions: [
                        fromDevice({
                            is_keyboard: true,
                            product_id: 6505,
                            vendor_id: 12951,
                        }),
                    ],
                },
                layer("appspace", {
                    trigger: "grave_accent_and_tilde",
                    tapped: key("grave_accent_and_tilde"),
                    block: true,
                    tapTimeoutMs: 150,
                    bindings: [...aerospaceBindings, ...appBindings],
                }),

                group(
                    {
                        description: "Global disable app specific command keys",
                        conditions: [exceptInApp("com.avid.ProTools")],
                    },
                    bind("f16", none()),
                    bind("f17", none()),
                    bind("f18", none()),
                    bind("f19", none()),
                    bind("f20", none()),
                ),

                group(
                    {
                        description: "Pro Tools app specific command keys",
                        conditions: [inApp("com.avid.ProTools")],
                    },
                    layer("moonlander-pt-markers", {
                        trigger: "f19",
                        tapped: key("keypad_enter"),
                        block: true,
                        tapTimeoutMs: 150,
                        bindings: moonlanderPtMarkerBindings,
                    }),

                    layer("moonlander-pt-commands", {
                        trigger: "f16",
                        tapped: key("f16"),
                        block: true,
                        tapTimeoutMs: 150,
                        bindings: [
                            ...moonlanderPtCommandBindingsLeft,
                            ...moonlanderPtCommandBindingsRight,
                        ],
                    }),

                    bind("f17", key(ctrl("backslash")), {
                        description: "Pro Tools Command: New playlist",
                    }),
                    bind("f20", key(ctrl("f2")), {
                        description:
                            "Pro Tools SF Command: Toggle Slip/Grid modes",
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
                ),
            ),

            group(
                {
                    description: "Normal group",
                    conditions: [
                        exceptFromDevice({
                            is_keyboard: true,
                            product_id: 6505,
                            vendor_id: 12951,
                        }),
                    ],
                },
                layer("appspace", {
                    trigger: "caps_lock",
                    tapped: key("caps_lock"),
                    block: true,
                    tapTimeoutMs: 150,
                    bindings: [...aerospaceBindings, ...appBindings],
                }),
                group(
                    {
                        description: "Pro Tools app specific command keys",
                        conditions: [inApp("com.avid.ProTools")],
                    },
                    layer("normal-pt-markers", {
                        trigger: "backslash",
                        tapped: key("backslash"),
                        tapTimeoutMs: 150,
                        bindings: normalPtMarkerBindings,
                    }),
                ),
            ),

            group(
                {
                    description: "Finder Tools",
                    conditions: [inApp("com.apple.finder")],
                },
                [...finderBindings],
            ),
        ),
    ],
});
