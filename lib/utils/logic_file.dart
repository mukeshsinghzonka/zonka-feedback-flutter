class LogicFile {

 static final LogicFile _singleton = LogicFile._internal();
  factory LogicFile() {
    return _singleton;
  }
  
  LogicFile._internal();


 List<String> splitLogicExpression(String expression) {
    // Define a regular expression to match the logical operators
    RegExp regExp = RegExp(r'\s+or\s+|\s+and\s+');

    // Split the expression based on the logical operators
    List<String> parts = expression.split(regExp);

    // Create a list to store the components including the operators
    List<String> components = [];

    // Find all matches for the logical operators
    Iterable<RegExpMatch> matches = regExp.allMatches(expression);

    // Keep track of the current index in the expression
    int currentIndex = 0;

    for (RegExpMatch match in matches) {
      // Add the part before the current operator
      components.add(parts[currentIndex].trim());

      // Add the current operator
      components.add(expression.substring(match.start, match.end).trim());

      // Move to the next part
      currentIndex++;
    }

    // Add the last part of the expression
    if (currentIndex < parts.length) {
      components.add(parts[currentIndex].trim());
    }

    return components;
  }



}