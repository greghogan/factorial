/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <gmpxx.h>

uint64_t factorial_naive(uint64_t number) {
  uint64_t result = 1;
  while (number > 1) {
    result *= number;
    number--;
  }
  return result;
}

mpz_class factorial_gmp_loop(uint64_t number) {
  mpz_class result = 1;
  while (number > 1) {
    result *= number;
    number--;
  }
  return result;
}

mpz_class factorial_gmp(uint64_t number) {
  mpz_class result;
  return result.factorial(number);
}
