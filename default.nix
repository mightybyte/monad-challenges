{ compiler ? "ghc881"
, rev      ? "c4f97342ba8ac84def72328616dd05d005bb4715"
, sha256   ? "1p2gbisib2jrz4r9b5vzfvmirgmz9sr2ksalngaw908vvg9hsvai"
, pkgs     ?
    import (builtins.fetchTarball {
      url    = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
      inherit sha256; }) {
      config.allowBroken = false;
      config.allowUnfree = true;
    }
}:
let gitignoreSrc = import (pkgs.fetchFromGitHub {
      owner = "hercules-ci";
      repo = "gitignore";
      rev = "2ced4519f865341adcb143c5d668f955a2cb997f";
      sha256 = "0fc5bgv9syfcblp23y05kkfnpgh3gssz6vn24frs8dzw39algk2z";
    }) {};

in
pkgs.haskell.packages.${compiler}.developPackage {
  name = builtins.baseNameOf ./.;
  root = gitignoreSrc.gitignoreSource ./.;

  overrides = self: super: with pkgs.haskell.lib; {
    # Don't run a package's test suite
    # foo = dontCheck super.foo;
    #
    # Don't enforce package's version constraints
    # bar = doJailbreak super.bar;
    #
    # Get a specific hackage version straight from hackage. Unlike the above
    # callHackage approach, this will always succeed if the version is on
    # hackage. The downside is that you have to specify the hash manually.
    # hakyll = self.callHackageDirect {
    #   pkg = "hakyll";
    #   ver = "4.13.3.0";
    #   sha256 = "1maf8z5il6gs3gh6f9jw8pflnc50imvf8gr4x6zrfbayjnd674ql";
    # } {};

    # To discover more functions that can be used to modify haskell
    # packages, run "nix-repl", type "pkgs.haskell.lib.", then hit
    # <TAB> to get a tab-completed list of functions.
  };
  source-overrides = {
    # Use a specific hackage version using callHackage. Only works if the
    # version you want is in the version of all-cabal-hashes that you have.
    # bytestring = "0.10.8.1";
    #
    # Use a particular commit from github
    # parsec = pkgs.fetchFromGitHub
    #   { owner = "hvr";
    #     repo = "parsec";
    #     rev = "c22d391c046ef075a6c771d05c612505ec2cd0c3";
    #     sha256 = "0phar79fky4yzv4hq28py18i4iw779gp5n327xx76mrj7yj87id3";
    #   };
  };
  modifier = drv: pkgs.haskell.lib.overrideCabal drv (attrs: {
    buildTools = (attrs.buildTools or []) ++ [
      pkgs.haskell.packages.${compiler}.cabal-install
      pkgs.haskell.packages.${compiler}.ghcid
    ];
  });
}
