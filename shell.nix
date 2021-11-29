let

  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {
    overlays = [ moz_overlay ];
  };

in

with pkgs;

mkShell {

  name = "rustlings";

  buildInputs = [
    figlet lolcat # banner printing on enter

    niv
    latest.rustChannels.nightly.rust
    latest.rustChannels.nightly.rust-src
    rustup
    jetbrains.idea-community
  ];

  shellHook = ''
    figlet $name | lolcat --freq 0.5
  '';
}

