# Keep SLF4J Logger Binder (used by pusher, just_audio, etc.)
-keep class org.slf4j.** { *; }
-keep class org.slf4j.impl.** { *; }
-dontwarn org.slf4j.**

# Optional: Keep all logging if needed
-keep class com.pusher.** { *; }
-keep class ly.count.android.** { *; }

