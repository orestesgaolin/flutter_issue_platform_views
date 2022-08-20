
import SwiftUI
import Cocoa
import FlutterMacOS
import Foundation

@available(macOS 11.00, *)
public class NativeViewPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "native_view", binaryMessenger: registrar.messenger)
    let instance = NativeViewPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)

    let factory = FLNativeViewFactory(messenger: registrar.messenger)
    registrar.register(factory, withId: "@views/native-view")
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS ")
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}

@available(macOS 11.00, *)
class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger
    
    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }
    
    func create(withViewIdentifier viewId: Int64, arguments args: Any?) -> NSView {
        return NSHostingView(rootView: MyNativeView())
    }
}


@available(macOS 11.00, *)
struct MyNativeView: View {
    @State var size: CGFloat = 1.0
    var body: some View {
        VStack(alignment: .center) {
            Text("Hello from SwiftUI")
                .font(.headline)
            Text("within Flutter")
                .font(.body)
        }
    }
}

@available(macOS 11.00, *)
struct MyNativeView_Previews: PreviewProvider {
    @available(macOS 11.00.0, *)
    static var previews: some View {
        MyNativeView()
    }
}
