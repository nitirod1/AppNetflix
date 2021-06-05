class MovieHistory {
  MovieHistory({
    this.idHistory,
    this.idEpisode,
    this.stopTime,
    this.name,
    this.idMovie,
    this.rate,
    this.year,
    this.isSeries,
    this.posterUrl,
  });

  int idHistory;
  int idEpisode;
  String stopTime;
  String name;
  int idMovie;
  int rate;
  int year;
  bool isSeries;
  String posterUrl;

  factory MovieHistory.fromJson(Map<String, dynamic> json) => MovieHistory(
        idHistory: json["id_history"],
        idEpisode: json["id_episode"],
        stopTime: json["stop_time"],
        name: json["name"],
        idMovie: json["id_movie"],
        rate: json["rate"],
        year: json["year"],
        isSeries: json["is_series"],
        posterUrl: json["poster_url"],
      );

  Map<String, dynamic> toJson() => {
        "id_history": idHistory,
        "id_episode": idEpisode,
        "stop_time": stopTime,
        "name": name,
        "id_movie": idMovie,
        "rate": rate,
        "year": year,
        "is_series": isSeries,
        "poster_url": posterUrl,
      };
}
