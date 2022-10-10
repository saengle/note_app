import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';
import 'package:flutter_note_app/domain/use_case/get_notes_use_case.dart';
import 'package:flutter_note_app/domain/util/note_order.dart';
import 'package:flutter_note_app/domain/util/order_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_notes_use_case.mocks.dart';

@GenerateMocks([NoteRepository])
void main() {
  test('정렬기능이 잘 동작해야 한다', () async {
    final repository = MockNoteRepository();
    final getNotes = GetNotesUseCase(repository);
    verify(repository.getNotes());

    // 동작을 정의해줌
    when(repository.getNotes()).thenAnswer((_) async => [
          Note(title: 'title', content: 'content', timestamp: 0, color: 1),
          Note(title: 'title2', content: 'content2', timestamp: 2, color: 2),
        ]);

    List<Note> result =
        await getNotes(const NoteOrder.date(OrderType.descending()));

    expect(result, isA<List<Note>>());
    verify(repository.getNotes());

    expect(result.first.timestamp, 2);
    verify(repository.getNotes());

    result = await getNotes(const NoteOrder.date(OrderType.ascending()));
    expect(result.first.timestamp, 0);
    verify(repository.getNotes());

    result = await getNotes(const NoteOrder.title(OrderType.ascending()));
    expect(result.first.title, 'title');
    verify(repository.getNotes());

    result = await getNotes(const NoteOrder.title(OrderType.descending()));
    expect(result.first.title, 'title2');
    verify(repository.getNotes());

    result = await getNotes(const NoteOrder.color(OrderType.ascending()));
    expect(result.first.color, 1);
    verify(repository.getNotes());

    result = await getNotes(const NoteOrder.color(OrderType.descending()));
    expect(result.first.color, 2);
    verify(repository.getNotes());

    verifyNoMoreInteractions(repository); // 이 이상으로 사용을 했는가
  });
}
//테스트 모두 통과.
