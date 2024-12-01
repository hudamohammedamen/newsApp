import 'package:flutter/material.dart';
import 'package:news/components/news_item.dart';
import 'package:news/models/SourcesResponse.dart';
import 'package:news/network/api_manager.dart';
import 'package:news/components/source_item.dart';

class SourcesTitle extends StatefulWidget {
  List<Sources> sources;
  SourcesTitle(this.sources);

  @override
  State<SourcesTitle> createState() => _SourcesTitleState();
}

class _SourcesTitleState extends State<SourcesTitle> {
  int index = 0;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            onTap: (value) {
              index = value;
              setState(() {});
            },
            indicatorColor: Colors.transparent,
            isScrollable: true,
            tabs: widget.sources.map((e) {
              return SourceItem(
                  e.name ?? "", widget.sources.indexOf(e) == index);
            }).toList(),
            padding: EdgeInsets.only(top: 8),
          ),
        ),
        FutureBuilder(
          future:
          ApiManager.getNewsData(sourceId: widget.sources[index].id ?? ""),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text("Check internet connection"));
            }
            var articls = snapshot.data?.articles ?? [];
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return NewsItem(articls[index]);
                },
                itemCount: articls.length,
              ),
            );
          },
        ),
      ],
    );
  }
}
