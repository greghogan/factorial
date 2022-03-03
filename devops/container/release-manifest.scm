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

;;

(use-modules
 ((guix licenses) #:prefix license:)
 (guix packages)
 (guix git-download)
 (guix build-system cmake)
 (gnu packages)
 (gnu packages llvm))

(define factorial
  (package
    (name "factorial")
    (version "20220301")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/greghogan/factorial")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0cjxcfsgbsnxjdi1b19wkbn7z0ifgf2izgahwfnhsz773akzllkk"))))
    (build-system cmake-build-system)
    (native-inputs (list clang-toolchain))
    (home-page "https://github.com/greghogan/factorial")
    (synopsis "Exemplar C++ project demonstrating container-based development")
    (description
     "This simple \"hello world\" project demonstrates
@itemize @bullet
@item
a Linux container built with GNU Guix
@item
compiling with clang or gcc
@item
building with make or ninja
@item
source code linting with clang format and tidy
@item
GitHub actions continuous integration workflow
@end itemize")
    (license license:asl2.0)))

(packages->manifest
 `(,factorial))
