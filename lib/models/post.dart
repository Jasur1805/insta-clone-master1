enum PostSort {
  title,
  date,
  like,
}

// TODO: update Post
class Post implements Comparable<Post> {
  int id;
  String title;
  String content;
  DateTime createdAt;
  int likeCount;
  String mediaUrl;
  static int countPost = 0;
  static PostSort sortType = PostSort.like;

  Post({
    required this.title,
    required this.content,
    required this.mediaUrl,
  })  : id = ++countPost,
        createdAt = DateTime.now(),
        likeCount = 0;

  @override
  String toString() {
    return "\n$title: \n$content. \nDate: ${createdAt.toLocal()}. \nLikes: $likeCount";
  }

  @override
  noSuchMethod(Invocation invocation) {
    print("Please write correct method");
  }

  @override
  int get hashCode => Object.hash(id, title, content, mediaUrl);

  @override
  bool operator ==(Object other) {
    return other is Post &&
        id == other.id &&
        title == other.title &&
        content == other.content &&
        mediaUrl == other.mediaUrl;
  }

  @override
  int compareTo(Post post) {
    switch (sortType) {
      case PostSort.title:
        return title.compareTo(post.title);
      case PostSort.date:
        return createdAt.compareTo(post.createdAt);
      case PostSort.like:
        return likeCount.compareTo(post.likeCount);
    }
  }
}
