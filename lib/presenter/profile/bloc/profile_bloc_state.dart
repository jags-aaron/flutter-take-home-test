import 'package:equatable/equatable.dart';
import 'package:flutter_take_home/domain/entities/user.dart';

enum ProfileBlocResult {
  initial,
  loading,
  error,
  userDataRetrieved,
}

class ProfileBlocState extends Equatable {
  const ProfileBlocState({
    this.status = ProfileBlocResult.initial,
    this.user,
    this.error,
  });

  final ProfileBlocResult? status;
  final User? user;
  final String? error;

  @override
  List<Object?> get props => [
    status,
    user,
    error,
  ];

  ProfileBlocState copyWith({
    required ProfileBlocResult status,
    User? user,
    String? error,
  }) {
    return ProfileBlocState(
      status: status,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }
}
