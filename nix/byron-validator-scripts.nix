{ commonLib
, oldCardanoSrc
, byronProxy
, customConfig
, cardanoConfig
}:

let
  config = if customConfig != {} then customConfig else {
    proxyHost = "127.0.0.1";
    proxyPort = 7777;
  };
  pkgs = commonLib.pkgs;
  oldCardano = import oldCardanoSrc {};
  oldCardanoLib = import (oldCardanoSrc + "/lib.nix");
  environments = oldCardanoLib.environments;
  loggingConfig = ../cfg/logging-validator.yaml;
  configuration = cardanoConfig;
  genesisFiles = {
    mainnet = "${configuration}/lib/mainnet-genesis.json";
    staging = "${configuration}/lib/mainnet-genesis-dryrun-with-stakeholders.json";
    testnet = "${configuration}/lib/testnet-genesis.json";
  };
  networkMagicEnvironments = [
    "testnet"
  ];
  # Really hacky. Should get from configuration when
  # we have a configuration file that isn't coming from
  # old cardano-sl config.
  ifNetworkMagic = environment: pkgs.lib.optionalString (builtins.elem environment networkMagicEnvironments);
  mkValidatorScript = environment: with config; pkgs.writeScript "byron-validator-${environment}" ''
    exec ${byronProxy}/bin/validator +RTS -T -RTS --server-host ${proxyHost} --server-port ${builtins.toString proxyPort} --logger-config ${loggingConfig} --override-genesis-json ${genesisFiles.${environment}} ${ifNetworkMagic environment "--requires-network-magic"}
  '';

# TODO: add more environments when it isn't hard-coded to mainnet
in {
  mainnet = mkValidatorScript "mainnet";
  staging = mkValidatorScript "staging";
  testnet = mkValidatorScript "testnet";
}
