import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'native_view_platform_interface.dart';

class NativeView {
  Future<String?> getPlatformVersion() {
    return NativeViewPlatform.instance.getPlatformVersion();
  }
}

class NSBox extends StatelessWidget {
  const NSBox({super.key});

  @override
  Widget build(BuildContext context) {
    // This is used in the platform side to register the view.
    const viewType = '@views/native-view';
    // Pass parameters to the platform side.
    final creationParams = <String, dynamic>{};

    return UiKitView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{
        Factory<OneSequenceGestureRecognizer>(
          EagerGestureRecognizer.new,
        ),
      },
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}
