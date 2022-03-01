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

;; This channel file can be passed to 'guix pull -C' or to
;; 'guix time-machine -C' to obtain the Guix revision that was
;; used to populate this profile.

;; The commit ID can be changed to either a release or rolling version.
;; Recent releases are listed in the following table.

;; Tag      Date         Commit
;; ------   --------     ----------------------------------------
;; v1.3.0   2021/05/11   a0178d34f582b50e9bdbb0403943129ae5b560ff

(list
     (channel
       (name 'guix)
       (url "https://git.savannah.gnu.org/git/guix.git")
       (branch "master")
       (commit
         "88d2161517af607ae4d9e33bed5683da036abed2")
       (introduction
         (make-channel-introduction
           "9edb3f66fd807b096b48283debdcddccfea34bad"
           (openpgp-fingerprint
             "BBB0 2DDF 2CEA F6A8 0D1D  E643 A2A0 6DF2 A33A 54FA"))))
)
