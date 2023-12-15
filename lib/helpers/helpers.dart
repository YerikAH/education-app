class Helpers {
  String toFirstCapitalizeCase(String input) {
    if (input.isEmpty) {
      return '';
    }

    String result = input.toLowerCase();
    result = result[0].toUpperCase() + result.substring(1);

    return result;
  }

  String toCapitalizeCase(String input) {
    if (input.isEmpty) {
      return '';
    }
    List<String> words = input.split(' ');
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] =
            words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
      }
    }
    String result = words.join(' ');

    return result;
  }

  String getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate =
        '${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year.toString()}';
    return formattedDate;
  }
}
