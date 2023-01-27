abstract class HomeState {}

class InitialState extends HomeState {}
class Logout extends HomeState {}

class UploadImage extends HomeState {}

class LoginLoading extends HomeState {}

class LoginSucsess extends HomeState {
  String? id;
  LoginSucsess(this.id);
}

class LoginError extends HomeState {}

class RegisterLoading extends HomeState {}

class RegisterSucsess extends HomeState {}

class RegisterError extends HomeState {}

class SaveUserLoading extends HomeState {}

class SaveUserSucsess extends HomeState {}

class SaveUserError extends HomeState {}


class SaveClubLoading extends HomeState {}

class SaveClubSucsess extends HomeState {}

class SaveClubError extends HomeState {}

class GetClubLoading extends HomeState {}

class GetClubSucsess extends HomeState {}

class GetClubError extends HomeState {}

class SaveEventLoading extends HomeState {}

class SaveEventSucsess extends HomeState {}

class SaveEventError extends HomeState {}

class GetEventLoading extends HomeState {}

class GetEventSucsess extends HomeState {}

class GetEventError extends HomeState {}


class GetEventCategoryLoading extends HomeState {}

class GetEventCategorySucsess extends HomeState {}

class GetEventCategoryError extends HomeState {}

class GetAllUsersLoading extends HomeState {}

class GetAllUsersSucsess extends HomeState {}

class GetAllUsersError extends HomeState {}


class StorageImageClubLoading extends HomeState {}

class StorageImageClubSucsess extends HomeState {}

class StorageImageClubError extends HomeState {}



class UpdateLoading extends HomeState {}

class UpdateSucsess extends HomeState {
  int? id;
  UpdateSucsess(this.id);
}

class UpdateError extends HomeState {}

class GetLocationLoading extends HomeState {}

class GetLocationSucsess extends HomeState {}

class GetLocationError extends HomeState {}

class GetVentoryLoading extends HomeState {}

class GetVentorySucsess extends HomeState {}

class GetVentoryError extends HomeState {}

class GetEmployeesLoading extends HomeState {}

class GetEmployeesSucsess extends HomeState {}

class GetEmployeesError extends HomeState {}

class GetEmployeeId extends HomeState {}

class ChangePasswordShowenSucsses extends HomeState {}
