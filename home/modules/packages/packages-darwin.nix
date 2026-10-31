{
  pkgs,
  pkgsUnstable,
  lib,
  hermes-agent,
  ...
}:
let
  hermesDesktop = hermes-agent.packages.${pkgs.stdenv.hostPlatform.system}.desktop;
  hermesAgent = hermes-agent.packages.${pkgs.stdenv.hostPlatform.system}.default;
  # Match the Electron runtime used to compile the desktop's native modules.
  hermesElectron = hermes-agent.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.electron;
  hermesApp = pkgs.runCommand "hermes-desktop-app" {
    nativeBuildInputs = [ pkgs.python3 ];
  } ''
    mkdir -p "$out/Applications"
    # LaunchServices and Dock must see the same native bundle, not a launcher
    # that starts a second, separately identified Electron.app.
    cp -R ${hermesElectron}/Applications/Electron.app "$out/Applications/Hermes.app"
    app="$out/Applications/Hermes.app/Contents"
    chmod u+w "$app" "$app/Resources" "$app/Info.plist" "$app/MacOS"
    # Electron detects packaging by executable name; leaving it as Electron
    # enables the development Dock icon override with an unpadded PNG.
    mv "$app/MacOS/Electron" "$app/MacOS/Hermes"
    ln -s ${hermesDesktop}/share/hermes-desktop "$app/Resources/app"
    cp ${hermes-agent}/apps/desktop/assets/icon.icns "$app/Resources/hermes.icns"
    python3 - "$app/Info.plist" <<'PY'
    import plistlib
    import sys

    path = sys.argv[1]
    with open(path, "rb") as source:
        info = plistlib.load(source)
    info.update(
        CFBundleName="Hermes",
        CFBundleDisplayName="Hermes",
        CFBundleExecutable="Hermes",
        CFBundleIdentifier="local.nix.hermes-desktop",
        CFBundleIconFile="hermes.icns",
    )
    info.setdefault("LSEnvironment", {}).update(
        ELECTRON_IS_DEV="0",
        HERMES_DESKTOP_HERMES="${lib.getExe hermesAgent}",
    )
    with open(path, "wb") as target:
        plistlib.dump(info, target)
    PY
  '';
in
{
  home.packages = lib.optionals pkgs.stdenv.isDarwin (with pkgs; [
    hermesApp
    pkgsUnstable.vscode
    
    docker
    docker-compose
    colima

    utm
  ]);
}
