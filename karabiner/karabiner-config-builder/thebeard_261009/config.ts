import { profile, setup } from "karabiner-config-builder";

import moonlander from "./moonlander.ts";
import internalKeyboard from "./internal-keyboard.ts";

export default setup(
    profile(
        {
            name: "Default",
            virtual_hid_keyboard: { keyboard_type_v2: "ansi" },
        },
        moonlander(),
        internalKeyboard(),
    ),
);
