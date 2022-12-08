class NoteModel {
  static Map<String, dynamic> noteMap({
    required title,
    required date,
    required subTitle,
    required id,
  }) {
    return {
      'note_title': title,
      'note_subtitle': subTitle,
      'date': date,
      'id': id,
    };
  }
}
