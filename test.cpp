// [[Rcpp::plugins(cpp11)]]
#include <Rcpp.h>
#include <unordered_set>
using namespace Rcpp;

// [[Rcpp::export]]
CharacterVector infixC(CharacterVector haystack, CharacterVector needle)
{
    std::unordered_set<String> needleSet(needle.begin(), needle.end());
    Rcpp::CharacterVector result;
    Rcpp::CharacterVector::iterator it;
    for (it = haystack.begin(); it != haystack.end(); ++it)
    {
        auto search = needleSet.find(*it);
        if (search != needleSet.end())
        {
            result.push_back(*it);
        }
    }
    return result;
}