{ pkgs ? import (fetchTarball "https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz") {
    config = {};
    overlays = [
      (final: prev: {
        uwsgi = prev.uwsgi.overrideAttrs {
        basePlugins = prev.lib.concatStringsSep "," ["python"];
        };
      })
    ];
}
}:
pkgs.mkShell {
    nativeBuildInputs = with pkgs; [
        python311Full
        python311Packages.flask
        python311Packages.pip
        turso-cli
        uwsgi
        sqld
        sqlite
    ];

    buildInputs = with pkgs; [
        python311Packages.flask
        python311Packages.flask_sqlalchemy
        python311Packages.flask_migrate
        python311Packages.python_magic
        python311Packages.requests
        python311Packages.validators
        python311Packages.mpv
        python311Packages.av
        python311Packages.pymupdf
        python311Packages.libarchive-c
        python311Packages.textual
    ];
}
