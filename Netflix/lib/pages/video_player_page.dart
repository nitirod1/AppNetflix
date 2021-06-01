import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';

class MyHomePage extends StatefulWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);

  //final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Video Player"),
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
  useHlsSubtitles: true,
  hlsTrackNames: ["Low quality", "Not so low quality", "Medium quality"],
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
