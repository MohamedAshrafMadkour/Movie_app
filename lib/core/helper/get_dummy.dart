import 'package:movie_app/features/main/data/Model/all_films_model.dart';
import 'package:movie_app/features/main/data/Model/cast_model.dart';
import 'package:movie_app/features/main/data/Model/category_model.dart';

AllFilmsModel getDummyFilms() {
  return AllFilmsModel(
    id: 1,
    title: 'title',
    overview: 'overview',
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    voteAverage: 1.0,
    voteCount: 1,
  );
}

List<AllFilmsModel> getDummyFilmsList() {
  return [
    getDummyFilms(),
    getDummyFilms(),
    getDummyFilms(),
    getDummyFilms(),
    getDummyFilms(),
    getDummyFilms(),
    getDummyFilms(),
    getDummyFilms(),
  ];
}

CastModel getDummyCast() {
  return CastModel(
    id: 1,
    name: 'name',
    character: 'character',
    profilePath: 'profilePath',
  );
}

List<CastModel> getDummyFeaturedProductsList() {
  return [
    getDummyCast(),
    getDummyCast(),
    getDummyCast(),
    getDummyCast(),
    getDummyCast(),
    getDummyCast(),
    getDummyCast(),
    getDummyCast(),
  ];
}

CategoryModel getDummyCategory() {
  return CategoryModel(
    id: 1,
    title: 'title',
    overview: 'overview',
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    voteAverage: 1.0,
    voteCount: 1,
  );
}

List<CategoryModel> getDummyCategoryList() {
  return [
    getDummyCategory(),
    getDummyCategory(),
    getDummyCategory(),
    getDummyCategory(),
    getDummyCategory(),
    getDummyCategory(),
    getDummyCategory(),
    getDummyCategory(),
  ];
}
