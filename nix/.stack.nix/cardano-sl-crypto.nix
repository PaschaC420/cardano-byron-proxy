{ system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = {};
    package = {
      specVersion = "1.10";
      identifier = { name = "cardano-sl-crypto"; version = "3.2.0"; };
      license = "Apache-2.0";
      copyright = "2016 IOHK";
      maintainer = "hi@serokell.io";
      author = "Serokell";
      homepage = "";
      url = "";
      synopsis = "Cardano SL - cryptography primitives";
      description = "This package contains cryptography primitives used in Cardano SL.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs.aeson)
          (hsPkgs.base)
          (hsPkgs.binary)
          (hsPkgs.bytestring)
          (hsPkgs.canonical-json)
          (hsPkgs.cardano-crypto)
          (hsPkgs.cardano-sl-binary)
          (hsPkgs.cardano-sl-util)
          (hsPkgs.cborg)
          (hsPkgs.cereal)
          (hsPkgs.cryptonite)
          (hsPkgs.cryptonite-openssl)
          (hsPkgs.data-default)
          (hsPkgs.formatting)
          (hsPkgs.hashable)
          (hsPkgs.lens)
          (hsPkgs.memory)
          (hsPkgs.mtl)
          (hsPkgs.pvss)
          (hsPkgs.reflection)
          (hsPkgs.safecopy)
          (hsPkgs.safe-exceptions)
          (hsPkgs.scrypt)
          (hsPkgs.serokell-util)
          (hsPkgs.text)
          (hsPkgs.formatting)
          (hsPkgs.universum)
          (hsPkgs.unordered-containers)
          ];
        build-tools = [
          (hsPkgs.buildPackages.cpphs or (pkgs.buildPackages.cpphs))
          ];
        };
      tests = {
        "crypto-test" = {
          depends = [
            (hsPkgs.QuickCheck)
            (hsPkgs.base)
            (hsPkgs.bytestring)
            (hsPkgs.cardano-crypto)
            (hsPkgs.cardano-sl-binary)
            (hsPkgs.cardano-sl-binary-test)
            (hsPkgs.cardano-sl-crypto)
            (hsPkgs.cardano-sl-util)
            (hsPkgs.cardano-sl-util-test)
            (hsPkgs.cryptonite)
            (hsPkgs.formatting)
            (hsPkgs.generic-arbitrary)
            (hsPkgs.hedgehog)
            (hsPkgs.hspec)
            (hsPkgs.memory)
            (hsPkgs.quickcheck-instances)
            (hsPkgs.text)
            (hsPkgs.universum)
            (hsPkgs.unordered-containers)
            ];
          build-tools = [
            (hsPkgs.buildPackages.hspec-discover or (pkgs.buildPackages.hspec-discover))
            ];
          };
        };
      };
    } // {
    src = (pkgs.lib).mkDefault (pkgs.fetchgit {
      url = "https://github.com/input-output-hk/cardano-sl";
      rev = "d0cc2e6336e3c57771c775cafe831bc83db303d3";
      sha256 = "1l0af54ivqs26ibsl4nih8800b99f99r1y33wcrnby28mjsph8s2";
      });
    postUnpack = "sourceRoot+=/crypto; echo source root reset to \$sourceRoot";
    }