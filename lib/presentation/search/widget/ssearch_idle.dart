import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/tile.dart';

// const imageUrl =
//     'https://www.themoviedb.org/t/p/w250_and_h141_face/9BBTo63ANSmhC4e6r62OJFuK2GL.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const searchTextTitle(
          title: 'Top Searches',
        ),
        kHeight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return Center(
                  child: Text('Error While getting data'),
                );
              } else if (state.idleList.isEmpty) {
                return Center(
                  child: Text('List is Empty'),
                );
              }
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    final movie = state.idleList[index];
                    return TopSearchitemTile(
                      imageUrl: '$imageAppendUrl${movie.posterPath}',
                      title: movie.title ?? 'No title provider',
                    );
                  },
                  separatorBuilder: (ctx, index) => kHeight20,
                  itemCount: state.idleList.length);
            },
          ),
        )
      ],
    );
  }
}

class TopSearchitemTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchitemTile(
      {Key? key, required this.imageUrl, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenwidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl))),
        ),
        const SizedBox(width: 5),
        Expanded(
            child: Text(
          title,
          style: const TextStyle(
              color: kWhitecolor, fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const CircleAvatar(
          radius: 25,
          backgroundColor: kWhitecolor,
          child: CircleAvatar(
            backgroundColor: backgroundColor,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kWhitecolor,
            ),
          ),
        )
      ],
    );
  }
}
