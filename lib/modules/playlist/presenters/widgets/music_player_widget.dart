import 'package:audioplayers/audioplayers.dart';
import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:berna_libary/modules/playlist/presenters/widgets/play_music_button.dart';
import 'package:flutter/material.dart';

class MusicPlayerWidget extends StatefulWidget {
  final Size size;
  const MusicPlayerWidget({
    super.key,
    required this.size,
  });

  @override
  State<MusicPlayerWidget> createState() => _MusicPlayerWidgetState();
}

class _MusicPlayerWidgetState extends State<MusicPlayerWidget> {
  final audioPlayer = AudioPlayer()..setReleaseMode(ReleaseMode.stop);
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  void onChangeDuration(Duration time) {
    if (mounted) {
      setState(() {
        duration = time;
      });
    }
  }

  void onChangePosition(Duration time) {
    if (mounted) {
      setState(() {
        position = time;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    audioPlayer.onDurationChanged.listen(onChangeDuration);
    audioPlayer.onPositionChanged.listen(onChangePosition);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            //TODO arrumar esse slider e botao
            SizedBox(
              width: widget.size.width * 0.72,
              child: Slider(
                activeColor: AppColors.primary,
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {
                  position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);
                },
              ),
            ),
            PlayMusicButton(
              onTap: () {},
              audioPlayer: audioPlayer,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Text(_printDuration(position)),
            //     Text(_printDuration(duration - position)),
            //   ],
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(5),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       MusicButton(
            //         icon: Icons.keyboard_double_arrow_left,
            //         onTap: () async {
            //           await audioPlayer
            //               .seek(const Duration(milliseconds: 0));
            //         },
            //       ),
            //       MusicButton(
            //         icon: Icons.keyboard_double_arrow_right,
            //         onTap: () {},
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
