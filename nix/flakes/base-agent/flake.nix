{
  description = "Base agent flake providing a shared Python environment.";

  inputs = {
    nixpkgs.url = "github:meta-introspector/nixpkgs?ref=feature/CRQ-016-nixify";
    flake-utils.url = "github:meta-introspector/flake-utils?ref=feature/CRQ-016-nixify";
    pip2nix.url = "github:meta-introspector/pip2nix?ref=master";
  };

  outputs = { self, nixpkgs, flake-utils, pip2nix, pythonModule, pythonPackagesFile, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };

        pythonEnv = pythonModule { inherit pkgs pythonPackagesFile; };

      in
      {
        pythonEnv = pythonEnv; # Expose the Python environment
      }
    );
}
