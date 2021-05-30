#include <cstdint>
#include <fstream>
#include <iostream>
#include <ranges>
#include <sstream>
#include <stdexcept>
#include <string>
#include <string_view>
#include <vector>

auto split(const std::string& string, char delimiter)
    -> std::vector<std::string>
{
    auto fields_view =
        string |
        std::ranges::views::split('\t') |
        std::ranges::views::transform([](auto&& range) {
            return std::string(&*range.begin(), std::ranges::distance(range));
        });
    return std::vector(fields_view.begin(), fields_view.end());
}

auto main(int argc, const char** argv) -> int {
    constexpr auto tropic = 23.43651;
    auto args = std::vector(argv, argv + argc);
    auto file = std::ifstream(args.at(1));
    if (!file) throw std::runtime_error("bad file");
    auto line = std::string();
    auto total_north = std::int64_t(0);
    auto total_tropic = std::int64_t(0);
    auto total_south = std::int64_t(0);
    while (std::getline(file, line)) {
        auto fields = split(line, '\t');
        auto latitude = std::stod(fields.at(4));
        auto population = std::stoll(fields.at(14));
        if (latitude > tropic) {
            total_north += population;
        } else if (latitude < -tropic) {
            total_south += population;
        } else {
            total_tropic += population;
        }
    }
    std::cout << "North:  " << total_north << "\n";
    std::cout << "Tropic: " << total_tropic << "\n";
    std::cout << "South:  " << total_south << "\n";
}
