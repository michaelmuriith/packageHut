import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../views/main/main_viewmodel.dart';

class SearchBar extends StatelessWidget {
  final MainViewModel viewModel;
  const SearchBar({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Search',
                      prefixIcon: Icon(
                        Icons.search,
                        size: 25,
                      ),
                      contentPadding: EdgeInsets.fromLTRB(8, 5, 8, 5)),
                ),
              ),
            ),
            Container(
              height: 60,
              width: 50,
              margin: const EdgeInsets.only(left: 8.0),
              decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.purple,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: IconButton(
                  onPressed: viewModel.search,
                  icon: SvgPicture.asset('assets/svg/Filter.svg')),
            ),
          ],
        ),
      ),
    );
  }
}
