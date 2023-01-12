import 'package:berna_libary/core/presenters/widgets/core_api_button/interface/i_core_api_button_use_case.dart';
import 'package:berna_libary/core/presenters/widgets/core_api_button/use_case/core_api_button_use_case.dart';
import 'package:flutter/material.dart';

class CoreApiButton extends StatefulWidget {
  final Size size;
  final String text;
  final Future<bool?> Function() onTap;

  const CoreApiButton({
    super.key,
    required this.text,
    required this.size,
    required this.onTap,
  });

  @override
  State<CoreApiButton> createState() => _CoreApiButtonState();
}

class _CoreApiButtonState extends State<CoreApiButton>
    with TickerProviderStateMixin {
  late final ICoreApiButtonUseCase useCase;
  @override
  void initState() {
    super.initState();
    useCase = CoreApiButtonUseCase(
      setState: setState,
      text: widget.text,
      mounted: mounted,
    );
  }

  @override
  void dispose() {
    super.dispose();
    useCase.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: useCase.isLoading.value || useCase.hasError.value
                ? () {}
                : () async {
                    useCase.changeLoading(mounted);
                    widget.onTap().then((value) {
                      useCase.changeLoading(mounted);
                      if (value != null && value == false) {
                        useCase.changeError(mounted);
                        return;
                      }
                      if (value != null && value == true) {
                        useCase.changeCorrect(mounted);
                        return;
                      }
                    });
                  },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              width: useCase.isLoading.value ? 70 : widget.size.width,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: useCase.color,
                  borderRadius: BorderRadius.circular(
                    100,
                  ),
                ),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 800),
                  child: useCase.child,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
