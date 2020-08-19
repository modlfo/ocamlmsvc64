#!/usr/bin/env sh

rm /usr/bin/link.exe

wget https://github.com/fdopen/opam-repository-mingw/releases/download/0.0.0.2/opam64.tar.xz
tar -xf 'opam64.tar.xz'
bash opam64/install.sh

opam init default "git://github.com/fdopen/opam-repository-mingw.git#opam2" -c "ocaml-variants.4.09.1+msvc64" --disable-sandboxing --no-setup --root "C:\\ocaml"
eval $(opam config env --root "C:\\ocaml")

opam install pla containers.2.8.1 ppx_deriving menhir yojson --root "C:\\ocaml" -y
opam pin add stdlib-shims --dev-repo --root "C:\\ocaml" -y
opam install ounit merlin ocamlformat.0.15.0 qtest --root "C:\\ocaml" -y
opam pin add ocaml-lsp-server https://github.com/ocaml/ocaml-lsp.git --root "C:\\ocaml" -y
