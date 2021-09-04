#include <git2/global.h>
#include <iostream>

int main(int argc, char **argv) {
    const int git2_features = git_libgit2_features();
    std::cout << "GIT_FEATURE_THREADS: " << ((git2_features & GIT_FEATURE_THREADS) != 0) << std::endl;
    std::cout << "GIT_FEATURE_HTTPS: " << ((git2_features & GIT_FEATURE_HTTPS) != 0) << std::endl;
    std::cout << "GIT_FEATURE_SSH: " << ((git2_features & GIT_FEATURE_SSH) != 0) << std::endl;
    std::cout << "GIT_FEATURE_NSEC: " << ((git2_features & GIT_FEATURE_NSEC) != 0) << std::endl;
}
