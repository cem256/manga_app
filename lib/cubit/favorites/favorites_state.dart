// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorites_cubit.dart';

class FavoritesState extends Equatable {
  final List<Data>? favorites;
  final bool? isFavorite;

  const FavoritesState({this.favorites, this.isFavorite});

  @override
  List<Object?> get props => [favorites, isFavorite];

  FavoritesState copyWith({
    List<Data>? favorites,
    bool? isFavorite,
  }) {
    return FavoritesState(
      favorites: favorites ?? this.favorites,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
