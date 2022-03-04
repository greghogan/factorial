;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at
;;
;;     http://www.apache.org/licenses/LICENSE-2.0
;;
;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.

;; This "manifest" file can be passed to 'guix package -m' to reproduce
;; the content of your profile.  This is "symbolic": it only specifies
;; package names.  To reproduce the exact same profile, you also need to
;; capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

;; The following set of packages should be sufficient for development using
;; either gcc or clang, make or ninja, and gdb or lldb. Also included are a
;; command-line utilities for use by a developer in an interactive shell.

(use-modules
 (guix packages)
 (guix utils)
 (gnu packages cmake))

(define-public cmake-latest
  (package
    (inherit cmake)
    (version "3.21.5")
    (source (origin
              (inherit (package-source cmake))
              (uri (string-append "https://cmake.org/files/v"
                                  (version-major+minor version)
                                  "/cmake-" version ".tar.gz"))
              (sha256 (base32 "0zw9525drfgjhsbgqcay940g4gvl29mja7hakz05czc2mfsqfdf7"))))))

(define base-packages
  (concatenate-manifests
   (list
    (specifications->manifest
     '(;; Packages supporting compilation.
       "clang-toolchain"
       "gcc-toolchain@10"
       "make"
       "ninja"

       ;; Packages for interactive user access.
       "bash"
       "binutils"
       "coreutils"
       "diffutils"
       "findutils"
       "gdb"
       "git"
       "grep"
       "less"
       "lldb"
       "patch"
       "vim"

       ;; Packages supporting IDEs.
       "openssh"
       "which"))
    (packages->manifest
     `(;; Custom package releases
       ,cmake-latest)))))
