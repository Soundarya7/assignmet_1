class RatingState{
  final int? id;
  final double? rating;
  final String? review;
   RatingState({
    this.id,
    this.rating,
    this.review,
   });
   RatingState.fromJson(Map<String, dynamic> json)
      : id = json['property'] as int?,
        rating = json['rating'] as double?,
        review = json['review'] as String?;
       
  Map<String, dynamic> toJson() => {
        'property': id,
        'rating': rating,
        'review': review,
        
      };
    RatingState copyWith({
    int? id,
    double? rating,
    String? review,
   
  }){
    return RatingState(
      id: id ?? this.id,
      rating: rating ?? this.rating,
      review: review ?? this.review,
     
    );
  }
}