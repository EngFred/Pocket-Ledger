# =============================================================================
# Pocket Ledger — R8 / ProGuard rules for release builds
# =============================================================================
#
# R8 only processes Java/Kotlin bytecode. Dart code is AOT-compiled to native
# machine code by the Dart compiler and is NOT affected by these rules.
#
# The rules below exist for:
#   1. Flutter engine's JNI bridge (reflective plugin lookup)
#   2. Android-side code in Flutter plugins
#   3. JNI boundaries (classes invoked from native code)
#   4. Suppressing warnings for classes referenced only from native code
#
# Last reviewed against:
#   Flutter 3.22+, flutter_secure_storage 9.x, sqflite 2.3.x,
#   shared_preferences 2.2.x, hive_ce 2.x, dio 5.x
# =============================================================================

# ----- Attribute preservation ------------------------------------------------
# Without these, R8 strips metadata that reflective code depends on. Cheap to
# keep, catastrophic to lose. This is the single most important block.

-keepattributes *Annotation*
-keepattributes AnnotationDefault
-keepattributes Signature
-keepattributes InnerClasses
-keepattributes EnclosingMethod
-keepattributes Exceptions
-keepattributes SourceFile,LineNumberTable
-keepattributes RuntimeVisibleAnnotations
-keepattributes RuntimeVisibleParameterAnnotations
-keepattributes RuntimeVisibleTypeAnnotations

# Keep line numbers but rename the source file so crash reports stay usable
# without leaking your package layout.
-renamesourcefileattribute SourceFile


# ----- Flutter engine --------------------------------------------------------
# The Flutter engine looks up plugins and channels reflectively via
# GeneratedPluginRegistrant. If R8 strips these, the app crashes on startup
# with "Unable to instantiate plugin" or a blank screen.

-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**   { *; }
-keep class io.flutter.view.**   { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.** {
    native <methods>;
}

# JNI bridge — called from C++ in libflutter.so.
-keep class io.flutter.embedding.engine.FlutterJNI { *; }
-keep class io.flutter.embedding.engine.FlutterEngine { *; }

# Generated plugin registrant — reflects every plugin's registerWith method.
-keep class com.example.pocket_ledger.GeneratedPluginRegistrant { *; }

# Any plugin that declares a MethodChannel needs its class + native methods
# intact; the channel name is a string, but the class is looked up by name.
-keep class * extends io.flutter.plugin.common.MethodChannel$MethodCallHandler { *; }
-keep class * implements io.flutter.plugin.common.MethodCallHandler { *; }
-keep class * implements io.flutter.plugin.common.EventChannel$StreamHandler { *; }
-keep class * implements io.flutter.plugin.common.MessageCodec { *; }


# ----- androidx.security:security-crypto (flutter_secure_storage) -----------
# FlutterSecureStorage uses EncryptedSharedPreferences under the hood, which
# uses Tink. Tink relies heavily on reflection for its crypto primitives
# (KeyManager, KeyTemplate, streaming AEADs). Stripping these will compile
# fine and then throw at runtime the first time you read a token.

-keep class com.google.crypto.tink.** { *; }
-keep class androidx.security.crypto.** { *; }
-keep class androidx.security.crypto.MasterKey { *; }
-keep class androidx.security.crypto.EncryptedSharedPreferences { *; }

# Tink's key managers are registered reflectively via their class names in
# Tink's internal registry. Keep any class that ends in "KeyManager" or
# "KeyTemplate" — this covers built-in and platform-managed keys.
-keep class * extends com.google.crypto.tink.KeyManager { *; }
-keep class * extends com.google.crypto.tink.KeyManagerBase { *; }

# Prevent R8 from warning about Tink's optional dependencies (protobuf-lite,
# which Flutter doesn't pull in).
-dontwarn com.google.crypto.tink.**
-dontwarn com.google.protobuf.**
-dontwarn javax.annotation.**


# ----- androidx.sqlite / sqflite ---------------------------------------------
# sqflite talks to the Android SQLiteDatabase over JNI and loads its Kotlin
# helper via reflection.

-keep class com.tekartik.sqflite.** { *; }
-keep class android.database.** { *; }
-keep class android.database.sqlite.** { *; }
-keep class net.sqlcipher.** { *; }        # only if you ever add encrypted SQLite
-dontwarn net.sqlcipher.**


# ----- shared_preferences ----------------------------------------------------
# Uses DataStore and AndroidX; plugin class is loaded by name from the
# GeneratedPluginRegistrant.
-keep class io.flutter.plugins.sharedpreferences.** { *; }


# ----- hive_ce ---------------------------------------------------------------
# Hive CE's Flutter integration uses path_provider (Kotlin). No native Android
# code in Hive itself — Dart only — but the path_provider helper is Kotlin.
-keep class io.flutter.plugins.pathprovider.** { *; }


# ----- Play Core (referenced by Flutter engine) ------------------------------
# The Flutter engine references Play Core for deferred components and split
# installs. Flutter apps that don't use those features don't ship the library,
# but R8 still sees the references and warns. These rules silence the noise.

-dontwarn com.google.android.play.core.**
-dontwarn com.google.android.play.core.splitcompat.SplitCompatApplication
-dontwarn com.google.android.play.core.splitinstall.**
-dontwarn com.google.android.play.core.tasks.**
-dontwarn io.flutter.embedding.engine.deferredcomponents.**


# ----- Kotlin ----------------------------------------------------------------
# Kotlin metadata and the Kotlin stdlib need to survive R8. The stdlib ships
# its own consumer rules, but the metadata attribute is our responsibility.

-keep class kotlin.Metadata { *; }
-keepclassmembers class **$WhenMappings {
    <fields>;
}
-keepclassmembers class kotlin.Metadata {
    public <methods>;
}

# Coroutines use reflection to find the Main dispatcher on Android.
-dontwarn kotlinx.coroutines.**
-keep class kotlinx.coroutines.android.AndroidDispatcherFactory { *; }
-keep class kotlinx.coroutines.android.AndroidExceptionPreHandler { *; }


# ----- Parcelable / Serializable ---------------------------------------------
# Any class written to a Bundle, Intent, or saved instance state must keep its
# CREATOR field and its no-arg constructor.
-keepclassmembers class * implements android.os.Parcelable {
    public static final ** CREATOR;
}
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    !static !transient <fields>;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}


# ----- Enum safety -----------------------------------------------------------
# R8 can inline enum values, breaking `Enum.valueOf()` calls. Keep the method
# and the fields on every enum.
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
    **[] $VALUES;
    public *;
}


# ----- Native methods --------------------------------------------------------
# Any class with a `native` method signature is called from C/C++. R8 can't
# see those call sites, so it may strip the class. Keep them all.
-keepclasseswithmembernames,includedescriptorclasses class * {
    native <methods>;
}


# ----- Reflection safety net ------------------------------------------------
# Custom views inflated from XML need their constructors. Not strictly
# applicable to a Flutter app, but cheap insurance if a plugin pulls one in.
-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet);
}
-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet, int);
}


# ----- Debugging aid ---------------------------------------------------------
# Emit a mapping file so crash reports from Play Console can be de-obfuscated.
# The file lands at android/app/build/outputs/mapping/release/mapping.txt
# Upload it to Play Console on every release.
-printmapping build/outputs/mapping/release/mapping.txt


# ----- Optional: strip logging in release ------------------------------------
# Uncomment when you're ready to ship. Assumes you use android.util.Log
# directly. Dart-side debugPrint is a no-op in release builds already.
#
# -assumenosideeffects class android.util.Log {
#     public static *** d(...);
#     public static *** v(...);
#     public static *** i(...);
# }