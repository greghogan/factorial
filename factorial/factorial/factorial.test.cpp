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

#include <factorial/factorial.hpp>

#include <gtest/gtest.h>

#include <array>

static const std::array<uint64_t, 21> factorial_lookup = {1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800,
                                                          39916800, 479001600, 6227020800, 87178291200, 1307674368000,
                                                          20922789888000, 355687428096000, 6402373705728000,
                                                          121645100408832000, 2432902008176640000};

TEST(FactorialTest, FactorialNaive) {
  for (auto idx = 0U; idx < factorial_lookup.size(); idx++) {
    EXPECT_EQ(factorial_naive(idx), factorial_lookup.at(idx));
  }
}

TEST(FactorialTest, FactorialGmpLoop) {
  for (auto idx = 0U; idx < factorial_lookup.size(); idx++) {
    EXPECT_EQ(factorial_gmp_loop(idx).get_si(), factorial_lookup.at(idx));
  }
}

TEST(FactorialTest, FactorialGmp) {
  for (auto idx = 0U; idx < factorial_lookup.size(); idx++) {
    EXPECT_EQ(factorial_gmp(idx).get_si(), factorial_lookup.at(idx));
  }
}
