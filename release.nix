let
 pkgs = import ./pkgs.nix { inherit config; };
 config = {
   packageOverrides = new: rec {
     libdill = new.callPackage ./libdill.nix {};
   };
   allowBroken = true;
   allowUnfree = true;
 };
in {
 inherit pkgs;
 shell = pkgs.libdill;

 packages = {
   inherit (pkgs) libdill;
 };
}
