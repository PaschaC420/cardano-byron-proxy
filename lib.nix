let
  sources = import ./nix/sources.nix;
  pkgs' = import sources.nixpkgs {};
  haskellNixJson = let
    src = sources."haskell.nix";
  in __toJSON {
    inherit (sources."haskell.nix") rev sha256;
    url = "https://github.com/${src.owner}/${src.repo}";
  };
  iohkNix = import sources.iohk-nix { haskellNixJsonOverride = pkgs'.writeText "haskell-nix.json" haskellNixJson; };
  pkgs = iohkNix.pkgs;
  lib = pkgs.lib;
  niv = (import sources.niv {}).niv;
in lib // iohkNix.cardanoLib // iohkNix // {
  inherit niv iohkNix;
}
