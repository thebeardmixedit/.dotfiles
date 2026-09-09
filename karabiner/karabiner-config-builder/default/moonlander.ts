import {
    group,
    layer,
    inApp,
    fromDevice,
    key,
    bind,
    none,
    exceptInApp,
    type GroupDefinition,
} from "karabiner-config-builder";

import aerospaceBindings from "./bindings/aerospace.ts";
import appBindings from "./bindings/apps.ts";
import moonlanderRemaps from "./bindings/protools/moonlander-remaps.ts";
import {
    markerBindings,
    moonlanderPtMarkerBindings,
} from "./bindings/protools/markers.ts";
import {
    ptCommandBindingsLeft,
    ptCommandBindingsRight,
} from "./bindings/protools/commands.ts";

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

        group(
            {
                description: "Pro Tools app specific command keys [moonlander]",
                conditions: [inApp("com.avid.ProTools")],
            },
            layer("moonlander-pt-markers", {
                trigger: "f19",
                tapped: key("keypad_enter"),
                block: true,
                tapTimeoutMs: 150,
                bindings: [...moonlanderPtMarkerBindings, ...markerBindings],
            }),

            layer("moonlander-pt-commands", {
                trigger: "f16",
                tapped: key("f16"),
                block: true,
                tapTimeoutMs: 150,
                bindings: [...ptCommandBindingsLeft, ...ptCommandBindingsRight],
            }),

            moonlanderRemaps(),
        ),

        layer("appspace", {
            trigger: "grave_accent_and_tilde",
            tapped: key("grave_accent_and_tilde"),
            block: true,
            tapTimeoutMs: 150,
            bindings: [...aerospaceBindings, ...appBindings],
        }),

        group(
            {
                description:
                    "Global disable app specific command keys [moonlander]",
                conditions: [exceptInApp("com.avid.ProTools")],
            },
            bind("f16", none()),
            bind("f17", none()),
            bind("f18", none()),
            bind("f19", none()),
            bind("f20", none()),
        ),
    );
}
