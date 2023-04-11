const vowels = ["a", "e", "i", "o", "u"];

/// Returns the string with the first character in upper case
String titled(String string) => string[0].toUpperCase() + string.substring(1);

/// Returns the string when each word starts with a capital letter
String titledEach(String string) => string.split(" ").map(titled).join(" ");

/// Returns the string with "a" or "an" in the beginning
String article(String string) =>
    vowels.contains(string[0].toLowerCase()) ? "an $string" : "a $string";
