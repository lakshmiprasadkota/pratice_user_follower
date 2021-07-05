
import 'dart:convert';

UserDetails userDetailsFromMap(String str) => UserDetails.fromMap(json.decode(str));

String userDetailsToMap(UserDetails data) => json.encode(data.toMap());

class UserDetails {
  UserDetails({
   this.totalCount,
 this.incompleteResults,
    this.items,
  });

  int ? totalCount;
  bool ?incompleteResults;
  List<Item> ?items;

  factory UserDetails.fromMap(Map<String, dynamic> json) => UserDetails(
    totalCount: json["total_count"],
    incompleteResults: json["incomplete_results"],
    items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "total_count": totalCount,
    "incomplete_results": incompleteResults,
    "items": List<dynamic>.from(items!.map((x) => x.toMap())),
  };
}

class Item {
  Item({
          this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
     this.type,
    required this.siteAdmin,
    required this.score,
  });

  String ?login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  Type ? type;
  bool siteAdmin;
  double score;

  factory Item.fromMap(Map<String, dynamic> json) => Item(
    login: json["login"],
    id: json["id"],
    nodeId: json["node_id"],
    avatarUrl: json["avatar_url"],
    gravatarId: json["gravatar_id"],
    url: json["url"],
    htmlUrl: json["html_url"],
    followersUrl: json["followers_url"],
    followingUrl: json["following_url"],
    gistsUrl: json["gists_url"],
    starredUrl: json["starred_url"],
    subscriptionsUrl: json["subscriptions_url"],
    organizationsUrl: json["organizations_url"],
    reposUrl: json["repos_url"],
    eventsUrl: json["events_url"],
    receivedEventsUrl: json["received_events_url"],
    type: typeValues.map[json["type"]],
    siteAdmin: json["site_admin"],
    score: json["score"],
  );

  Map<String, dynamic> toMap() => {
    "login": login,
    "id": id,
    "node_id": nodeId,
    "avatar_url": avatarUrl,
    "gravatar_id": gravatarId,
    "url": url,
    "html_url": htmlUrl,
    "followers_url": followersUrl,
    "following_url": followingUrl,
    "gists_url": gistsUrl,
    "starred_url": starredUrl,
    "subscriptions_url": subscriptionsUrl,
    "organizations_url": organizationsUrl,
    "repos_url": reposUrl,
    "events_url": eventsUrl,
    "received_events_url": receivedEventsUrl,
    "type": typeValues.reverse[type],
    "site_admin": siteAdmin,
    "score": score,
  };
}

enum Type { USER  }

final typeValues = EnumValues({
  "User": Type.USER,
});

class EnumValues<T> {
  EnumValues ( this.map ,);
  Map<String, T> map;

  get reverse => null;





}
