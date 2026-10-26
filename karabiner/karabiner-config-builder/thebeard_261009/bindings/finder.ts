import { group, bind, ctrl, script, inApp, type GroupDefinition } from "karabiner-config-builder";

export default function (): GroupDefinition {
    return group(
        {
            description: "Finder commands",
            conditions: [inApp("com.apple.finder")],
        },

        bind(
            ctrl("m"),
            script("~/.dotfiles/bin/convert-wav-to-mp3", {
                shell: "zsh",
                requires: ["lame", "osascript"],
            }),
            {
                description: "Convert WAV file to MP3",
            },
        ),
        bind(
            ctrl("s"),
            script("~/.dotfiles/bin/symlink", {
                shell: "zsh",
                requires: ["osascript"],
            }),
            {
                description: "Symlink selected file",
            },
        ),
    );
}
