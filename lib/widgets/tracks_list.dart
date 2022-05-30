import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:provider/provider.dart';

import '../model/current_track_model.dart';

class TracksList extends StatelessWidget {
  final List<Song> tracks;

  const TracksList({Key? key, required this.tracks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingTextStyle:
          Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
      dataRowHeight: 54.0,
      showCheckboxColumn: false,
      columns: const [
        DataColumn(label: Text('TITLE')),
        DataColumn(label: Text('ARTIST')),
        DataColumn(label: Text('ALBUM')),
        DataColumn(label: Icon(Icons.access_time)),
      ],
      rows: tracks.map((song) {
        final selected =
            context.watch<CurrentTrackModel>().selected?.id == song.id;
        final textStyle = TextStyle(
          color: selected
              ? Theme.of(context).accentColor
              : Theme.of(context).iconTheme.color,
        );
        return DataRow(
          cells: [
            DataCell(
              Text(song.title, style: textStyle),
            ),
            DataCell(
              Text(song.artist, style: textStyle),
            ),
            DataCell(
              Text(song.album, style: textStyle),
            ),
            DataCell(
              Text(song.duration, style: textStyle),
            ),
          ],
          selected: selected,
          onSelectChanged: (_) =>
              context.read<CurrentTrackModel>().selectTrack(song),
        );
      }).toList(),
    );
  }
}
