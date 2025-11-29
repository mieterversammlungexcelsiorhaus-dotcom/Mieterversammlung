{
  pkgs,
  lib,
  config,
  ...
}:
{
  # https://devenv.sh/languages/
  languages.ruby.enable = true;

  # https://devenv.sh/packages/
  packages = [
    pkgs.jekyll
  ];

  # TODO: install gems inside the Ruby folder automatically on `devenv shell` activation using `enterShell` hook
  # See full reference at https://devenv.sh/reference/options/
}

