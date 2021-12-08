import 'package:flutter/material.dart';

class CustomFutureBuilder<T> extends StatelessWidget {
  ///
  ///`future` and `onData` must not be null
  ///
  ///if `onLoading` is null, a progress indicator with `loadingText` will be shown
  const CustomFutureBuilder({
    Key? key,
    required this.future,
    required this.onData,
    this.onLoading,
    this.onError,
    this.loadingText,
  }) : super(key: key);
  final Future<T> future;
  final Widget Function(BuildContext context, T? data) onData;
  final WidgetBuilder? onLoading;
  final Widget Function(BuildContext context)? onError;
  final String? loadingText;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done ||
            !snapshot.hasData) {
          if (onLoading != null) return onLoading!(context);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (loadingText != null)
                  Text(
                    loadingText!,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                if (loadingText != null) const SizedBox(height: 10),
                const LinearProgressIndicator(),
              ],
            ),
          );
        }
        if (snapshot.hasError) {
          if (onError != null) return onError!(context);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  snapshot.error.toString(),
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          );
        }
        return onData(context, snapshot.data);
      },
    );
  }
}
