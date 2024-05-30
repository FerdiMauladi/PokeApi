/// count : 1154
/// next : "https://pokeapi.co/api/v2/pokemon?offset=20&limit=20"
/// previous : null
/// results : [{"name":"bulbasaur","url":"https://pokeapi.co/api/v2/pokemon/1/"},{"name":"ivysaur","url":"https://pokeapi.co/api/v2/pokemon/2/"},{"name":"venusaur","url":"https://pokeapi.co/api/v2/pokemon/3/"},{"name":"charmander","url":"https://pokeapi.co/api/v2/pokemon/4/"},{"name":"charmeleon","url":"https://pokeapi.co/api/v2/pokemon/5/"},{"name":"charizard","url":"https://pokeapi.co/api/v2/pokemon/6/"},{"name":"squirtle","url":"https://pokeapi.co/api/v2/pokemon/7/"},{"name":"wartortle","url":"https://pokeapi.co/api/v2/pokemon/8/"},{"name":"blastoise","url":"https://pokeapi.co/api/v2/pokemon/9/"},{"name":"caterpie","url":"https://pokeapi.co/api/v2/pokemon/10/"},{"name":"metapod","url":"https://pokeapi.co/api/v2/pokemon/11/"},{"name":"butterfree","url":"https://pokeapi.co/api/v2/pokemon/12/"},{"name":"weedle","url":"https://pokeapi.co/api/v2/pokemon/13/"},{"name":"kakuna","url":"https://pokeapi.co/api/v2/pokemon/14/"},{"name":"beedrill","url":"https://pokeapi.co/api/v2/pokemon/15/"},{"name":"pidgey","url":"https://pokeapi.co/api/v2/pokemon/16/"},{"name":"pidgeotto","url":"https://pokeapi.co/api/v2/pokemon/17/"},{"name":"pidgeot","url":"https://pokeapi.co/api/v2/pokemon/18/"},{"name":"rattata","url":"https://pokeapi.co/api/v2/pokemon/19/"},{"name":"raticate","url":"https://pokeapi.co/api/v2/pokemon/20/"}]

class PokemonModel {
  PokemonModel({
      num? count, 
      String? next, 
      dynamic previous, 
      List<Results>? results,}){
    _count = count;
    _next = next;
    _previous = previous;
    _results = results;
}

  PokemonModel.fromJson(dynamic json) {
    _count = json['count'];
    _next = json['next'];
    _previous = json['previous'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
  }
  num? _count;
  String? _next;
  dynamic _previous;
  List<Results>? _results;
PokemonModel copyWith({  num? count,
  String? next,
  dynamic previous,
  List<Results>? results,
}) => PokemonModel(  count: count ?? _count,
  next: next ?? _next,
  previous: previous ?? _previous,
  results: results ?? _results,
);
  num? get count => _count;
  String? get next => _next;
  dynamic get previous => _previous;
  List<Results>? get results => _results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['next'] = _next;
    map['previous'] = _previous;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "bulbasaur"
/// url : "https://pokeapi.co/api/v2/pokemon/1/"

class Results {
  Results({
      String? name, 
      String? url,}){
    _name = name;
    _url = url;
}

  Results.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
  }
  String? _name;
  String? _url;
Results copyWith({  String? name,
  String? url,
}) => Results(  name: name ?? _name,
  url: url ?? _url,
);
  String? get name => _name;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }

}