import 'package:url_launcher/url_launcher.dart';
import 'package:vidyaveechi_website/view/constant/const.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/video_management/app_widgets/app_widgets.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/video_management/presentation/bloc/video_creator/video_creator_bloc.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/utils/utils.dart';

import 'video_widgets.dart';

class ListOfVideoWidget extends StatelessWidget {
  const ListOfVideoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<VideoManagerBloc, VideoManagerState>(
        listener: (context, state) {
          if (state is VideoMangerDeleteSuccessState) {
            context.read<VideoManagerBloc>().add(VideoManagerFetchEvent());
            showToast(msg: "Successfully delted");
          }
          if (state is VideoManagerError) {
            showToast(msg: "Something went wrong");
          }
        },
        builder: (context, state) {
          if (state is VideoManagerLoading) {
            return AppWidgets.loadinWidget;
          }
          if (state is VideoManagerLoaded) {
            if (state.videos.isEmpty) {
              return const Center(
                child: Text("No Data Found"),
              );
            }
            return ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => launchUrl(Uri.parse(state.videos[index].url)),
                    onDoubleTap: () {
                      context.read<VideoCreatorBloc>().add(InitialEvent());
                      createVideoDialogue(
                        context: context,
                        video: state.videos[index],
                        isEdit: true,
                      );
                    },
                    onLongPress: () => AppWidgets.showDeleteConfirmationDialog(
                      context,
                      () {
                        Navigator.pop(context);
                        context.read<VideoManagerBloc>().add(
                            VideoManagerDeleteEvent(
                                id: state.videos[index].id));
                      },
                    ),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ListDataContainerWidgetVideo(
                            text: (index + 1).toString(),
                            height: 40,
                          ),
                          ThumbnailImageBox(
                            imageUrl: state.videos[index].thumbnailurl,
                          ),
                          ListDataContainerWidgetVideo(
                            text: state.videos[index].title,
                            height: 40,
                          ),
                          ListDataContainerWidgetVideo(
                            text: state.videos[index].subtitle,
                            height: 40,
                          ),
                          ListDataContainerWidgetVideo(
                            text: state.videos[index].description,
                            height: 40,
                          ),
                          ListDataContainerWidgetVideo(
                            text: AppUtils.timeStampToDateString(
                              timeStamp: state.videos[index].uploadedDate,
                            ),
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 05,
                  );
                },
                itemCount: state.videos.length);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class ThumbnailImageBox extends StatelessWidget {
  final String imageUrl;
  final double imageSize;
  final double borderRadius;

  const ThumbnailImageBox({
    super.key,
    required this.imageUrl,
    this.imageSize = 100.0, // Adjust the size as needed
    this.borderRadius = 10.0, // Adjust the border radius as needed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageSize,
      height: imageSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: Colors.grey[300]!, // You can change the border color
          width: 1.0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: imageUrl.isEmpty
            ? Image.asset(
                "assests/images/imagenotfound.png",
                fit: BoxFit.cover,
              )
            : Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
