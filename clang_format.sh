  find ./ -type f \( -name "*.cpp" -o -name "*.h" -o -name "*.cc" -o -name "*.hpp" \) \
    -not -path "*/build*" \
    -exec clang-format-18 -i -style="{BasedOnStyle: WebKit, SortIncludes: false}" {} \;
