class DetailPokemonModel {
  List<Forms>? forms;
  int? height;
  int? weight;
  List<Types>? types;
  List<Stats>? stats;
  List<AbilitiesModel>? abilities;
  List<MovesModel>? moves;
  SpeciesModel? speciesModel;

  DetailPokemonModel(
      {this.forms,
      this.height,
      this.weight,
      this.types,
      this.stats,
      this.abilities,
      this.moves,
      this.speciesModel});

  DetailPokemonModel.fromJson(Map<String, dynamic> json) {
    if (json['forms'] != null) {
      forms = <Forms>[];
      json['forms'].forEach((v) {
        forms!.add(Forms.fromJson(v));
      });
    }
    height = json['height'];
    weight = json['weight'];
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
    if (json['stats'] != null) {
      stats = <Stats>[];
      json['stats'].forEach((v) {
        stats!.add(Stats.fromJson(v));
      });
    }
    if (json['abilities'] != null) {
      abilities = <AbilitiesModel>[];
      json['abilities'].forEach((v) {
        abilities!.add(AbilitiesModel.fromJson(v));
      });
    }
    if (json['moves'] != null) {
      moves = <MovesModel>[];
      json['moves'].forEach((v) {
       moves!.add(MovesModel.fromJson(v));
      });
    }
    speciesModel =
        json['species'] != null ? SpeciesModel.fromJson(json['species']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (forms != null) {
      data['forms'] = forms!.map((v) => v.toJson()).toList();
    }
    data['height'] = height;
    data['weight'] = weight;
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    if (stats != null) {
      data['stats'] = stats!.map((v) => v.toJson()).toList();
    }
    if (abilities != null) {
      data['abilities'] = abilities!.map((v) => v.toJson()).toList();
    }
    if (moves != null) {
      data['moves'] = moves!.map((v) => v.toJson()).toList();
    }
    if (speciesModel != null) {
      data['species'] = speciesModel!.toJson();
    }
    return data;
  }
}

class Forms {
  String? name;
  String? url;

  Forms({this.name, this.url});

  Forms.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Types {
  int? slot;
  Forms? type;

  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null ? Forms.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slot'] = slot;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    return data;
  }
}

class Stats {
  int? baseStat;
  int? effort;
  Forms? stat;

  Stats({this.baseStat, this.effort, this.stat});

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat = json['stat'] != null ? Forms.fromJson(json['stat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_stat'] = baseStat;
    data['effort'] = effort;
    if (stat != null) {
      data['stat'] = stat!.toJson();
    }
    return data;
  }
}

class AbilitiesModel {
  Ability? ability;
  bool? isHidden;
  int? slot;

  AbilitiesModel({this.ability, this.isHidden, this.slot});

  AbilitiesModel.fromJson(Map<String, dynamic> json) {
    ability =
        json['ability'] != null ? Ability.fromJson(json['ability']) : null;
    isHidden = json['is_hidden'];
    slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ability != null) {
      data['ability'] = ability!.toJson();
    }
    data['is_hidden'] = isHidden;
    data['slot'] = slot;
    return data;
  }
}

class Ability {
  String? name;
  String? url;

  Ability({this.name, this.url});

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class SpeciesModel {
  String? name;
  String? url;

  SpeciesModel({this.name, this.url});

  SpeciesModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class MovesModel {
  Move? move;
  List<VersionGroupDetails>? versionGroupDetails;

  MovesModel({this.move, this.versionGroupDetails});

  MovesModel.fromJson(Map<String, dynamic> json) {
    move = json['move'] != null ? Move.fromJson(json['move']) : null;
    if (json['version_group_details'] != null) {
      versionGroupDetails = <VersionGroupDetails>[];
      json['version_group_details'].forEach((v) {
        versionGroupDetails!.add(VersionGroupDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (move != null) {
      data['move'] = move!.toJson();
    }
    if (versionGroupDetails != null) {
      data['version_group_details'] =
          versionGroupDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Move {
  String? name;
  String? url;

  Move({this.name, this.url});

  Move.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class VersionGroupDetails {
  int? levelLearnedAt;
  Move? moveLearnMethod;
  Move? versionGroup;

  VersionGroupDetails(
      {this.levelLearnedAt, this.moveLearnMethod, this.versionGroup});

  VersionGroupDetails.fromJson(Map<String, dynamic> json) {
    levelLearnedAt = json['level_learned_at'];
    moveLearnMethod = json['move_learn_method'] != null
        ? Move.fromJson(json['move_learn_method'])
        : null;
    versionGroup = json['version_group'] != null
        ? Move.fromJson(json['version_group'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['level_learned_at'] = levelLearnedAt;
    if (moveLearnMethod != null) {
      data['move_learn_method'] = moveLearnMethod!.toJson();
    }
    if (versionGroup != null) {
      data['version_group'] = versionGroup!.toJson();
    }
    return data;
  }
}

