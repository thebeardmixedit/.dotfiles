import { group, key, layer, none, type GroupDefinition, type KeyCode } from "karabiner-config-builder";

import apps from "./apps.ts";
import aerospace from "./aerospace.ts";

export default function (trigger: KeyCode): GroupDefinition {
    return group(
        {
            description: "Aerospace/app commands",
        },

        layer("appspace", {
            trigger,
            tapped: key(trigger),
            block: true,
            tapTimeoutMs: 150,
            bindings: [...apps, ...aerospace],
        }),
    );
}
