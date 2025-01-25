{
  description = "Typst port of liantze's AltaCV";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs =
    {
      self,
      nixpkgs,
      ...
    }:
    let
      supportedSystems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      # helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      # nixpkgs instantiated for supported system types
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgsFor.${system};
        in
        {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              git
              just
              nixfmt-rfc-style

              typst
              typstyle

              # fonts
              font-awesome
              roboto-slab
              lato
            ];

            TYPST_FONT_PATHS = pkgs.lib.concatStringsSep ":" [
              "${pkgs.font-awesome}/share/fonts/opentype"
              "${pkgs.roboto-slab}/share/fonts/truetype"
              "${pkgs.lato}/share/fonts/lato"
            ];
          };
        }
      );

      formatter = forAllSystems (system: (nixpkgsFor.${system}).nixfmt-rfc-style);
    };
}
