package io.flutter.plugins;

import androidx.annotation.Keep;
import androidx.annotation.NonNull;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry;

/**
 * Generated file. Do not edit.
 * This file is generated by the Flutter tool based on the
 * plugins that support the Android platform.
 */
@Keep
public final class GeneratedPluginRegistrant {
  public static void registerWith(@NonNull FlutterEngine flutterEngine) {
    ShimPluginRegistry shimPluginRegistry = new ShimPluginRegistry(flutterEngine);
      io.flutter.plugins.firebaseauth.FirebaseAuthPlugin.registerWith(shimPluginRegistry.registrarFor("io.flutter.plugins.firebaseauth.FirebaseAuthPlugin"));
    flutterEngine.getPlugins().add(new io.flutter.plugins.firebase.core.FirebaseCorePlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.googlesignin.GoogleSignInPlugin());
    flutterEngine.getPlugins().add(new com.csdcorp.speech_to_text.SpeechToTextPlugin());
  }
}
