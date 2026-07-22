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

export const moonlanderPtMarkerBindings: Manipulator[] = [
    bind("n", key(opt(cmd("left_arrow"))), {
        description: "Pro Tools Marker: Go to previous",
    }),
    bind("m", key(opt(cmd("right_arrow"))), {
        description: "Pro Tools Marker: Go to next",
    }),
    bind("comma", key(cmd("keypad_5")), {
        description: "Pro Tools Marker: Open Marker Window",
    }),

    bind(
        "1",
        macro(key("keypad_period"), key("keypad_1"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 1" },
    ),
    bind(
        "2",
        macro(key("keypad_period"), key("keypad_2"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 2" },
    ),
    bind(
        "3",
        macro(key("keypad_period"), key("keypad_3"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 3" },
    ),
    bind(
        "4",
        macro(key("keypad_period"), key("keypad_4"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 4" },
    ),
    bind(
        "5",
        macro(key("keypad_period"), key("keypad_5"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 5" },
    ),
    bind(
        "6",
        macro(key("keypad_period"), key("keypad_6"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 6" },
    ),
    bind(
        "7",
        macro(key("keypad_period"), key("keypad_7"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 7" },
    ),
    bind(
        "8",
        macro(key("keypad_period"), key("keypad_8"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 8" },
    ),
    bind(
        "9",
        macro(key("keypad_period"), key("keypad_9"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 9" },
    ),
    bind(
        "0",
        macro(key("keypad_period"), key("keypad_10"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 10" },
    ),

    bind(
        "q",
        macro(key("keypad_period"), key("keypad_11"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 11" },
    ),
    bind(
        "w",
        macro(key("keypad_period"), key("keypad_12"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 12" },
    ),
    bind(
        "e",
        macro(key("keypad_period"), key("keypad_13"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 13" },
    ),
    bind(
        "r",
        macro(key("keypad_period"), key("keypad_14"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 14" },
    ),
    bind(
        "t",
        macro(key("keypad_period"), key("keypad_15"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 15" },
    ),
    bind(
        "y",
        macro(key("keypad_period"), key("keypad_16"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 16" },
    ),
    bind(
        "u",
        macro(key("keypad_period"), key("keypad_17"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 17" },
    ),
    bind(
        "i",
        macro(key("keypad_period"), key("keypad_18"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 18" },
    ),
    bind(
        "o",
        macro(key("keypad_period"), key("keypad_19"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 19" },
    ),
    bind(
        ";",
        macro(key("keypad_period"), key("keypad_20"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 20" },
    ),

    bind(
        shift("1"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_1")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 1" },
    ),
    bind(
        shift("2"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_2")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 2" },
    ),
    bind(
        shift("3"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_3")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 3" },
    ),
    bind(
        shift("4"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_4")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 4" },
    ),
    bind(
        shift("5"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_5")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 5" },
    ),
    bind(
        shift("6"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_6")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 6" },
    ),
    bind(
        shift("7"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_7")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 7" },
    ),
    bind(
        shift("8"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_8")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 8" },
    ),
    bind(
        shift("9"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_9")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 9" },
    ),
    bind(
        shift("0"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_10")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 10" },
    ),

    bind(
        shift("q"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_11")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 11" },
    ),
    bind(
        shift("w"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_12")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 12" },
    ),
    bind(
        shift("e"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_13")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 13" },
    ),
    bind(
        shift("r"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_14")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 14" },
    ),
    bind(
        shift("t"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_15")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 15" },
    ),
    bind(
        shift("y"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_16")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 16" },
    ),
    bind(
        shift("u"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_17")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 17" },
    ),
    bind(
        shift("i"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_18")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 18" },
    ),
    bind(
        shift("o"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_19")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 19" },
    ),
    bind(
        shift(";"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_20")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 20" },
    ),

    bind(
        ctrl("1"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0q4k990003a51021gpa4dl",
        ),
        { description: "Pro Tools Marker: Create V1" },
    ),
    bind(
        ctrl("2"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0r5fvc0004a510t8bkdk7p",
        ),
        { description: "Pro Tools Marker: Create V2" },
    ),
    bind(
        ctrl("3"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0rudwh0005a510fen1dunb",
        ),
        { description: "Pro Tools Marker: Create V3" },
    ),
    bind(
        ctrl("4"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0ruf1d0006a510a3i1o5oc",
        ),
        { description: "Pro Tools Marker: Create V4" },
    ),
    bind(
        ctrl("5"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmremaz4o0001ph23t704acrn",
        ),
        { description: "Pro Tools Marker: Create V5" },
    ),

    bind(
        opt("1"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0rzllv000da510rofc8umt",
        ),
        { description: "Pro Tools Marker: Create PRE1" },
    ),
    bind(
        opt("2"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0rzm1u000ea5107w52rkqn",
        ),
        { description: "Pro Tools Marker: Create PRE2" },
    ),
    bind(
        opt("3"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0rzm8p000fa5104a5yngix",
        ),
        { description: "Pro Tools Marker: Create PRE3" },
    ),
    bind(
        opt("4"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0rzmpn000ga510vx5lqcko",
        ),
        { description: "Pro Tools Marker: Create PRE4" },
    ),
    bind(
        opt("5"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmremffzx0002ph2302e9qsbv",
        ),
        { description: "Pro Tools Marker: Create PRE5" },
    ),

    bind(
        cmd("1"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0rvjly0009a510sv80waxz",
        ),
        { description: "Pro Tools Marker: Create HK1" },
    ),
    bind(
        cmd("2"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0rvkgo000aa510sbyc51nd",
        ),
        { description: "Pro Tools Marker: Create HK2" },
    ),
    bind(
        cmd("3"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0rvl8f000ba510weojmyep",
        ),
        { description: "Pro Tools Marker: Create HK3" },
    ),
    bind(
        cmd("4"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0rvm1j000ca510b6q6dqus",
        ),
        { description: "Pro Tools Marker: Create HK4" },
    ),
    bind(
        cmd("5"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmremi2rl0003ph23eglihu6h",
        ),
        { description: "Pro Tools Marker: Create HK5" },
    ),
    bind(
        cmd("t"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd12zu7s0013a510d618klcd",
        ),
        { description: "Pro Tools Marker: Create TOP" },
    ),
    bind(
        cmd("e"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd12zuoj0014a510pfs8t93n",
        ),
        { description: "Pro Tools Marker: Create END" },
    ),
    bind(
        cmd("b"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0s1ipu000ha510bauy5123",
        ),
        { description: "Pro Tools Marker: Create BRIDGE" },
    ),
    bind(
        opt("b"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0s1jhw000ia5100v1dzzx4",
        ),
        { description: "Pro Tools Marker: Create BREAK" },
    ),
    bind(
        cmd("o"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0s1kqh000ja5102tbr8ir8",
        ),
        { description: "Pro Tools Marker: Create OUTRO" },
    ),
    bind(
        cmd("v"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0s1m5b000ka510cvydqip6",
        ),
        { description: "Pro Tools Marker: Create VAMP" },
    ),
];

export const normalPtMarkerBindings = [
    bind("hyphen", key(opt(cmd("left_arrow"))), {
        description: "Pro Tools Marker: Go to previous",
    }),
    bind("equal_sign", key(opt(cmd("right_arrow"))), {
        description: "Pro Tools Marker: Go to next",
    }),
    bind("return_or_enter", key(cmd("keypad_5")), {
        description: "Pro Tools Marker: Open Marker Window",
    }),

    bind(
        "1",
        macro(key("keypad_period"), key("keypad_1"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 1" },
    ),
    bind(
        "2",
        macro(key("keypad_period"), key("keypad_2"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 2" },
    ),
    bind(
        "3",
        macro(key("keypad_period"), key("keypad_3"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 3" },
    ),
    bind(
        "4",
        macro(key("keypad_period"), key("keypad_4"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 4" },
    ),
    bind(
        "5",
        macro(key("keypad_period"), key("keypad_5"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 5" },
    ),
    bind(
        "6",
        macro(key("keypad_period"), key("keypad_6"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 6" },
    ),
    bind(
        "7",
        macro(key("keypad_period"), key("keypad_7"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 7" },
    ),
    bind(
        "8",
        macro(key("keypad_period"), key("keypad_8"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 8" },
    ),
    bind(
        "9",
        macro(key("keypad_period"), key("keypad_9"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 9" },
    ),
    bind(
        "0",
        macro(key("keypad_period"), key("keypad_10"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 10" },
    ),

    bind(
        "q",
        macro(key("keypad_period"), key("keypad_11"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 11" },
    ),
    bind(
        "w",
        macro(key("keypad_period"), key("keypad_12"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 12" },
    ),
    bind(
        "e",
        macro(key("keypad_period"), key("keypad_13"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 13" },
    ),
    bind(
        "r",
        macro(key("keypad_period"), key("keypad_14"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 14" },
    ),
    bind(
        "t",
        macro(key("keypad_period"), key("keypad_15"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 15" },
    ),
    bind(
        "y",
        macro(key("keypad_period"), key("keypad_16"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 16" },
    ),
    bind(
        "u",
        macro(key("keypad_period"), key("keypad_17"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 17" },
    ),
    bind(
        "i",
        macro(key("keypad_period"), key("keypad_18"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 18" },
    ),
    bind(
        "o",
        macro(key("keypad_period"), key("keypad_19"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 19" },
    ),
    bind(
        ";",
        macro(key("keypad_period"), key("keypad_20"), key("keypad_period")),
        { description: "Pro Tools Marker: Go to 20" },
    ),

    bind(
        shift("1"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_1")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 1" },
    ),
    bind(
        shift("2"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_2")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 2" },
    ),
    bind(
        shift("3"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_3")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 3" },
    ),
    bind(
        shift("4"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_4")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 4" },
    ),
    bind(
        shift("5"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_5")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 5" },
    ),
    bind(
        shift("6"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_6")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 6" },
    ),
    bind(
        shift("7"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_7")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 7" },
    ),
    bind(
        shift("8"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_8")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 8" },
    ),
    bind(
        shift("9"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_9")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 9" },
    ),
    bind(
        shift("0"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_10")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 10" },
    ),

    bind(
        shift("q"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_11")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 11" },
    ),
    bind(
        shift("w"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_12")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 12" },
    ),
    bind(
        shift("e"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_13")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 13" },
    ),
    bind(
        shift("r"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_14")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 14" },
    ),
    bind(
        shift("t"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_15")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 15" },
    ),
    bind(
        shift("y"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_16")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 16" },
    ),
    bind(
        shift("u"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_17")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 17" },
    ),
    bind(
        shift("i"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_18")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 18" },
    ),
    bind(
        shift("o"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_19")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 19" },
    ),
    bind(
        shift(";"),
        macro(
            key(shift("keypad_period")),
            key(shift("keypad_20")),
            key(shift("keypad_period")),
        ),
        { description: "Pro Tools Marker: Select to 20" },
    ),

    bind(
        ctrl("1"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0q4k990003a51021gpa4dl",
        ),
        { description: "Pro Tools Marker: Create V1" },
    ),
    bind(
        ctrl("2"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0r5fvc0004a510t8bkdk7p",
        ),
        { description: "Pro Tools Marker: Create V2" },
    ),
    bind(
        ctrl("3"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0rudwh0005a510fen1dunb",
        ),
        { description: "Pro Tools Marker: Create V3" },
    ),
    bind(
        ctrl("4"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0ruf1d0006a510a3i1o5oc",
        ),
        { description: "Pro Tools Marker: Create V4" },
    ),
    bind(
        ctrl("5"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmremaz4o0001ph23t704acrn",
        ),
        { description: "Pro Tools Marker: Create V5" },
    ),

    bind(
        opt("1"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0rzllv000da510rofc8umt",
        ),
        { description: "Pro Tools Marker: Create PRE1" },
    ),
    bind(
        opt("2"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0rzm1u000ea5107w52rkqn",
        ),
        { description: "Pro Tools Marker: Create PRE2" },
    ),
    bind(
        opt("3"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0rzm8p000fa5104a5yngix",
        ),
        { description: "Pro Tools Marker: Create PRE3" },
    ),
    bind(
        opt("4"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0rzmpn000ga510vx5lqcko",
        ),
        { description: "Pro Tools Marker: Create PRE4" },
    ),
    bind(
        opt("5"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmremffzx0002ph2302e9qsbv",
        ),
        { description: "Pro Tools Marker: Create PRE5" },
    ),

    bind(
        cmd("1"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0rvjly0009a510sv80waxz",
        ),
        { description: "Pro Tools Marker: Create HK1" },
    ),
    bind(
        cmd("2"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0rvkgo000aa510sbyc51nd",
        ),
        { description: "Pro Tools Marker: Create HK2" },
    ),
    bind(
        cmd("3"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0rvl8f000ba510weojmyep",
        ),
        { description: "Pro Tools Marker: Create HK3" },
    ),
    bind(
        cmd("4"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0rvm1j000ca510b6q6dqus",
        ),
        { description: "Pro Tools Marker: Create HK4" },
    ),
    bind(
        cmd("5"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmremi2rl0003ph23eglihu6h",
        ),
        { description: "Pro Tools Marker: Create HK5" },
    ),
    bind(
        cmd("t"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd12zu7s0013a510d618klcd",
        ),
        { description: "Pro Tools Marker: Create TOP" },
    ),
    bind(
        cmd("e"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd12zuoj0014a510pfs8t93n",
        ),
        { description: "Pro Tools Marker: Create END" },
    ),
    bind(
        cmd("b"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0s1ipu000ha510bauy5123",
        ),
        { description: "Pro Tools Marker: Create BRIDGE" },
    ),
    bind(
        opt("b"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0s1jhw000ia5100v1dzzx4",
        ),
        { description: "Pro Tools Marker: Create BREAK" },
    ),
    bind(
        cmd("o"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0s1kqh000ja5102tbr8ir8",
        ),
        { description: "Pro Tools Marker: Create OUTRO" },
    ),
    bind(
        cmd("v"),
        soundflow(
            "user:cmgnahvnh0002h7102o78pzro:cmgq3ee8y000oq310sqvgdyft#cmd0s1m5b000ka510cvydqip6",
        ),
        { description: "Pro Tools Marker: Create VAMP" },
    ),
];
