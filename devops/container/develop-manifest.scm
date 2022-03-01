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

;; The full manifest is created from the concatenation of the base manifest,
;; any project-specific dependencies list below, and the custom set of locales
;; listed in this custom-utf8-locales definition.

(use-modules
 (gnu packages base))

(include "develop-manifest-base.scm")

(concatenate-manifests
 (list
  (specifications->manifest
   '(;; Project dependencies
     ))
  base-packages))
