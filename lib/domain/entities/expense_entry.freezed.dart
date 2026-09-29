// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExpenseEntry {

/// null when it hasn't been inserted yet.
 int? get id; double get amount; String get category; DateTime get date; String get note;
/// Create a copy of ExpenseEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseEntryCopyWith<ExpenseEntry> get copyWith => _$ExpenseEntryCopyWithImpl<ExpenseEntry>(this as ExpenseEntry, _$identity);

  /// Serializes this ExpenseEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.category, category) || other.category == category)&&(identical(other.date, date) || other.date == date)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,category,date,note);

@override
String toString() {
  return 'ExpenseEntry(id: $id, amount: $amount, category: $category, date: $date, note: $note)';
}


}

/// @nodoc
abstract mixin class $ExpenseEntryCopyWith<$Res>  {
  factory $ExpenseEntryCopyWith(ExpenseEntry value, $Res Function(ExpenseEntry) _then) = _$ExpenseEntryCopyWithImpl;
@useResult
$Res call({
 int? id, double amount, String category, DateTime date, String note
});




}
/// @nodoc
class _$ExpenseEntryCopyWithImpl<$Res>
    implements $ExpenseEntryCopyWith<$Res> {
  _$ExpenseEntryCopyWithImpl(this._self, this._then);

  final ExpenseEntry _self;
  final $Res Function(ExpenseEntry) _then;

/// Create a copy of ExpenseEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? amount = null,Object? category = null,Object? date = null,Object? note = null,}) {
  return _then(ExpenseEntry(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpenseEntry].
extension ExpenseEntryPatterns on ExpenseEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpenseEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpenseEntry() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpenseEntry value)  $default,){
final _that = this;
switch (_that) {
case _ExpenseEntry():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpenseEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ExpenseEntry() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  double amount,  String category,  DateTime date,  String note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpenseEntry() when $default != null:
return $default(_that.id,_that.amount,_that.category,_that.date,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  double amount,  String category,  DateTime date,  String note)  $default,) {final _that = this;
switch (_that) {
case _ExpenseEntry():
return $default(_that.id,_that.amount,_that.category,_that.date,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  double amount,  String category,  DateTime date,  String note)?  $default,) {final _that = this;
switch (_that) {
case _ExpenseEntry() when $default != null:
return $default(_that.id,_that.amount,_that.category,_that.date,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpenseEntry implements ExpenseEntry {
  const _ExpenseEntry({this.id, required this.amount, required this.category, required this.date, this.note = ''});
  factory _ExpenseEntry.fromJson(Map<String, dynamic> json) => _$ExpenseEntryFromJson(json);

/// null when it hasn't been inserted yet.
@override final  int? id;
@override final  double amount;
@override final  String category;
@override final  DateTime date;
@override@JsonKey() final  String note;

/// Create a copy of ExpenseEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseEntryCopyWith<_ExpenseEntry> get copyWith => __$ExpenseEntryCopyWithImpl<_ExpenseEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpenseEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpenseEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.category, category) || other.category == category)&&(identical(other.date, date) || other.date == date)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,category,date,note);

@override
String toString() {
  return 'ExpenseEntry(id: $id, amount: $amount, category: $category, date: $date, note: $note)';
}


}

/// @nodoc
abstract mixin class _$ExpenseEntryCopyWith<$Res> implements $ExpenseEntryCopyWith<$Res> {
  factory _$ExpenseEntryCopyWith(_ExpenseEntry value, $Res Function(_ExpenseEntry) _then) = __$ExpenseEntryCopyWithImpl;
@override @useResult
$Res call({
 int? id, double amount, String category, DateTime date, String note
});




}
/// @nodoc
class __$ExpenseEntryCopyWithImpl<$Res>
    implements _$ExpenseEntryCopyWith<$Res> {
  __$ExpenseEntryCopyWithImpl(this._self, this._then);

  final _ExpenseEntry _self;
  final $Res Function(_ExpenseEntry) _then;

/// Create a copy of ExpenseEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? amount = null,Object? category = null,Object? date = null,Object? note = null,}) {
  return _then(_ExpenseEntry(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CategoryTotal {

 String get category; double get total;
/// Create a copy of CategoryTotal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryTotalCopyWith<CategoryTotal> get copyWith => _$CategoryTotalCopyWithImpl<CategoryTotal>(this as CategoryTotal, _$identity);

  /// Serializes this CategoryTotal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryTotal&&(identical(other.category, category) || other.category == category)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,total);

@override
String toString() {
  return 'CategoryTotal(category: $category, total: $total)';
}


}

/// @nodoc
abstract mixin class $CategoryTotalCopyWith<$Res>  {
  factory $CategoryTotalCopyWith(CategoryTotal value, $Res Function(CategoryTotal) _then) = _$CategoryTotalCopyWithImpl;
@useResult
$Res call({
 String category, double total
});




}
/// @nodoc
class _$CategoryTotalCopyWithImpl<$Res>
    implements $CategoryTotalCopyWith<$Res> {
  _$CategoryTotalCopyWithImpl(this._self, this._then);

  final CategoryTotal _self;
  final $Res Function(CategoryTotal) _then;

/// Create a copy of CategoryTotal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? total = null,}) {
  return _then(CategoryTotal(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryTotal].
extension CategoryTotalPatterns on CategoryTotal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryTotal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryTotal() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryTotal value)  $default,){
final _that = this;
switch (_that) {
case _CategoryTotal():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryTotal value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryTotal() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String category,  double total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryTotal() when $default != null:
return $default(_that.category,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String category,  double total)  $default,) {final _that = this;
switch (_that) {
case _CategoryTotal():
return $default(_that.category,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String category,  double total)?  $default,) {final _that = this;
switch (_that) {
case _CategoryTotal() when $default != null:
return $default(_that.category,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryTotal implements CategoryTotal {
  const _CategoryTotal({required this.category, required this.total});
  factory _CategoryTotal.fromJson(Map<String, dynamic> json) => _$CategoryTotalFromJson(json);

@override final  String category;
@override final  double total;

/// Create a copy of CategoryTotal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryTotalCopyWith<_CategoryTotal> get copyWith => __$CategoryTotalCopyWithImpl<_CategoryTotal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryTotalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryTotal&&(identical(other.category, category) || other.category == category)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,total);

@override
String toString() {
  return 'CategoryTotal(category: $category, total: $total)';
}


}

/// @nodoc
abstract mixin class _$CategoryTotalCopyWith<$Res> implements $CategoryTotalCopyWith<$Res> {
  factory _$CategoryTotalCopyWith(_CategoryTotal value, $Res Function(_CategoryTotal) _then) = __$CategoryTotalCopyWithImpl;
@override @useResult
$Res call({
 String category, double total
});




}
/// @nodoc
class __$CategoryTotalCopyWithImpl<$Res>
    implements _$CategoryTotalCopyWith<$Res> {
  __$CategoryTotalCopyWithImpl(this._self, this._then);

  final _CategoryTotal _self;
  final $Res Function(_CategoryTotal) _then;

/// Create a copy of CategoryTotal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? total = null,}) {
  return _then(_CategoryTotal(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$MonthlySummary {

 DateTime get month; double get grandTotal; List<CategoryTotal> get byCategory;
/// Create a copy of MonthlySummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthlySummaryCopyWith<MonthlySummary> get copyWith => _$MonthlySummaryCopyWithImpl<MonthlySummary>(this as MonthlySummary, _$identity);

  /// Serializes this MonthlySummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthlySummary&&(identical(other.month, month) || other.month == month)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal)&&const DeepCollectionEquality().equals(other.byCategory, byCategory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,month,grandTotal,const DeepCollectionEquality().hash(byCategory));

@override
String toString() {
  return 'MonthlySummary(month: $month, grandTotal: $grandTotal, byCategory: $byCategory)';
}


}

/// @nodoc
abstract mixin class $MonthlySummaryCopyWith<$Res>  {
  factory $MonthlySummaryCopyWith(MonthlySummary value, $Res Function(MonthlySummary) _then) = _$MonthlySummaryCopyWithImpl;
@useResult
$Res call({
 DateTime month, double grandTotal, List<CategoryTotal> byCategory
});




}
/// @nodoc
class _$MonthlySummaryCopyWithImpl<$Res>
    implements $MonthlySummaryCopyWith<$Res> {
  _$MonthlySummaryCopyWithImpl(this._self, this._then);

  final MonthlySummary _self;
  final $Res Function(MonthlySummary) _then;

/// Create a copy of MonthlySummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? month = null,Object? grandTotal = null,Object? byCategory = null,}) {
  return _then(MonthlySummary(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as DateTime,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as double,byCategory: null == byCategory ? _self.byCategory : byCategory // ignore: cast_nullable_to_non_nullable
as List<CategoryTotal>,
  ));
}

}


/// Adds pattern-matching-related methods to [MonthlySummary].
extension MonthlySummaryPatterns on MonthlySummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MonthlySummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MonthlySummary() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MonthlySummary value)  $default,){
final _that = this;
switch (_that) {
case _MonthlySummary():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MonthlySummary value)?  $default,){
final _that = this;
switch (_that) {
case _MonthlySummary() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime month,  double grandTotal,  List<CategoryTotal> byCategory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MonthlySummary() when $default != null:
return $default(_that.month,_that.grandTotal,_that.byCategory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime month,  double grandTotal,  List<CategoryTotal> byCategory)  $default,) {final _that = this;
switch (_that) {
case _MonthlySummary():
return $default(_that.month,_that.grandTotal,_that.byCategory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime month,  double grandTotal,  List<CategoryTotal> byCategory)?  $default,) {final _that = this;
switch (_that) {
case _MonthlySummary() when $default != null:
return $default(_that.month,_that.grandTotal,_that.byCategory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MonthlySummary implements MonthlySummary {
  const _MonthlySummary({required this.month, required this.grandTotal, required  List<CategoryTotal> byCategory}): _byCategory = byCategory;
  factory _MonthlySummary.fromJson(Map<String, dynamic> json) => _$MonthlySummaryFromJson(json);

@override final  DateTime month;
@override final  double grandTotal;
 final  List<CategoryTotal> _byCategory;
@override List<CategoryTotal> get byCategory {
  if (_byCategory is EqualUnmodifiableListView) return _byCategory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_byCategory);
}


/// Create a copy of MonthlySummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonthlySummaryCopyWith<_MonthlySummary> get copyWith => __$MonthlySummaryCopyWithImpl<_MonthlySummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MonthlySummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonthlySummary&&(identical(other.month, month) || other.month == month)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal)&&const DeepCollectionEquality().equals(other._byCategory, _byCategory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,month,grandTotal,const DeepCollectionEquality().hash(_byCategory));

@override
String toString() {
  return 'MonthlySummary(month: $month, grandTotal: $grandTotal, byCategory: $byCategory)';
}


}

/// @nodoc
abstract mixin class _$MonthlySummaryCopyWith<$Res> implements $MonthlySummaryCopyWith<$Res> {
  factory _$MonthlySummaryCopyWith(_MonthlySummary value, $Res Function(_MonthlySummary) _then) = __$MonthlySummaryCopyWithImpl;
@override @useResult
$Res call({
 DateTime month, double grandTotal, List<CategoryTotal> byCategory
});




}
/// @nodoc
class __$MonthlySummaryCopyWithImpl<$Res>
    implements _$MonthlySummaryCopyWith<$Res> {
  __$MonthlySummaryCopyWithImpl(this._self, this._then);

  final _MonthlySummary _self;
  final $Res Function(_MonthlySummary) _then;

/// Create a copy of MonthlySummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? month = null,Object? grandTotal = null,Object? byCategory = null,}) {
  return _then(_MonthlySummary(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as DateTime,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as double,byCategory: null == byCategory ? _self._byCategory : byCategory // ignore: cast_nullable_to_non_nullable
as List<CategoryTotal>,
  ));
}


}

// dart format on
