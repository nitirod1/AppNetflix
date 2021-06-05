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
