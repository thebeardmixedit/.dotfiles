import { exceptFromDevice, group, type GroupDefinition } from "karabiner-config-builder";

import appspace from "./appspace/index.ts";
import protools from "./protools/index.ts";
import finder from "./bindings/finder.ts";

export default function (): GroupDefinition {
    return group(
        {
            description: "Internal keyboard group",
            conditions: [
                exceptFromDevice({
                    is_keyboard: true,
                    product_id: 6505,
                    vendor_id: 12951,
                }),
            ],
        },
        finder(),
        appspace("caps_lock"),
        protools({ markerLayer: { trigger: "backslash" }, commandsLayer: { trigger: "return_or_enter" } }),
    );
}
