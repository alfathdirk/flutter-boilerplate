class PostLogin {
  final bool error;
  final String token;

  PostLogin({this.error, this.token});

  factory PostLogin.fromJson(Map<String, dynamic> json) {
    return PostLogin(
      error: json['error'],
      token: json['token'],
    );
  }
}
// class Post {
//   int id;
//   String title;
//   String body;

//   Post({
//     this.id,
//     this.title,
//     this.body,
//   });

//   factory Post.fromMap(Map<String, dynamic> json) => Post(
//         id: json["id"],
//         title: json["title"],
//         body: json["body"],
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "title": title,
//         "body": body,
//       };
  
// }

// class PostsList {
//   final List<Post> posts;

//   PostsList({
//     this.posts,
//   });

//   factory PostsList.fromJson(List<dynamic> json) {
//     List<Post> posts = List<Post>();
//     posts = json.map((post) => Post.fromMap(post)).toList();

//     return PostsList(
//       posts: posts,
//     );
//   }
// }
