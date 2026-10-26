import { aerospace, bind, cmd, script, shift } from "karabiner-config-builder";

const focusAppspace = "~/.dotfiles/bin/focus-appspace";
const focusSfspace = "~/.dotfiles/bin/focus-sfspace";
const openFinderWindow = `osascript -e 'tell application "Finder" to make new Finder window to folder (path to home folder as text)'`;
const openBraveBrowserWindow = 'open -na "Brave Browser" --args --new-window';
const youtubeBundleId = "com.brave.Browser.app.agimnkijcaahngcdmfeangaknmldooml";

export default [
    bind("q", script(focusAppspace, { args: ["com.avid.ProTools", "pt"] })),
    bind(shift("q"), aerospace("move-node-to-workspace --focus-follows-window pt")),
    bind("w", script(focusAppspace, { args: ["com.apple.logic10", "lg"] })),
    bind(shift("w"), aerospace("move-node-to-workspace --focus-follows-window lg")),
    bind("e", script(focusAppspace, { args: ["com.ableton.live", "ab"] })),
    bind(shift("e"), aerospace("move-node-to-workspace --focus-follows-window ab")),
    bind("r", script(focusSfspace)),
    bind(shift("r"), aerospace("move-node-to-workspace --focus-follows-window sf")),
    bind("t", script(focusAppspace, { args: ["com.mitchellh.ghostty", "tm"] })),
    bind(shift("t"), aerospace("move-node-to-workspace --focus-follows-window tm")),

    bind("a", script(focusAppspace, { args: ["com.apple.MobileSMS", "ms"] })),
    bind(shift("a"), aerospace("move-node-to-workspace --focus-follows-window ms")),
    bind("s", script(focusAppspace, { args: ["com.apple.mail", "ml"] })),
    bind(shift("s"), aerospace("move-node-to-workspace --focus-follows-window ml")),
    bind("d", script(focusAppspace, { args: ["com.apple.reminders", "rm"] })),
    bind(shift("d"), aerospace("move-node-to-workspace --focus-follows-window rm")),
    bind("f", script(focusAppspace, { args: ["com.apple.finder", "fd", openFinderWindow] })),
    bind(shift("f"), aerospace("move-node-to-workspace --focus-follows-window fd")),
    bind("g", script(focusAppspace, { args: ["com.apple.iCal", "ca"] })),
    bind(shift("g"), aerospace("move-node-to-workspace --focus-follows-window ca")),

    bind("z", script(focusAppspace, { args: ["us.zoom.xos", "zm"] })),
    bind(shift("z"), aerospace("move-node-to-workspace --focus-follows-window zm")),
    bind("c", script(focusAppspace, { args: ["com.openai.codex", "ai"] })),
    bind(shift("c"), aerospace("move-node-to-workspace --focus-follows-window ai")),
    bind("x", script(focusAppspace, { args: ["com.spotify.client", "sp"] })),
    bind(shift("x"), aerospace("move-node-to-workspace --focus-follows-window sp")),
    bind("v", script(focusAppspace, { args: ["com.electron.samply", "sa"] })),
    bind(shift("v"), aerospace("move-node-to-workspace --focus-follows-window sa")),
    bind("b", script(focusAppspace, { args: ["com.brave.Browser", "br", openBraveBrowserWindow] })),
    bind(shift("b"), aerospace("move-node-to-workspace --focus-follows-window br")),

    bind("y", script(focusAppspace, { args: [youtubeBundleId, "yt"] })),
    bind(shift("y"), aerospace("move-node-to-workspace --focus-follows-window yt")),
    bind("u", script(focusAppspace, { args: ["com.uaudio.console3", "ua"] })),
    bind(shift("u"), aerospace("move-node-to-workspace --focus-follows-window ua")),
    bind(cmd("u"), script(focusAppspace, { args: ["com.uaudio.uad-meter", "um"] })),
    bind(shift(cmd("u")), aerospace("move-node-to-workspace --focus-follows-window um")),
    bind("i", script(focusAppspace, { args: ["com.adobe.illustrator", "il"] })),
    bind(shift("i"), aerospace("move-node-to-workspace --focus-follows-window il")),
    bind("o", script(focusAppspace, { args: ["com.adobe.Photoshop", "ph"] })),
    bind(shift("o"), aerospace("move-node-to-workspace --focus-follows-window ph")),

    bind("h", script(focusAppspace, { args: ["com.apple.audio.AudioMIDISetup", "am"] })),
    bind(shift("h"), aerospace("move-node-to-workspace --focus-follows-window am")),
    bind("j", script(focusAppspace, { args: ["org.pqrs.Karabiner-Elements.Settings", "kr"] })),
    bind(shift("j"), aerospace("move-node-to-workspace --focus-follows-window kr")),
    bind("k", script(focusAppspace, { args: ["org.pqrs.Karabiner-EventViewer", "ke"] })),
    bind(shift("k"), aerospace("move-node-to-workspace --focus-follows-window ke")),
    bind("l", script(focusAppspace, { args: ["com.bombich.ccc", "cc"] })),
    bind(shift("l"), aerospace("move-node-to-workspace --focus-follows-window cc")),
    bind("p", script(focusAppspace, { args: ["com.apple.Preview", "pr"] })),
    bind(shift("p"), aerospace("move-node-to-workspace --focus-follows-window pr")),

    bind("n", script(focusAppspace, { args: ["com.apple.Notes", "nt"] })),
    bind(shift("n"), aerospace("move-node-to-workspace --focus-follows-window nt")),
    bind("m", script(focusAppspace, { args: ["com.apple.Music", "mu"] })),
    bind(shift("m"), aerospace("move-node-to-workspace --focus-follows-window mu")),
];
