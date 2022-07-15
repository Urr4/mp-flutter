class Page<T>{
  final List<T> content;
  final int totalPages;
  final int totalElements;
  final int sizeOfWindow;
  final int pageNumber;

  Page({required this.content, required this.totalPages, required this.totalElements, required this.sizeOfWindow, required this. pageNumber});

  factory Page.fromJson(Map<String, dynamic> json) {
    return Page(
      content: json["content"],
      totalPages: json["totalPages"],
      totalElements: json["totalElements"],
      sizeOfWindow: json["sizeOfWindow"],
      pageNumber: json["pageNumber"],
    );
  }



}