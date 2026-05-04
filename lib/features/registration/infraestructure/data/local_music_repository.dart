import '../../domain/repository/music_repository.dart';

class LocalMusicRepository implements MusicRepository {
  @override
  Future<List<String>> getMusicList() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      'The Beatles',
      'Michael Jackson',
      'Queen',
      'Elvis Presley',
      'Madonna',
      'Elton John',
      'Led Zeppelin',
      'Pink Floyd',
      'Nirvana',
      'Metallica',
      'AC/DC',
      'Eminem',
      'Tupac Shakur',
      'Snoop Dogg',
      'Dr. Dre',
      'Beyoncé',
      'Jay-Z',
      'Taylor Swift',
      'Ed Sheeran',
      'Adele',
      'Drake',
      'The Weeknd',
      'Bad Bunny',
      'Shakira',
      'Luis Miguel',
      'Gustavo Cerati',
      'Charly García',
      'Spinetta',
      'Soda Stereo',
      'Los Prisioneros',
      'Daft Punk',
      'Coldplay',
      'Arctic Monkeys',
      'The Strokes',
      'Radiohead',
      'Gorillaz',
      'Red Hot Chili Peppers',
      'Foo Fighters',
      'Muse',
      'The Killers',
    ];
  }
}
