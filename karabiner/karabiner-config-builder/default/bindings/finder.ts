import { bind, script, ctrl } from "karabiner-config-builder";

export default [
    bind(
        ctrl("m"),
        script("~/.dotfiles/bin/convert-wav-to-mp3", {
            shell: "zsh",
            requires: ["lame", "osascript"],
        }),
        {
            description: "Convert wav file to mp3",
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
];
