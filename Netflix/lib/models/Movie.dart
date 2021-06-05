class MoviePoster {
  String genresName;
  int idMovie;
  String name;
  String posterUrl;

  MoviePoster({this.genresName, this.idMovie, this.name, this.posterUrl});

  MoviePoster.fromJson(Map<String, dynamic> json) {
    genresName = json['genres_name'];
    idMovie = json['id_movie'];
    name = json['name'];
    posterUrl = json['poster_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['genres_name'] = this.genresName;
    data['id_movie'] = this.idMovie;
    data['name'] = this.name;
    data['poster_url'] = this.posterUrl;
    return data;
  }
}

class Movie {
  int idMovie;
  String name;
  String posterUrl;

  Movie({this.idMovie, this.name, this.posterUrl});

  Movie.fromJson(Map<String, dynamic> json) {
    idMovie = json['id_movie'];
    name = json['name'];
    posterUrl = json['poster_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_movie'] = this.idMovie;
    data['name'] = this.name;
    data['poster_url'] = this.posterUrl;
    return data;
  }
}

class MovieDetail {
  MovieDetail({
    this.idMovie,
    this.name,
    this.actors,
    this.directors,
    this.year,
    this.rate,
    this.genres,
    this.description,
    this.noSs,
    this.isSeries,
    this.myList,
    this.posterUrl,
  });

  int idMovie;
  String name;
  List<Actor> actors;
  List<Actor> directors;
  int year;
  int rate;
  List<Actor> genres;
  String description;
  int noSs;
  bool isSeries;
  bool myList;
  String posterUrl;

  factory MovieDetail.fromJson(Map<String, dynamic> json) => MovieDetail(
        idMovie: json["id_movie"],
        name: json["name"],
        actors: List<Actor>.from(json["actors"].map((x) => Actor.fromJson(x))),
        directors:
            List<Actor>.from(json["directors"].map((x) => Actor.fromJson(x))),
        year: json["year"],
        rate: json["rate"],
        genres: List<Actor>.from(json["genres"].map((x) => Actor.fromJson(x))),
        description: json["description"],
        noSs: json["no_ss"],
        isSeries: json["is_series"],
        myList: json["my_list"],
        posterUrl: json["poster_url"],
      );

  Map<String, dynamic> toJson() => {
        "id_movie": idMovie,
        "name": name,
        "actors": List<dynamic>.from(actors.map((x) => x.toJson())),
        "directors": List<dynamic>.from(directors.map((x) => x.toJson())),
        "year": year,
        "rate": rate,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "description": description,
        "no_ss": noSs,
        "is_series": isSeries,
        "my_list": myList,
        "poster_url": posterUrl,
      };
}

class Actor {
  Actor({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Actor.fromJson(Map<String, dynamic> json) => Actor(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
