// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState()';
}


}

/// @nodoc
class $UserStateCopyWith<$Res>  {
$UserStateCopyWith(UserState _, $Res Function(UserState) __);
}


/// Adds pattern-matching-related methods to [UserState].
extension UserStatePatterns on UserState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( Error value)?  error,TResult Function( Updating value)?  updating,TResult Function( UpdateSuccess value)?  updateSuccess,TResult Function( UpdateFailure value)?  updateFailure,TResult Function( LoggingOut value)?  loggingOut,TResult Function( LogoutSuccess value)?  logoutSuccess,TResult Function( LogoutFailure value)?  logoutFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Error() when error != null:
return error(_that);case Updating() when updating != null:
return updating(_that);case UpdateSuccess() when updateSuccess != null:
return updateSuccess(_that);case UpdateFailure() when updateFailure != null:
return updateFailure(_that);case LoggingOut() when loggingOut != null:
return loggingOut(_that);case LogoutSuccess() when logoutSuccess != null:
return logoutSuccess(_that);case LogoutFailure() when logoutFailure != null:
return logoutFailure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( Error value)  error,required TResult Function( Updating value)  updating,required TResult Function( UpdateSuccess value)  updateSuccess,required TResult Function( UpdateFailure value)  updateFailure,required TResult Function( LoggingOut value)  loggingOut,required TResult Function( LogoutSuccess value)  logoutSuccess,required TResult Function( LogoutFailure value)  logoutFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case Error():
return error(_that);case Updating():
return updating(_that);case UpdateSuccess():
return updateSuccess(_that);case UpdateFailure():
return updateFailure(_that);case LoggingOut():
return loggingOut(_that);case LogoutSuccess():
return logoutSuccess(_that);case LogoutFailure():
return logoutFailure(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( Error value)?  error,TResult? Function( Updating value)?  updating,TResult? Function( UpdateSuccess value)?  updateSuccess,TResult? Function( UpdateFailure value)?  updateFailure,TResult? Function( LoggingOut value)?  loggingOut,TResult? Function( LogoutSuccess value)?  logoutSuccess,TResult? Function( LogoutFailure value)?  logoutFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Error() when error != null:
return error(_that);case Updating() when updating != null:
return updating(_that);case UpdateSuccess() when updateSuccess != null:
return updateSuccess(_that);case UpdateFailure() when updateFailure != null:
return updateFailure(_that);case LoggingOut() when loggingOut != null:
return loggingOut(_that);case LogoutSuccess() when logoutSuccess != null:
return logoutSuccess(_that);case LogoutFailure() when logoutFailure != null:
return logoutFailure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( UserModel user)?  loaded,TResult Function( String message)?  error,TResult Function()?  updating,TResult Function( UserModel user)?  updateSuccess,TResult Function( String message)?  updateFailure,TResult Function()?  loggingOut,TResult Function()?  logoutSuccess,TResult Function( String message)?  logoutFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.user);case Error() when error != null:
return error(_that.message);case Updating() when updating != null:
return updating();case UpdateSuccess() when updateSuccess != null:
return updateSuccess(_that.user);case UpdateFailure() when updateFailure != null:
return updateFailure(_that.message);case LoggingOut() when loggingOut != null:
return loggingOut();case LogoutSuccess() when logoutSuccess != null:
return logoutSuccess();case LogoutFailure() when logoutFailure != null:
return logoutFailure(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( UserModel user)  loaded,required TResult Function( String message)  error,required TResult Function()  updating,required TResult Function( UserModel user)  updateSuccess,required TResult Function( String message)  updateFailure,required TResult Function()  loggingOut,required TResult Function()  logoutSuccess,required TResult Function( String message)  logoutFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return loading();case Loaded():
return loaded(_that.user);case Error():
return error(_that.message);case Updating():
return updating();case UpdateSuccess():
return updateSuccess(_that.user);case UpdateFailure():
return updateFailure(_that.message);case LoggingOut():
return loggingOut();case LogoutSuccess():
return logoutSuccess();case LogoutFailure():
return logoutFailure(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( UserModel user)?  loaded,TResult? Function( String message)?  error,TResult? Function()?  updating,TResult? Function( UserModel user)?  updateSuccess,TResult? Function( String message)?  updateFailure,TResult? Function()?  loggingOut,TResult? Function()?  logoutSuccess,TResult? Function( String message)?  logoutFailure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.user);case Error() when error != null:
return error(_that.message);case Updating() when updating != null:
return updating();case UpdateSuccess() when updateSuccess != null:
return updateSuccess(_that.user);case UpdateFailure() when updateFailure != null:
return updateFailure(_that.message);case LoggingOut() when loggingOut != null:
return loggingOut();case LogoutSuccess() when logoutSuccess != null:
return logoutSuccess();case LogoutFailure() when logoutFailure != null:
return logoutFailure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements UserState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState.initial()';
}


}




