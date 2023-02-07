import 'package:audioplayers/audioplayers.dart';
import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:berna_libary/modules/playlist/blocs/music_bloc/music_bloc.dart';
import 'package:berna_libary/modules/playlist/presenters/widgets/play_music_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MusicPage extends StatefulWidget {
  final AudioPlayer audioPlayer;

  const MusicPage({
    super.key,
    required this.audioPlayer,
  });

  static const route = "/music-page";

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 30,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                musicBloc.music?.image ?? "",
                height: size.height * 0.45,
                fit: BoxFit.fill,
                width: size.width,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppColors.white,
                  height: size.height * 0.45,
                  width: size.width,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SizedBox(
                width: size.width,
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  duration.inSeconds.toString(),
                ),
                Text(
                  position.inSeconds.toString(),
                )
              ],
            ),
            PlayMusicButton(
              onTap: () {},
              audioPlayer: widget.audioPlayer,
            )
          ],
        ),
      ),
    );
  }
}
