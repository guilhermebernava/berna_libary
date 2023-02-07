import 'package:audioplayers/audioplayers.dart';
import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:berna_libary/modules/playlist/blocs/music_bloc/music_bloc.dart';
import 'package:berna_libary/modules/playlist/presenters/widgets/play_music_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MusicPlayerWidget extends StatefulWidget {
  final Size size;
  final AudioPlayer audioPlayer;

  const MusicPlayerWidget({
    super.key,
    required this.size,
    required this.audioPlayer,
  });

  @override
  State<MusicPlayerWidget> createState() => _MusicPlayerWidgetState();
}

class _MusicPlayerWidgetState extends State<MusicPlayerWidget> {
  final musicBloc = Modular.get<MusicBloc>();
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
    widget.audioPlayer.onDurationChanged.listen(onChangeDuration);
    widget.audioPlayer.onPositionChanged.listen(onChangePosition);
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  musicBloc.music?.image ?? "",
                  width: 50,
                  height: 50,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: AppColors.white,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: widget.size.width * 0.55,
              child: Slider(
                activeColor: AppColors.primary,
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {
                  position = Duration(seconds: value.toInt());
                  await widget.audioPlayer.seek(position);
                },
              ),
            ),
            PlayMusicButton(
              onTap: () {},
              audioPlayer: widget.audioPlayer,
            ),
          ],
        ),
      ),
    );
  }
}