/// @nodoc


class Loading implements UserState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState.loading()';
}


}




/// @nodoc


class Loaded implements UserState {
  const Loaded(this.user);
  

 final  UserModel user;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserState.loaded(user: $user)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 UserModel user
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(Loaded(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,
  ));
}


}

/// @nodoc


class Error implements UserState {
  const Error(this.message);
  

 final  String message;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'UserState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Updating implements UserState {
  const Updating();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Updating);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState.updating()';
}


}




/// @nodoc


class UpdateSuccess implements UserState {
  const UpdateSuccess(this.user);
  

 final  UserModel user;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateSuccessCopyWith<UpdateSuccess> get copyWith => _$UpdateSuccessCopyWithImpl<UpdateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateSuccess&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserState.updateSuccess(user: $user)';
}


}

/// @nodoc
abstract mixin class $UpdateSuccessCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory $UpdateSuccessCopyWith(UpdateSuccess value, $Res Function(UpdateSuccess) _then) = _$UpdateSuccessCopyWithImpl;
@useResult
$Res call({
 UserModel user
});




}
/// @nodoc
class _$UpdateSuccessCopyWithImpl<$Res>
    implements $UpdateSuccessCopyWith<$Res> {
  _$UpdateSuccessCopyWithImpl(this._self, this._then);

  final UpdateSuccess _self;
  final $Res Function(UpdateSuccess) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(UpdateSuccess(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,
  ));
}


}

/// @nodoc


class UpdateFailure implements UserState {
  const UpdateFailure(this.message);
  

 final  String message;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateFailureCopyWith<UpdateFailure> get copyWith => _$UpdateFailureCopyWithImpl<UpdateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'UserState.updateFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $UpdateFailureCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory $UpdateFailureCopyWith(UpdateFailure value, $Res Function(UpdateFailure) _then) = _$UpdateFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UpdateFailureCopyWithImpl<$Res>
    implements $UpdateFailureCopyWith<$Res> {
  _$UpdateFailureCopyWithImpl(this._self, this._then);

  final UpdateFailure _self;
  final $Res Function(UpdateFailure) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UpdateFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoggingOut implements UserState {
  const LoggingOut();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoggingOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState.loggingOut()';
}


}




/// @nodoc


class LogoutSuccess implements UserState {
  const LogoutSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState.logoutSuccess()';
}


}




/// @nodoc


class LogoutFailure implements UserState {
  const LogoutFailure(this.message);
  

 final  String message;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogoutFailureCopyWith<LogoutFailure> get copyWith => _$LogoutFailureCopyWithImpl<LogoutFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'UserState.logoutFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $LogoutFailureCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory $LogoutFailureCopyWith(LogoutFailure value, $Res Function(LogoutFailure) _then) = _$LogoutFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LogoutFailureCopyWithImpl<$Res>
    implements $LogoutFailureCopyWith<$Res> {
  _$LogoutFailureCopyWithImpl(this._self, this._then);

  final LogoutFailure _self;
  final $Res Function(LogoutFailure) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LogoutFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
