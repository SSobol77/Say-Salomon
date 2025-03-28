#include <cassert>
#include "../src/say.cpp"

int main() {
    std::string result = text_to_speech("test");
    assert(!result.empty());
    return 0;
}
