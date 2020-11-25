import 'package:flutter/material.dart';
import 'package:flutter_base/util/injection.dart';
import 'package:provider/provider.dart';
import 'base_view_model.dart';
import 'status_enum.dart';

class UiManager<T extends BaseModel> extends StatefulWidget {
  final Status status;
  final Widget Function(T) onCompleteChild;
  final Function(T) onModelReady;
  final Function(T) onError;

  UiManager({
    this.onError,
    Key key,
    this.status,
    @required this.onCompleteChild,
    @required this.onModelReady,
  })  : assert(onCompleteChild != null),
        super(key: key);

  @override
  _UiManagerState<T> createState() => _UiManagerState<T>();
}

class _UiManagerState<T extends BaseModel> extends State<UiManager<T>> {
  T model = getIt<T>();
  @override
  void initState() {
    if (mounted) {
      if (widget.onModelReady != null) {
        widget.onModelReady(model);
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(builder: (context, model, child) {
        switch (model.status) {
          case Status.LOADING:
            return Container(
              margin: const EdgeInsets.only(top: 30),
              child: const Center(
                child: const CircularProgressIndicator(),
              ),
            );
            break;
          case Status.COMPLETED:
            return widget.onCompleteChild(model);
            break;
          case Status.ERROR:
            return Container(
              height: height,
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(model.errorMessage),
                  RaisedButton(
                    onPressed: () {
                      if (widget.onError != null) widget.onError(model);
                    },
                    child: const Text(
                      "OK",
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            );
            break;
          default:
            return Container();
        }
      }),
    );
  }
}
