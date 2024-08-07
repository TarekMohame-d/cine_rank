import 'package:json_annotation/json_annotation.dart';

part 'user_account_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserAccountModel {
  Avatar? avatar;
  int? id;
  @JsonKey(name: 'iso_639_1')
  String? iso6391;
  @JsonKey(name: 'iso_3166_1')
  String? iso31661;
  String? name;
  @JsonKey(name: 'include_adult')
  bool? includeAdult;
  @JsonKey(name: 'username')
  String? userName;

  UserAccountModel({
    this.avatar,
    this.id,
    this.iso6391,
    this.iso31661,
    this.name,
    this.includeAdult,
    this.userName,
  });

  factory UserAccountModel.fromJson(Map<String, dynamic> json) =>
      _$UserAccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserAccountModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Avatar {
  Gravatar? gravatar;
  Tmdb? tmdb;

  Avatar({this.gravatar, this.tmdb});

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
  Map<String, dynamic> toJson() => _$AvatarToJson(this);
}

@JsonSerializable()
class Gravatar {
  String? hash;

  Gravatar({this.hash});

  factory Gravatar.fromJson(Map<String, dynamic> json) =>
      _$GravatarFromJson(json);
  Map<String, dynamic> toJson() => _$GravatarToJson(this);
}

@JsonSerializable()
class Tmdb {
  @JsonKey(name: 'avatar_path')
  String? avatarPath;

  Tmdb({this.avatarPath});

  factory Tmdb.fromJson(Map<String, dynamic> json) => _$TmdbFromJson(json);
  Map<String, dynamic> toJson() => _$TmdbToJson(this);
}
