String titled(String string) => string[0].toUpperCase() + string.substring(1);

String titledEach(String string) => string.split(" ").map(titled).join(" ");
