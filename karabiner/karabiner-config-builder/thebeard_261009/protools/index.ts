import { group, inApp, type GroupDefinition } from "karabiner-config-builder";

import markerLayer, { type ProToolsMarkerLayerContext } from "./marker-layer.ts";
import commandsLayer, { type ProToolsCommandsLayerContext } from "./commands-layer.ts";
import { moonlanderRemaps } from "./moonalander-remaps.ts";

export default function (context: ProToolsGroupContext): GroupDefinition {
    return group(
        {
            description: "Pro Tools app specific command keys",
            conditions: [inApp("com.avid.ProTools")],
        },
        markerLayer(context.markerLayer),
        commandsLayer(context.commandsLayer),
        moonlanderRemaps(),
    );
}

export interface ProToolsGroupContext {
    markerLayer: ProToolsMarkerLayerContext;
    commandsLayer: ProToolsCommandsLayerContext;
}
