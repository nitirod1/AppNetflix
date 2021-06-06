class MovieTop {
  int no;
  int idMovie;
  String name;
  String posterUrl;
  int nViews;

  MovieTop({this.no, this.idMovie, this.name, this.posterUrl, this.nViews});

  MovieTop.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    idMovie = json['id_movie'];
    name = json['name'];
    posterUrl = json['poster_url'];
    nViews = json['n_views'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['id_movie'] = this.idMovie;
    data['name'] = this.name;
    data['poster_url'] = this.posterUrl;
    data['n_views'] = this.nViews;
    return data;
  }
}
