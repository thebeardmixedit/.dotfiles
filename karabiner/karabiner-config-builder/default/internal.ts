import {
    group,
    layer,
    inApp,
    key,
    exceptFromDevice,
    ctrl,
    type GroupDefinition,
} from "karabiner-config-builder";

import aerospaceBindings from "./bindings/aerospace.ts";
import appBindings from "./bindings/apps.ts";
import {
    markerBindings,
    internalPtMarkerBindings,
} from "./bindings/protools/markers.ts";
import {
    ptCommandBindingsLeft,
    ptCommandBindingsRight,
} from "./bindings/protools/commands.ts";

export default function (): GroupDefinition {
    return group(
        {
            description: "Internal group",
            conditions: [
                exceptFromDevice({
                    is_keyboard: true,
                    product_id: 6505,
                    vendor_id: 12951,
                }),
            ],
        },
        group(
            {
                description: "Pro Tools app specific command keys [internal]",
                conditions: [inApp("com.avid.ProTools")],
            },
            layer("internal-pt-markers", {
                trigger: "backslash",
                tapped: key("backslash"),
                tapTimeoutMs: 150,
                bindings: [...internalPtMarkerBindings, ...markerBindings],
            }),
            layer("internal-pt-commands", {
                trigger: "tab",
                tapped: key(ctrl("backslash")),
                tapTimeoutMs: 150,
                bindings: [...ptCommandBindingsLeft, ...ptCommandBindingsRight],
            }),
        ),
        layer("internal-appspaces", {
            trigger: "caps_lock",
            tapped: key("caps_lock"),
            block: true,
            tapTimeoutMs: 150,
            bindings: [...aerospaceBindings, ...appBindings],
        }),
    );
}
