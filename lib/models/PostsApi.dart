/// userId : 1
/// id : 1
/// title : "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
/// body : "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"

class PostsApi {
  PostsApi({
      required num userId, 
      required num id, 
      required String title, 
      required String body,}){
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
}

  PostsApi.fromJson(dynamic json) {
    _userId = json['userId'];
    _id = json['id'];
    _title = json['title'];
    _body = json['body'];
  }
  late final num _userId;
  late final num _id;
  late final String _title;
  late final String _body;
PostsApi copyWith({  num? userId,
  num? id,
  String? title,
  String? body,
}) => PostsApi(  userId: userId ?? _userId,
  id: id ?? _id,
  title: title ?? _title,
  body: body ?? _body,
);
  num get userId => _userId;
  num get id => _id;
  String get title => _title;
  String get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['id'] = _id;
    map['title'] = _title;
    map['body'] = _body;
    return map;
  }

}