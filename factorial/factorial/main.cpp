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

#include <cxxopts.hpp>

int main(int argc, char *argv[]) {
  cxxopts::Options options("factorial", "Compute the product over a range of consecutive integers");
  options.add_options()
      ("n,number", "Int param", cxxopts::value<uint64_t>());
  auto args = options.parse(argc, argv);

  // must test for count of 'number'

  auto number = args["number"].as<uint64_t>();
  std::cout << number << std::endl;

  auto result = factorial_gmp(number);
  std::cout << result.get_str() << std::endl;

  return 0;
}
