import { bind, exceptInApp, fromDevice, group, none, type GroupDefinition } from "karabiner-config-builder";

import appspace from "./appspace/index.ts";
import protools from "./protools/index.ts";
import finder from "./bindings/finder.ts";

export default function (): GroupDefinition {
    return group(
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
        finder(),
        appspace("f16"),
        protools({ markerLayer: { trigger: "f19", tapped: "keypad_enter" }, commandsLayer: { trigger: "f17" } }),
        group(
            {
                description: "Global disable app command keys [moonlander]",
                conditions: [exceptInApp("com.avid.ProTools")],
            },

            bind("f17", none()),
            bind("f18", none()),
            bind("f19", none()),
            bind("f20", none()),
        ),
    );
}
