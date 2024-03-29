#!/usr/bin/env sh

rm /usr/bin/link.exe

wget https://github.com/fdopen/opam-repository-mingw/releases/download/0.0.0.2/opam64.tar.xz
tar -xf 'opam64.tar.xz'
bash opam64/install.sh

opam init default "git://github.com/fdopen/opam-repository-mingw.git#opam2" -c "ocaml-variants.4.12.0+msvc64" --disable-sandboxing --no-setup --root "C:\\ocaml"
eval $(opam config env --root "C:\\ocaml")

opam pin add stdlib-shims --dev-repo --root "C:\\ocaml" -y
opam install pla containers ppx_deriving menhir yojson --root "C:\\ocaml" -y
opam install ounit merlin ocamlformat qtest ocaml-lsp-server --root "C:\\ocaml" -y
