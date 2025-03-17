class AllSubjectEntity {
  AllSubjectEntity({
    this.message,
    this.metadata,
    this.subjects,
  });

  String? message;
  MetadataEntity? metadata;
  List<SubjectEntity>? subjects;
}

class SubjectEntity {
  SubjectEntity({
    this.id,
    this.name,
    this.icon,
    this.createdAt,
  });

  String? id;
  String? name;
  String? icon;
  String? createdAt;
}

class MetadataEntity {
  MetadataEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  num? currentPage;
  num? numberOfPages;
  num? limit;
}
