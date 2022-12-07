class NoteModel{
  static late String title,subTitle,date;
  static late  int id;
  static var noteModel={
    'note_title':  title,
    'note_subtitle': subTitle,
    'date': date,
    'id': id++,
  };

  //NoteModel({required this.title,required this.subTitle,required this.date,required this.id});

}