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

export const moonlanderPtCommandBindingsLeft: Manipulator[] = [
    bind("1", key("f1"), { description: "Pro Tools Command: Shuffle mode" }),
    bind("2", key("f2"), { description: "Pro Tools Command: Slip mode" }),
    bind("3", key("f3"), { description: "Pro Tools Command: Spot mode" }),
    bind("4", key("f4"), { description: "Pro Tools Command: Grid mode" }),
    bind("5", key("f5"), { description: "Pro Tools Command: Zoom tool" }),

    bind("grave_accent_and_tilde", key(ctrl("down_arrow")), {
        description: "Pro Tools Command: Track size decrease",
    }),
    bind("tab", key(ctrl("up_arrow")), {
        description: "Pro Tools Command: Track size increase",
    }),
    bind(opt("grave_accent_and_tilde"), key(ctrl(opt("down_arrow"))), {
        description: "Pro Tools Command: Track size decrease all",
    }),
    bind(opt("tab"), key(ctrl(opt("up_arrow"))), {
        description: "Pro Tools Command: Track size increase all",
    }),

    bind("q", key(ctrl(cmd("left_arrow"))), {
        description: "Pro Tools Command: Track automation previous view",
    }),
    bind("w", key(ctrl(cmd("right_arrow"))), {
        description: "Pro Tools Command: Track automation next view",
    }),
    bind("e", key(opt(cmd("open_bracket"))), {
        description: "Pro Tools Command: Track waveform zoom out",
    }),
    bind("r", key(opt(cmd("close_bracket"))), {
        description: "Pro Tools Command: Track waveform zoom in",
    }),
    bind("t", key(ctrl(opt(cmd("open_bracket")))), {
        description: "Pro Tools Command: Track waveform zoom reset",
    }),

    bind("a", key(shift("r")), {
        description: "Pro Tools Command: Track record enable",
    }),
    bind("s", key(shift("i")), {
        description: "Pro Tools Command: Track input monitor enable",
    }),
    bind("d", key(shift("s")), {
        description: "Pro Tools Command: Track solo",
    }),
    bind("f", key(shift("m")), {
        description: "Pro Tools Command: Track mute",
    }),
    bind("g", key(shift("h")), {
        description: "Pro Tools Command: Track hide",
    }),
    bind(shift("g"), key(ctrl(shift("h"))), {
        description: "Pro Tools Command: Track hide & make inactive",
    }),

    bind(
        "z",
        soundflow("user:cmgnahvnh0002h7102o78pzro:cmgrmv3wc00052810lsj54wr0"),
        {
            description:
                "Pro Tools SF Command: Track set next available insert (search)",
        },
    ),
    bind(
        "x",
        soundflow("user:cmgnahvnh0002h7102o78pzro:cmgsmn3w30004j710d37l3rnz"),
        {
            description:
                "Pro Tools SF Command: Track set next available send (search)",
        },
    ),
    bind(
        "c",
        soundflow("user:cmgnahvnh0002h7102o78pzro:cmgt0498g000bj710qobtr8ly"),
        {
            description:
                "Pro Tools SF Command: Track set next available send pre-fader (search)",
        },
    ),
    bind(
        "v",
        soundflow("user:cmgnahvnh0002h7102o78pzro:cmgq36ukz000eq310s7zts3ze"),
        {
            description: "Pro Tools SF Command: Track set input (search)",
        },
    ),
    bind(
        "b",
        soundflow("user:cmgnahvnh0002h7102o78pzro:cmgq36zbz000gq31034m0h55l"),
        {
            description: "Pro Tools SF Command: Track set output (search)",
        },
    ),
];

export const moonlanderPtCommandBindingsRight: Manipulator[] = [
    bind("l", key(shift(cmd("l"))), {
        description: "Pro Tools Command: Toggle loop playback",
    }),
    bind(
        "p",
        soundflow("user:cmgnahvnh0002h7102o78pzro:cmk6koa540006ps23a2b09e83"),
        {
            description: "Pro Tools SF Command: Toggle punch/loop record",
        },
    ),

    bind("n", key(opt("f7")), {
        description: "Pro Tools Command: Toggle Bars|Beats & Mins|Secs",
    }),
];
