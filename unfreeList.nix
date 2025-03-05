{ lib, ... }:
{



nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
             "discord"
             "steam"
             "steam-unwrapped"
           ];
}
