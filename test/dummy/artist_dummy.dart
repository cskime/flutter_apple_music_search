String artistDummyJsonString(int artistId) =>
    '{"wrapperType":"artist", "artistType":"Artist", "artistName":"Taylor Swift", "artistLinkUrl":"https://music.apple.com/us/artist/taylor-swift/159260351?uo=4", "artistId":$artistId, "amgArtistId":816977, "primaryGenreName":"Pop", "primaryGenreId":14}';

String get artistDummyResponseString => """
{
 "resultCount":3,
 "results": [
{"wrapperType":"artist", "artistType":"Artist", "artistName":"Taylor Swift", "artistLinkUrl":"https://music.apple.com/us/artist/taylor-swift/159260351?uo=4", "artistId":159260351, "amgArtistId":816977, "primaryGenreName":"Pop", "primaryGenreId":14}, 
{"wrapperType":"artist", "artistType":"Artist", "artistName":"Natalie Taylor", "artistLinkUrl":"https://music.apple.com/us/artist/natalie-taylor/400555769?uo=4", "artistId":400555769, "primaryGenreName":"Singer/Songwriter", "primaryGenreId":10}, 
{"wrapperType":"artist", "artistType":"Author", "artistName":"Brad Taylor", "artistLinkUrl":"https://music.apple.com/us/author/brad-taylor/id398280488?uo=4", "artistId":398280488, "amgArtistId":416712, "primaryGenreName":"Mysteries & Thrillers", "primaryGenreId":9032}]
}
""";
