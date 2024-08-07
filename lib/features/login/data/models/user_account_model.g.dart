// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAccountModel _$UserAccountModelFromJson(Map<String, dynamic> json) =>
    UserAccountModel(
      avatar: json['avatar'] == null
          ? null
          : Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
      iso6391: json['iso_639_1'] as String?,
      iso31661: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
      includeAdult: json['include_adult'] as bool?,
      userName: json['username'] as String?,
    );

Map<String, dynamic> _$UserAccountModelToJson(UserAccountModel instance) =>
    <String, dynamic>{
      'avatar': instance.avatar?.toJson(),
      'id': instance.id,
      'iso_639_1': instance.iso6391,
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
      'include_adult': instance.includeAdult,
      'username': instance.userName,
    };

Avatar _$AvatarFromJson(Map<String, dynamic> json) => Avatar(
      gravatar: json['gravatar'] == null
          ? null
          : Gravatar.fromJson(json['gravatar'] as Map<String, dynamic>),
      tmdb: json['tmdb'] == null
          ? null
          : Tmdb.fromJson(json['tmdb'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AvatarToJson(Avatar instance) => <String, dynamic>{
      'gravatar': instance.gravatar?.toJson(),
      'tmdb': instance.tmdb?.toJson(),
    };

Gravatar _$GravatarFromJson(Map<String, dynamic> json) => Gravatar(
      hash: json['hash'] as String?,
    );

Map<String, dynamic> _$GravatarToJson(Gravatar instance) => <String, dynamic>{
      'hash': instance.hash,
    };

Tmdb _$TmdbFromJson(Map<String, dynamic> json) => Tmdb(
      avatarPath: json['avatar_path'] as String?,
    );

Map<String, dynamic> _$TmdbToJson(Tmdb instance) => <String, dynamic>{
      'avatar_path': instance.avatarPath,
    };
