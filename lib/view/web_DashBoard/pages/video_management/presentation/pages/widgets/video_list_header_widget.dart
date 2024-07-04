
import 'package:vidyaveechi_website/view/colors/colors.dart';

import 'video_widgets.dart';

class VideoListHeaderWidget extends StatelessWidget {
  const VideoListHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45,
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              border: Border.all(color: cGrey)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const HeaderRowTextWidgetVideo(
                title: 'No',
              ),
              HeaderRowTextWidgetVideo(
                title: clientSecTe[0],
              ),
              HeaderRowTextWidgetVideo(
                title: clientSecTe[1],
              ),
              HeaderRowTextWidgetVideo(
                title: clientSecTe[2],
              ),
              HeaderRowTextWidgetVideo(
                title: clientSecTe[3],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: HeaderRowTextWidgetVideo(
                  title: clientSecTe[4],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

List<String> clientSecTe = [
  'Thumbnail',
  'Title',
  'Subtitle',
  'Description',
  'Uploaded Date',
];
