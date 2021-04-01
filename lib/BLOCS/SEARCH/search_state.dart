

import 'package:gssi/SRC/models.dart';

class SearchState {
  final bool isLoading;
  final bool hasError;
  final String error;
  final List<Countries> country;

  SearchState({this.isLoading, this.hasError, this.error, this.country});

  factory SearchState.initial() {
    return SearchState(
      country: [],
      isLoading: false,
      error: '',
      hasError: false,
    );
  }

  factory SearchState.loading() {
    return SearchState(
      country: [],
      isLoading: true,
      error: '',
      hasError: false,
    );
  }

  factory SearchState.success(List<Countries> countries) {
    return SearchState(
      country: countries,
      isLoading: false,
      error: '',
      hasError: false,
    );
  }

  factory SearchState.error(String error) {
    return SearchState(
      country: [],
      isLoading: false,
      error: error,
      hasError: true,
    );
  }

  @override
  String toString() =>
      'SearchState {countries: ${country.toString}, isLoading: $isLoading, hasError: $hasError}';
}
