{
  description = "Nix flake for the architect agent.";

  inputs = {
    nixpkgs.url = "github:meta-introspector/nixpkgs?ref=feature/CRQ-016-nixify";
    flake-utils.url = "github:meta-introspector/flake-utils?ref=feature/CRQ-016-nixify";
    pip2nix.url = "github:meta-introspector/pip2nix?ref=master";
  };

  outputs = { self, nixpkgs, flake-utils, pip2nix
            #, base-agent
            , ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };

        #pythonEnv = base-agent.pythonEnv.${system};
        #${pythonEnv}/bin/python ${./.synapse/agents/architect/architect_agent.py} "$@"
      in
      {
        packages.default = pkgs.writeShellScriptBin "architect-agent" ''
          #!${pkgs.bash}/bin/bash
          # The path to the agent script is relative to the current flake
          
        '';
      }
    );
}
