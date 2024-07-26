import 'package:apple_music_search/feature/album/views/albums_screen.dart';
import 'package:apple_music_search/feature/search/models/artist/artist_model.dart';
import 'package:apple_music_search/feature/search/view_models/search_view_model.dart';
import 'package:apple_music_search/feature/search/views/widgets/artist_name_tag.dart';
import 'package:apple_music_search/feature/search/views/widgets/search_button.dart';
import 'package:apple_music_search/feature/search/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen>
    with SingleTickerProviderStateMixin {
  final _textEditingController = TextEditingController();
  final _focusNode = FocusNode();

  late final _animationController = AnimationController(
    vsync: this,
    duration: 250.ms,
  );
  late final _topPaddingAnimation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.easeInOut,
  );

  ArtistModel? _selectedArtis;

  void _onSearchPressed() async {
    _unfocus();
    await ref
        .read(searchViewModelProvider.notifier)
        .search(term: _textEditingController.text);
    setState(() {});
  }

  void _unfocus() {
    _focusNode.unfocus();
  }

  void _onArtistPressed(ArtistModel artist) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AlbumsScreen(artist),
      ),
    );
    setState(() {
      _selectedArtis = artist;
    });
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(
      () {
        if (_focusNode.hasFocus) {
          _animationController.forward();
        } else if (_textEditingController.text.isEmpty) {
          _animationController.reverse();
        }
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final artists = ref.watch(searchViewModelProvider).value ?? [];

    const contentHeight = 56 + 48 + 12; // t
    final viewVerticalPadding = MediaQuery.viewPaddingOf(context).vertical;
    final viewHeight = MediaQuery.sizeOf(context).height - viewVerticalPadding;

    final topPadding = Tween<double>(
      begin: (viewHeight - contentHeight) / 2,
      end: (viewHeight / 2 - contentHeight) / 2,
    ).animate(_topPaddingAnimation);

    return GestureDetector(
      onTap: _unfocus,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedBuilder(
                  animation: topPadding,
                  builder: (context, child) => SizedBox(
                    height: topPadding.value,
                  ),
                ),
                SearchTextField(
                  controller: _textEditingController,
                  focusNode: _focusNode,
                ),
                const SizedBox(height: 12),
                SearchButton(
                  title: "Search",
                  onPressed: _onSearchPressed,
                ),
                const SizedBox(height: 48),
                if (_textEditingController.text.isNotEmpty &&
                    artists.isNotEmpty)
                  SizedBox(
                    height: viewHeight * 0.5,
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          ...artists.map(
                            (artist) => SearchResultTag(
                              artist: artist,
                              onPressed: _onArtistPressed,
                              selected:
                                  _selectedArtis?.artistId == artist.artistId,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).animate().fadeIn(duration: 300.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
