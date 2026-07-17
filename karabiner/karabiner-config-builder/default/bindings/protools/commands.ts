import {
    type Manipulator,
    bind,
    shift,
    ctrl,
    opt,
    cmd,
    key,
    macro,
    soundflow,
} from "karabiner-config-builder";

export const moonlanderPtCommandBindings: Manipulator[] = [
    bind("open_bracket", key(ctrl("down_arrow")), {
        description: "Pro Tools Command: Track size decrease",
    }),
    bind("hyphen", key(ctrl("up_arrow")), {
        description: "Pro Tools Command: Track size increase",
    }),
];
