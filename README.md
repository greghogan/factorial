<!--
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->

![build](https://github.com/greghogan/factorial/actions/workflows/build-and-test.yml/badge.svg?branch=main)

This project demonstrates development and continuous integration using a
[Linux Container](https://linuxcontainers.org) specified and built using
[GNU Guix](https://guix.gnu.org).

## Container-based development

Container-based development is a powerful tool for C and C++ development, which
has long benefited from and suffered through designation as the system
language. Package repositories are available for languages including
[Go](https://pkg.go.dev), [Haskell](https://hackage.haskell.org),
[Java](https://search.maven.org), [Javascript](https://www.npmjs.com),
[Julia](https://juliapackages.com), [Perl](https://www.cpan.org),
[PHP](https://packagist.org), [Python](https://pypi.org),
[OCaml](https://opam.ocaml.org), [R](https://cran.r-project.org),
[Ruby](https://rubygems.org), and [Rust](https://crates.io). While Linux
distributions provide a tiny subset of available open source software, for C
and C++ the alternative is to compile and install from source.

Bespoke software installation clutters the developer's filesystem and has no
standard for package removal, a critical step when updating or applying
security patches. The container encapsulates in a single object an entire
filesystem and can be easily downloaded, replaced, deleted, or recreated.

The project-specific container makes sharing C and C++ libraries as simple and
maintainable as in other languages providing a package repository. Each project
defines specific compiler and library versions, and different projects can use
different versions of the same compiler and libraries. The same containers used
for development can run the continuous integration build and tests, with the
same process used to create a container for deployment. Projects can make use
of new compiler and library features or test support for a variety of systems
using an assortment of containers.

## GNU Guix

GNU Guix is a general purpose package manager installed as either a full Linux
operating system or atop a running foreign distribution. Guix operates on a
rolling release schedule, with package additions and updates submitted through
community contributions. Packages are built in a standard, isolated environment
in order to be reproducible, and the content-addressable package artifacts are
referenced by one or more user profiles and assembled using Linux's [overlay
filesystem](https://www.kernel.org/doc/html/latest/filesystems/overlayfs.html).
Guix packages can be built locally or downloaded as signed binary substitutes.

Guix can export a collection of packages in container format. The listing of
packages is specified in a manifest, and can define new packages or modify
existing packages with version updates or a revised configuration. The exported
container is reproducibly defined by a package manifest and channel definition,
which references the Guix repository and commit ID. Rather than updating and
testing individual dependencies, developers can update to a new Guix revision
and expect a coherent set of compatible upgrades. The Guix model has now scaled
to [20,000+ packages](https://guix.gnu.org/en/packages).

## Container-based development using GNU Guix

The container manifest for this project is found in the
[devops/container](devops/container) directory. This project demonstrates use
of both [gcc](https://gcc.gnu.org) and [clang](https://clang.llvm.org), both
[ninja](https://ninja-build.org) and [make](https://www.gnu.org/software/make)
in a [GitHub Actions](https://github.com/features/actions) build matrix. A
standard project would use a single build tool and compiler, though clang also
provides [clang-format](https://clang.llvm.org/docs/ClangFormat.html) and
[clang-tidy](https://clang.llvm.org/extra/clang-tidy).
