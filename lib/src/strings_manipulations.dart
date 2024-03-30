const vowels = ["a", "e", "i", "o", "u"];

/// Checks if the verb ends with a constant vowel constant
bool _isConsonantVowelConsonant(String verb) {
  if (verb.length < 3) {
    return false;
  }
  final lastLetters = verb.substring(verb.length - 3).toLowerCase();

  return !vowels.contains(lastLetters[0]) &&
      vowels.contains(lastLetters[1]) &&
      !vowels.contains(lastLetters[2]) &&
      lastLetters[2] != "y";
}

/// Returns the string with the first character in upper case
String titled(String string) => string[0].toUpperCase() + string.substring(1);

/// Returns the string when each word starts with a capital letter
String titledEach(String string) => string.split(" ").map(titled).join(" ");

/// Returns the string with "a" or "an" in the beginning
String article(String string) =>
    vowels.contains(string[0].toLowerCase()) ? "an $string" : "a $string";

/// Returns the verb with the "ing" suffix
String toGerund(String verb) => verb.endsWith("e")
    ? "${verb.substring(0, verb.length - 1)}ing"
    : _isConsonantVowelConsonant(verb)
        ? "$verb${verb[verb.length - 1]}ing"
        : "${verb}ing";
