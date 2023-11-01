// To parse this JSON data, do
//
//     final photoModel = photoModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

PhotoModel photoModelFromJson(String str) => PhotoModel.fromJson(json.decode(str));

String photoModelToJson(PhotoModel data) => json.encode(data.toJson());

class PhotoModel {
    String id;
    String slug;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime promotedAt;
    int width;
    int height;
    String color;
    String blurHash;
    dynamic description;
    String altDescription;
    List<dynamic> breadcrumbs;
    Urls urls;
    PhotoModelLinks links;
    int likes;
    bool likedByUser;
    List<dynamic> currentUserCollections;
    dynamic sponsorship;
    User user;
    Exif exif;
    Meta meta;
    bool publicDomain;
    int views;
    int downloads;
    List<dynamic> topics;

    PhotoModel({
        required this.id,
        required this.slug,
        required this.createdAt,
        required this.updatedAt,
        required this.promotedAt,
        required this.width,
        required this.height,
        required this.color,
        required this.blurHash,
        required this.description,
        required this.altDescription,
        required this.breadcrumbs,
        required this.urls,
        required this.links,
        required this.likes,
        required this.likedByUser,
        required this.currentUserCollections,
        required this.sponsorship,
        required this.user,
        required this.exif,
        required this.meta,
        required this.publicDomain,
        required this.views,
        required this.downloads,
        required this.topics,
    });

