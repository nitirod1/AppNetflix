import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';

class VideoPlayerPage extends StatefulWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);

  //final String title;

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Video Player",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: BetterPlayer.network(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
        betterPlayerConfiguration: BetterPlayerConfiguration(
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }
}

List<BetterPlayerDataSource> createDataSet() {
  List dataSourceList = <BetterPlayerDataSource>[];
  dataSourceList.add(
    BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
      subtitles: [
        BetterPlayerSubtitlesSource(
          type: BetterPlayerSubtitlesSourceType.network,
          name: "EN",
          urls: [
            "https://dl.dropboxusercontent.com/s/71nzjo2ux3evxqk/example_subtitles.srt"
          ],
        ),
        BetterPlayerSubtitlesSource(
          type: BetterPlayerSubtitlesSourceType.network,
          name: "DE",
          urls: [
            "https://dl.dropboxusercontent.com/s/71nzjo2ux3evxqk/example_subtitles.srt"
          ],
        ),
      ],
    ),
  );

  /*dataSourceList.add(
    BetterPlayerDataSource(BetterPlayerDataSourceType.network,
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
  );
  dataSourceList.add(
    BetterPlayerDataSource(BetterPlayerDataSourceType.network,
        "http://sample.vodobox.com/skate_phantom_flex_4k/skate_phantom_flex_4k.m3u8"),
  );*/
  return dataSourceList;
}

var dataSource = BetterPlayerDataSource(
  BetterPlayerDataSourceType.network,
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  liveStream: false,
  // useHlsSubtitles: true,
  // hlsTrackNames: ["Low quality", "Not so low quality", "Medium quality"],
  subtitles: [
    BetterPlayerSubtitlesSource(
      type: BetterPlayerSubtitlesSourceType.network,
      name: "EN",
      urls: [
        "https://dl.dropboxusercontent.com/s/71nzjo2ux3evxqk/example_subtitles.srt"
      ],
    ),
    BetterPlayerSubtitlesSource(
      type: BetterPlayerSubtitlesSourceType.network,
      name: "DE",
      urls: [
        "https://dl.dropboxusercontent.com/s/71nzjo2ux3evxqk/example_subtitles.srt"
      ],
    ),
  ],
);
