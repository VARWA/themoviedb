import 'package:json_annotation/json_annotation.dart';

part 'movie_details_credits.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsCredits {
  MovieDetailsCredits({
    required this.id,
    required this.cast,
    required this.crew,
  });

  final num? id;
  final List<Actor>? cast;
  final List<Employee>? crew;

  factory MovieDetailsCredits.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsCreditsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsCreditsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Actor {
  Actor({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });

  final bool adult;
  final num? gender;
  final num id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final num popularity;
  final String? profilePath;
  final num castId;
  final String character;
  final String creditId;
  final num order;

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);

  Map<String, dynamic> toJson() => _$ActorToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Employee {
  Employee({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.creditId,
    required this.department,
    required this.job,
  });

  final bool adult;
  final num? gender;
  final num id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final num popularity;
  final String? profilePath;
  final String creditId;
  final String department;
  final String job;

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}