    factory PhotoModel.fromJson(json) => PhotoModel(
        id: json["id"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        promotedAt: DateTime.parse(json["promoted_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        breadcrumbs: List<dynamic>.from(json["breadcrumbs"].map((x) => x)),
        urls: Urls.fromJson(json["urls"]),
        links: PhotoModelLinks.fromJson(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        sponsorship: json["sponsorship"],
       // topicSubmissions: PhotoModelTopicSubmissions.fromJson(json["topic_submissions"]),
        user: User.fromJson(json["user"]),
        exif: Exif.fromJson(json["exif"]),
        meta: Meta.fromJson(json["meta"]),
        publicDomain: json["public_domain"],
        views: json["views"],
        downloads: json["downloads"],
        topics: List<dynamic>.from(json["topics"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "promoted_at": promotedAt.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,
        "breadcrumbs": List<dynamic>.from(breadcrumbs.map((x) => x)),
        "urls": urls.toJson(),
        "links": links.toJson(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections": List<dynamic>.from(currentUserCollections.map((x) => x)),
        "sponsorship": sponsorship,
        "user": user.toJson(),
        "exif": exif.toJson(),
        "meta": meta.toJson(),
        "public_domain": publicDomain,
        "views": views,
        "downloads": downloads,
        "topics": List<dynamic>.from(topics.map((x) => x)),
    };
}

class Exif {
    String? make;
    String? model;
    String? name;
    String? exposureTime;
    String? aperture;
    String? focalLength;
    int? iso;

    Exif({
         this.make,
         this.model,
         this.name,
         this.exposureTime,
         this.aperture,
         this.focalLength,
         this.iso,
    });

    factory Exif.fromJson(Map<String, dynamic> json) => Exif(
        make: json["make"],
        model: json["model"],
        name: json["name"],
        exposureTime: json["exposure_time"],
        aperture: json["aperture"],
        focalLength: json["focal_length"],
        iso: json["iso"],
    );

    Map<String, dynamic> toJson() => {
        "make": make,
        "model": model,
        "name": name,
        "exposure_time": exposureTime,
        "aperture": aperture,
        "focal_length": focalLength,
        "iso": iso,
    };
}

class PhotoModelLinks {
    String self;
    String html;
    String download;
    String downloadLocation;

    PhotoModelLinks({
        required this.self,
        required this.html,
        required this.download,
        required this.downloadLocation,
    });

    factory PhotoModelLinks.fromJson(Map<String, dynamic> json) => PhotoModelLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
        downloadLocation: json["download_location"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
    };
}

class Location {
    dynamic name;
    dynamic city;
    dynamic country;
    Position position;

    Location({
        required this.name,
        required this.city,
        required this.country,
        required this.position,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        city: json["city"],
        country: json["country"],
        position: Position.fromJson(json["position"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "city": city,
        "country": country,
        "position": position.toJson(),
    };
}

class Position {
    int latitude;
    int longitude;

    Position({
        required this.latitude,
        required this.longitude,
    });

    factory Position.fromJson(Map<String, dynamic> json) => Position(
        latitude: json["latitude"],
        longitude: json["longitude"],
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}

class Meta {
    bool index;

    Meta({
        required this.index,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        index: json["index"],
    );

    Map<String, dynamic> toJson() => {
        "index": index,
    };
}

class Tag {
    Type type;
    String title;
    TagSource? source;

    Tag({
        required this.type,
        required this.title,
        this.source,
    });

    factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        type: typeValues.map[json["type"]]!,
        title: json["title"],
        source: json["source"] == null ? null : TagSource.fromJson(json["source"]),
    );

    Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "title": title,
        "source": source?.toJson(),
    };
}

class TagSource {
    Ancestry ancestry;
    String title;
    String subtitle;
    String description;
    String metaTitle;
    String metaDescription;
    PurpleCoverPhoto coverPhoto;

    TagSource({
        required this.ancestry,
        required this.title,
        required this.subtitle,
        required this.description,
        required this.metaTitle,
        required this.metaDescription,
        required this.coverPhoto,
    });

    factory TagSource.fromJson(Map<String, dynamic> json) => TagSource(
        ancestry: Ancestry.fromJson(json["ancestry"]),
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        coverPhoto: PurpleCoverPhoto.fromJson(json["cover_photo"]),
    );

    Map<String, dynamic> toJson() => {
        "ancestry": ancestry.toJson(),
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "cover_photo": coverPhoto.toJson(),
    };
}

class Ancestry {
    Category type;
    Category category;
    Category? subcategory;

    Ancestry({
        required this.type,
        required this.category,
        this.subcategory,
    });

    factory Ancestry.fromJson(Map<String, dynamic> json) => Ancestry(
        type: Category.fromJson(json["type"]),
        category: Category.fromJson(json["category"]),
        subcategory: json["subcategory"] == null ? null : Category.fromJson(json["subcategory"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type.toJson(),
        "category": category.toJson(),
        "subcategory": subcategory?.toJson(),
    };
}

class Category {
    String slug;
    String prettySlug;

    Category({
        required this.slug,
        required this.prettySlug,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        slug: json["slug"],
        prettySlug: json["pretty_slug"],
    );

    Map<String, dynamic> toJson() => {
        "slug": slug,
        "pretty_slug": prettySlug,
    };
}

class PurpleCoverPhoto {
    String id;
    String slug;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime promotedAt;
    int width;
    int height;
    String color;
    String blurHash;
    String? description;
    String altDescription;
    List<Breadcrumb> breadcrumbs;
    Urls urls;
    PhotoModelLinks links;
    int likes;
    bool likedByUser;
    List<dynamic> currentUserCollections;
    dynamic sponsorship;
    PurpleTopicSubmissions topicSubmissions;
    bool premium;
    bool plus;
    User user;

    PurpleCoverPhoto({
        required this.id,
        required this.slug,
        required this.createdAt,
        required this.updatedAt,
        required this.promotedAt,
        required this.width,
        required this.height,
        required this.color,
        required this.blurHash,
        required this.description,
        required this.altDescription,
        required this.breadcrumbs,
        required this.urls,
        required this.links,
        required this.likes,
        required this.likedByUser,
        required this.currentUserCollections,
        required this.sponsorship,
        required this.topicSubmissions,
        required this.premium,
        required this.plus,
        required this.user,
    });

    factory PurpleCoverPhoto.fromJson(Map<String, dynamic> json) => PurpleCoverPhoto(
        id: json["id"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        promotedAt: DateTime.parse(json["promoted_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        breadcrumbs: List<Breadcrumb>.from(json["breadcrumbs"].map((x) => Breadcrumb.fromJson(x))),
        urls: Urls.fromJson(json["urls"]),
        links: PhotoModelLinks.fromJson(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        sponsorship: json["sponsorship"],
        topicSubmissions: PurpleTopicSubmissions.fromJson(json["topic_submissions"]),
        premium: json["premium"],
        plus: json["plus"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "promoted_at": promotedAt.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,
        "breadcrumbs": List<dynamic>.from(breadcrumbs.map((x) => x.toJson())),
        "urls": urls.toJson(),
        "links": links.toJson(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections": List<dynamic>.from(currentUserCollections.map((x) => x)),
        "sponsorship": sponsorship,
        "topic_submissions": topicSubmissions.toJson(),
        "premium": premium,
        "plus": plus,
        "user": user.toJson(),
    };
}

class Breadcrumb {
    String slug;
    String title;
    int index;
    Type type;

    Breadcrumb({
        required this.slug,
        required this.title,
        required this.index,
        required this.type,
    });

    factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
        slug: json["slug"],
        title: json["title"],
        index: json["index"],
        type: typeValues.map[json["type"]]!,
    );

    Map<String, dynamic> toJson() => {
        "slug": slug,
        "title": title,
        "index": index,
        "type": typeValues.reverse[type],
    };
}

enum Type {
    LANDING_PAGE,
    SEARCH
}

final typeValues = EnumValues({
    "landing_page": Type.LANDING_PAGE,
    "search": Type.SEARCH
});

class PurpleTopicSubmissions {
    Wallpapers? wallpapers;
    Wallpapers? currentEvents;
    Wallpapers? health;
    Wallpapers? nature;

    PurpleTopicSubmissions({
        this.wallpapers,
        this.currentEvents,
        this.health,
        this.nature,
    });

    factory PurpleTopicSubmissions.fromJson(Map<String, dynamic> json) => PurpleTopicSubmissions(
        wallpapers: json["wallpapers"] == null ? null : Wallpapers.fromJson(json["wallpapers"]),
        currentEvents: json["current-events"] == null ? null : Wallpapers.fromJson(json["current-events"]),
        health: json["health"] == null ? null : Wallpapers.fromJson(json["health"]),
        nature: json["nature"] == null ? null : Wallpapers.fromJson(json["nature"]),
    );

    Map<String, dynamic> toJson() => {
        "wallpapers": wallpapers?.toJson(),
        "current-events": currentEvents?.toJson(),
        "health": health?.toJson(),
        "nature": nature?.toJson(),
    };
}

class Wallpapers {
    String status;
    DateTime approvedOn;

    Wallpapers({
        required this.status,
        required this.approvedOn,
    });

    factory Wallpapers.fromJson(Map<String, dynamic> json) => Wallpapers(
        status: json["status"],
        approvedOn: DateTime.parse(json["approved_on"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "approved_on": approvedOn.toIso8601String(),
    };
}

class Urls {
    String raw;
    String full;
    String regular;
    String small;
    String thumb;
    String smallS3;

    Urls({
        required this.raw,
        required this.full,
        required this.regular,
        required this.small,
        required this.thumb,
        required this.smallS3,
    });

    factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
        smallS3: json["small_s3"],
    );

    Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
        "small_s3": smallS3,
    };
}

class User {
    String id;
    DateTime updatedAt;
    String username;
    String name;
    String firstName;
    String? lastName;
    String? twitterUsername;
    String? portfolioUrl;
    String? bio;
    String location;
    UserLinks links;
    ProfileImage profileImage;
    String? instagramUsername;
    int totalCollections;
    int totalLikes;
    int totalPhotos;
    bool acceptedTos;
    bool forHire;
    Social social;

    User({
        required this.id,
        required this.updatedAt,
        required this.username,
        required this.name,
        required this.firstName,
        required this.lastName,
        required this.twitterUsername,
        required this.portfolioUrl,
        required this.bio,
        required this.location,
        required this.links,
        required this.profileImage,
        required this.instagramUsername,
        required this.totalCollections,
        required this.totalLikes,
        required this.totalPhotos,
        required this.acceptedTos,
        required this.forHire,
        required this.social,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        twitterUsername: json["twitter_username"],
        portfolioUrl: json["portfolio_url"],
        bio: json["bio"],
        location: json["location"],
        links: UserLinks.fromJson(json["links"]),
        profileImage: ProfileImage.fromJson(json["profile_image"]),
        instagramUsername: json["instagram_username"],
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"],
        acceptedTos: json["accepted_tos"],
        forHire: json["for_hire"],
        social: Social.fromJson(json["social"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "updated_at": updatedAt.toIso8601String(),
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "twitter_username": twitterUsername,
        "portfolio_url": portfolioUrl,
        "bio": bio,
        "location": location,
        "links": links.toJson(),
        "profile_image": profileImage.toJson(),
        "instagram_username": instagramUsername,
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
        "accepted_tos": acceptedTos,
        "for_hire": forHire,
        "social": social.toJson(),
    };
}

class UserLinks {
    String self;
    String html;
    String photos;
    String likes;
    String portfolio;
    String following;
    String followers;

    UserLinks({
        required this.self,
        required this.html,
        required this.photos,
        required this.likes,
        required this.portfolio,
        required this.following,
        required this.followers,
    });

    factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        likes: json["likes"],
        portfolio: json["portfolio"],
        following: json["following"],
        followers: json["followers"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "likes": likes,
        "portfolio": portfolio,
        "following": following,
        "followers": followers,
    };
}

class ProfileImage {
    String small;
    String medium;
    String large;

    ProfileImage({
        required this.small,
        required this.medium,
        required this.large,
    });

    factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
    );

    Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
    };
}

class Social {
    String? instagramUsername;
    String? portfolioUrl;
    String? twitterUsername;
    dynamic paypalEmail;

    Social({
        required this.instagramUsername,
        required this.portfolioUrl,
        required this.twitterUsername,
        required this.paypalEmail,
    });

    factory Social.fromJson(Map<String, dynamic> json) => Social(
        instagramUsername: json["instagram_username"],
        portfolioUrl: json["portfolio_url"],
        twitterUsername: json["twitter_username"],
        paypalEmail: json["paypal_email"],
    );

    Map<String, dynamic> toJson() => {
        "instagram_username": instagramUsername,
        "portfolio_url": portfolioUrl,
        "twitter_username": twitterUsername,
        "paypal_email": paypalEmail,
    };
}

class TagsPreview {
    Type type;
    String title;
    TagsPreviewSource? source;

    TagsPreview({
        required this.type,
        required this.title,
        this.source,
    });

    factory TagsPreview.fromJson(Map<String, dynamic> json) => TagsPreview(
        type: typeValues.map[json["type"]]!,
        title: json["title"],
        source: json["source"] == null ? null : TagsPreviewSource.fromJson(json["source"]),
    );

    Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "title": title,
        "source": source?.toJson(),
    };
}

class TagsPreviewSource {
    Ancestry ancestry;
    String title;
    String subtitle;
    String description;
    String metaTitle;
    String metaDescription;
    FluffyCoverPhoto coverPhoto;

    TagsPreviewSource({
        required this.ancestry,
        required this.title,
        required this.subtitle,
        required this.description,
        required this.metaTitle,
        required this.metaDescription,
        required this.coverPhoto,
    });

    factory TagsPreviewSource.fromJson(Map<String, dynamic> json) => TagsPreviewSource(
        ancestry: Ancestry.fromJson(json["ancestry"]),
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        coverPhoto: FluffyCoverPhoto.fromJson(json["cover_photo"]),
    );

    Map<String, dynamic> toJson() => {
        "ancestry": ancestry.toJson(),
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "cover_photo": coverPhoto.toJson(),
    };
}

class FluffyCoverPhoto {
    String id;
    String slug;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime promotedAt;
    int width;
    int height;
    String color;
    String blurHash;
    dynamic description;
    String altDescription;
    List<Breadcrumb> breadcrumbs;
    Urls urls;
    PhotoModelLinks links;
    int likes;
    bool likedByUser;
    List<dynamic> currentUserCollections;
    dynamic sponsorship;
    FluffyTopicSubmissions topicSubmissions;
    bool premium;
    bool plus;
    User user;

    FluffyCoverPhoto({
        required this.id,
        required this.slug,
        required this.createdAt,
        required this.updatedAt,
        required this.promotedAt,
        required this.width,
        required this.height,
        required this.color,
        required this.blurHash,
        required this.description,
        required this.altDescription,
        required this.breadcrumbs,
        required this.urls,
        required this.links,
        required this.likes,
        required this.likedByUser,
        required this.currentUserCollections,
        required this.sponsorship,
        required this.topicSubmissions,
        required this.premium,
        required this.plus,
        required this.user,
    });

    factory FluffyCoverPhoto.fromJson(Map<String, dynamic> json) => FluffyCoverPhoto(
        id: json["id"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        promotedAt: DateTime.parse(json["promoted_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        breadcrumbs: List<Breadcrumb>.from(json["breadcrumbs"].map((x) => Breadcrumb.fromJson(x))),
        urls: Urls.fromJson(json["urls"]),
        links: PhotoModelLinks.fromJson(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        sponsorship: json["sponsorship"],
        topicSubmissions: FluffyTopicSubmissions.fromJson(json["topic_submissions"]),
        premium: json["premium"],
        plus: json["plus"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "promoted_at": promotedAt.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,
        "breadcrumbs": List<dynamic>.from(breadcrumbs.map((x) => x.toJson())),
        "urls": urls.toJson(),
        "links": links.toJson(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections": List<dynamic>.from(currentUserCollections.map((x) => x)),
        "sponsorship": sponsorship,
        "topic_submissions": topicSubmissions.toJson(),
        "premium": premium,
        "plus": plus,
        "user": user.toJson(),
    };
}

class FluffyTopicSubmissions {
    Wallpapers wallpapers;

    FluffyTopicSubmissions({
        required this.wallpapers,
    });

    factory FluffyTopicSubmissions.fromJson(Map<String, dynamic> json) => FluffyTopicSubmissions(
        wallpapers: Wallpapers.fromJson(json["wallpapers"]),
    );

    Map<String, dynamic> toJson() => {
        "wallpapers": wallpapers.toJson(),
    };
}

class PhotoModelTopicSubmissions {
    FashionBeauty fashionBeauty;

    PhotoModelTopicSubmissions({
        required this.fashionBeauty,
    });

    factory PhotoModelTopicSubmissions.fromJson(json) => PhotoModelTopicSubmissions(
        fashionBeauty: FashionBeauty.fromJson(json["fashion-beauty"]),
    );

    Map<String, dynamic> toJson() => {
        "fashion-beauty": fashionBeauty.toJson(),
    };
}

class FashionBeauty {
    String status;

    FashionBeauty({
        required this.status,
    });

    factory FashionBeauty.fromJson(json) => FashionBeauty(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
