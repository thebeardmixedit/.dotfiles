import {
    setup,
    profile,
    group,
    inApp,
    bind,
    key,
} from "karabiner-config-builder";
import moonlander from "./moonlander.ts";
import internal from "./internal.ts";

import finderBindings from "./bindings/finder.ts";

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
            moonlander(),
            internal(),
            group(
                {
                    description: "Finder Tools",
                    conditions: [inApp("com.apple.finder")],
                },
                [...finderBindings],
            ),
            group(
                {
                    description: "Globals",
                },
                bind("f", key("left_shift"), { tapped: key("f") }),
                bind("j", key("right_shift"), { tapped: key("j") }),
            ),
        ),
    ],
});
