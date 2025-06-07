class Question {
const Question(this.text, this.answer) ;

  final String text ;
  final List<String> answer ;

  List<String> getShuffle () {
    final shuffleList = List.of(answer) ;
    shuffleList.shuffle();
    return shuffleList;
  }
}