let
  buildDepError = pkg:
    builtins.throw ''
      The Haskell package set does not contain the package: ${pkg} (build dependency).
      
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
  sysDepError = pkg:
    builtins.throw ''
      The Nixpkgs package set does not contain the package: ${pkg} (system dependency).
      
      You may need to augment the system package mapping in haskell.nix so that it can be found.
      '';
  pkgConfDepError = pkg:
    builtins.throw ''
      The pkg-conf packages does not contain the package: ${pkg} (pkg-conf dependency).
      
      You may need to augment the pkg-conf package mapping in haskell.nix so that it can be found.
      '';
  exeDepError = pkg:
    builtins.throw ''
      The local executable components do not include the component: ${pkg} (executable dependency).
      '';
  legacyExeDepError = pkg:
    builtins.throw ''
      The Haskell package set does not contain the package: ${pkg} (executable dependency).
      
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
  buildToolDepError = pkg:
    builtins.throw ''
      Neither the Haskell package set or the Nixpkgs package set contain the package: ${pkg} (build tool dependency).
      
      If this is a system dependency:
      You may need to augment the system package mapping in haskell.nix so that it can be found.
      
      If this is a Haskell dependency:
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
in { system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = {};
    package = {
      specVersion = "1.10";
      identifier = { name = "cardano-sl-util"; version = "3.1.0"; };
      license = "Apache-2.0";
      copyright = "2016 IOHK";
      maintainer = "support@iohk.io";
      author = "IOHK";
      homepage = "https://github.com/input-output-hk/cardano-sl";
      url = "";
      synopsis = "Cardano SL - general utilities";
      description = "This package contains utility functions not specific\nto Cardano SL which extend 3rd party libraries or implement\nsomething from scratch.";
      buildType = "Simple";
      isLocal = true;
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."auto-update" or (buildDepError "auto-update"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."canonical-json" or (buildDepError "canonical-json"))
          (hsPkgs."cborg" or (buildDepError "cborg"))
          (hsPkgs."cereal" or (buildDepError "cereal"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."concurrent-extra" or (buildDepError "concurrent-extra"))
          (hsPkgs."contravariant" or (buildDepError "contravariant"))
          (hsPkgs."cryptonite" or (buildDepError "cryptonite"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."ether" or (buildDepError "ether"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."file-embed" or (buildDepError "file-embed"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."formatting" or (buildDepError "formatting"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."katip" or (buildDepError "katip"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."lrucache" or (buildDepError "lrucache"))
          (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
          (hsPkgs."mmorph" or (buildDepError "mmorph"))
          (hsPkgs."monad-control" or (buildDepError "monad-control"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."reflection" or (buildDepError "reflection"))
          (hsPkgs."resourcet" or (buildDepError "resourcet"))
          (hsPkgs."safe-exceptions" or (buildDepError "safe-exceptions"))
          (hsPkgs."serokell-util" or (buildDepError "serokell-util"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."tagged" or (buildDepError "tagged"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."time-units" or (buildDepError "time-units"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
          (hsPkgs."transformers-lift" or (buildDepError "transformers-lift"))
          (hsPkgs."universum" or (buildDepError "universum"))
          (hsPkgs."unliftio-core" or (buildDepError "unliftio-core"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."yaml" or (buildDepError "yaml"))
          ];
        build-tools = [
          (hsPkgs.buildPackages.cpphs or (pkgs.buildPackages.cpphs or (buildToolDepError "cpphs")))
          ];
        buildable = true;
        };
      tests = {
        "util-test" = {
          depends = [
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."aeson-pretty" or (buildDepError "aeson-pretty"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."canonical-json" or (buildDepError "canonical-json"))
            (hsPkgs."cardano-sl-util" or (buildDepError "cardano-sl-util"))
            (hsPkgs."cereal" or (buildDepError "cereal"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."file-embed" or (buildDepError "file-embed"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."formatting" or (buildDepError "formatting"))
            (hsPkgs."hedgehog" or (buildDepError "hedgehog"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."pretty-show" or (buildDepError "pretty-show"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."quickcheck-instances" or (buildDepError "quickcheck-instances"))
            (hsPkgs."safecopy" or (buildDepError "safecopy"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."time-units" or (buildDepError "time-units"))
            (hsPkgs."universum" or (buildDepError "universum"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."yaml" or (buildDepError "yaml"))
            ];
          build-tools = [
            (hsPkgs.buildPackages.hspec-discover or (pkgs.buildPackages.hspec-discover or (buildToolDepError "hspec-discover")))
            (hsPkgs.buildPackages.cpphs or (pkgs.buildPackages.cpphs or (buildToolDepError "cpphs")))
            ];
          buildable = true;
          };
        };
      };
    } // {
    src = (pkgs.lib).mkDefault (pkgs.fetchgit {
      url = "https://github.com/input-output-hk/cardano-sl";
      rev = "c9c5f6103cbfcdfd6cecf19de5d570785a548cfd";
      sha256 = "0gynd9cy5rivd8q7rywjr7c3jnz0yr3jy7pli00nkhgwsig55984";
      });
    postUnpack = "sourceRoot+=/util; echo source root reset to \$sourceRoot";
    }