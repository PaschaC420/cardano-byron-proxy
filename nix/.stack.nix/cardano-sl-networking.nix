{ system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = { benchmarks = false; };
    package = {
      specVersion = "1.20";
      identifier = { name = "cardano-sl-networking"; version = "3.1.0"; };
      license = "Apache-2.0";
      copyright = "";
      maintainer = "";
      author = "";
      homepage = "";
      url = "";
      synopsis = "";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs.aeson)
          (hsPkgs.aeson-options)
          (hsPkgs.async)
          (hsPkgs.attoparsec)
          (hsPkgs.base)
          (hsPkgs.binary)
          (hsPkgs.bytestring)
          (hsPkgs.cardano-sl-chain)
          (hsPkgs.cardano-sl-util)
          (hsPkgs.containers)
          (hsPkgs.ekg-core)
          (hsPkgs.formatting)
          (hsPkgs.formatting)
          (hsPkgs.hashable)
          (hsPkgs.lens)
          (hsPkgs.mtl)
          (hsPkgs.mtl)
          (hsPkgs.network)
          (hsPkgs.network-transport)
          (hsPkgs.network-transport-tcp)
          (hsPkgs.random)
          (hsPkgs.safe-exceptions)
          (hsPkgs.scientific)
          (hsPkgs.stm)
          (hsPkgs.text)
          (hsPkgs.these)
          (hsPkgs.time)
          (hsPkgs.time-units)
          (hsPkgs.universum)
          (hsPkgs.unordered-containers)
          ];
        };
      exes = {
        "ping-pong" = {
          depends = [
            (hsPkgs.base)
            (hsPkgs.async)
            (hsPkgs.binary)
            (hsPkgs.bytestring)
            (hsPkgs.cardano-sl-networking)
            (hsPkgs.cardano-sl-util)
            (hsPkgs.contravariant)
            (hsPkgs.network-transport)
            (hsPkgs.network-transport-tcp)
            (hsPkgs.random)
            ];
          };
        "bench-sender" = {
          depends = [
            (hsPkgs.async)
            (hsPkgs.base)
            (hsPkgs.cardano-sl-util)
            (hsPkgs.contravariant)
            (hsPkgs.lens)
            (hsPkgs.MonadRandom)
            (hsPkgs.mtl)
            (hsPkgs.network-transport)
            (hsPkgs.network-transport-tcp)
            (hsPkgs.optparse-simple)
            (hsPkgs.random)
            (hsPkgs.safe-exceptions)
            (hsPkgs.serokell-util)
            (hsPkgs.time)
            (hsPkgs.time-units)
            ];
          };
        "bench-receiver" = {
          depends = [
            (hsPkgs.base)
            (hsPkgs.cardano-sl-util)
            (hsPkgs.contravariant)
            (hsPkgs.network-transport-tcp)
            (hsPkgs.optparse-simple)
            (hsPkgs.random)
            (hsPkgs.safe-exceptions)
            (hsPkgs.serokell-util)
            (hsPkgs.text)
            ];
          };
        "bench-log-reader" = {
          depends = [
            (hsPkgs.base)
            (hsPkgs.attoparsec)
            (hsPkgs.cardano-sl-util)
            (hsPkgs.conduit)
            (hsPkgs.conduit-extra)
            (hsPkgs.containers)
            (hsPkgs.lens)
            (hsPkgs.mtl)
            (hsPkgs.optparse-simple)
            (hsPkgs.resourcet)
            (hsPkgs.safe-exceptions)
            (hsPkgs.text)
            (hsPkgs.formatting)
            (hsPkgs.unliftio-core)
            ];
          };
        };
      tests = {
        "cardano-sl-networking-test" = {
          depends = [
            (hsPkgs.async)
            (hsPkgs.base)
            (hsPkgs.binary)
            (hsPkgs.bytestring)
            (hsPkgs.cardano-sl-networking)
            (hsPkgs.cardano-sl-util)
            (hsPkgs.containers)
            (hsPkgs.hspec)
            (hsPkgs.hspec-core)
            (hsPkgs.lens)
            (hsPkgs.mtl)
            (hsPkgs.network-transport)
            (hsPkgs.network-transport-tcp)
            (hsPkgs.network-transport-inmemory)
            (hsPkgs.QuickCheck)
            (hsPkgs.random)
            (hsPkgs.serokell-util)
            (hsPkgs.stm)
            (hsPkgs.time-units)
            ];
          build-tools = [
            (hsPkgs.buildPackages.hspec-discover or (pkgs.buildPackages.hspec-discover))
            ];
          };
        };
      benchmarks = {
        "qdisc-simulation" = {
          depends = [
            (hsPkgs.base)
            (hsPkgs.async)
            (hsPkgs.network-transport-tcp)
            (hsPkgs.network-transport)
            (hsPkgs.time-units)
            (hsPkgs.stm)
            (hsPkgs.mwc-random)
            (hsPkgs.statistics)
            (hsPkgs.vector)
            (hsPkgs.time)
            ];
          };
        };
      };
    } // {
    src = (pkgs.lib).mkDefault (pkgs.fetchgit {
      url = "https://github.com/input-output-hk/cardano-sl";
      rev = "7c968d8079ca344249dc92b33b4226eb3acd6832";
      sha256 = "1ps1nqhs67pm11q1r3ngry7s6mdp38hnsjqp7nmh1j98r78f6wsd";
      });
    postUnpack = "sourceRoot+=/networking; echo source root reset to \$sourceRoot";
    }