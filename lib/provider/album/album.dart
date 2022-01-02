import 'package:gameshot/provider/game/game.dart';
import 'package:gameshot/provider/image/image.dart';

class Album{
  late Game gameDetails;
  late String albumTitle;
  List<Img> albumImages=[];
  late String author;
  late String authorId;


  Album(this.gameDetails, this.albumTitle, this.albumImages, this.author,
      this.authorId);

}