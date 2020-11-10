import 'dart:async';
import 'package:english_words/english_words.dart';

class Bloc {
  Set<WordPair> saved = Set<WordPair>();

  // broadcast 여러 스넵샷을 보내줄때 사용
  final _saveController = StreamController<Set<WordPair>>.broadcast();

  get savedStream => _saveController.stream;

  get addCurrentSaved => _saveController.sink.add(saved);

  addToOrRemoveFromSavedList(WordPair item) {
    if (saved.contains(item))
      saved.remove(item);
    else
      saved.add(item);

    // 컨트롤러에 알려줌
    _saveController.sink.add(saved);
  }

  // 스트림 사용시 항상 close 해줘야됨
  dispose() => _saveController.close();
}

var bloc = Bloc();
