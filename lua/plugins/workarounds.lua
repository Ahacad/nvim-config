-- Environment-specific workarounds for the Cloud Dev Desktop (old glibc, no
-- internet npm). Plain feature config lives in the other plugin files.
--
-- NOTE: nvim-treesitter is intentionally left on LazyVim's default `main`
-- branch. `main` compiles parsers by shelling out to the tree-sitter CLI, and
-- LazyVim auto-installs that CLI via Mason -- but Mason's prebuilt binary links
-- glibc 2.35/2.39 (CDD has 2.34) and won't run. Fix: provide a working CLI on
-- PATH so LazyVim skips the Mason install. nix ships a prebuilt that carries
-- its own glibc closure:
--   nix profile add nixpkgs#tree-sitter   # >= 0.26.1 required by main
-- (`cargo install tree-sitter-cli` does NOT work here: the current CLI needs
-- libclang/bindgen, which isn't installed.) If the broken Mason binary is
-- already present, remove it: `:MasonUninstall tree-sitter-cli`.
--
-- Pinning to the now-archived `master` branch is what *caused* the original
-- breakage: LazyVim is written against the `main` API (TS.get_installed/setup/
-- install), which master lacks, so it errored on every BufReadPost.
return {
  -- blink.cmp's `default` preset binds <Left>/<Right> to select_prev/next,
  -- which eats mini.pairs' trailing <Left> when the menu is open (e.g. editing
  -- Cargo.toml via crates.nvim). Unbind them so the cursor moves normally.
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        ["<Left>"] = {},
        ["<Right>"] = {},
      },
    },
  },
}
