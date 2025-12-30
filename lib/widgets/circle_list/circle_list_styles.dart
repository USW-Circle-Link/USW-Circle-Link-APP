/// CircleList 위젯의 스타일을 정의하는 클래스
class CircleListStyle {
  /// 리스트 shrinkWrap 설정
  final bool shrinkWrap;

  const CircleListStyle({
    this.shrinkWrap = true,
  });

  static const CircleListStyle defaultStyle = CircleListStyle();

  CircleListStyle copyWith({
    bool? shrinkWrap,
  }) {
    return CircleListStyle(
      shrinkWrap: shrinkWrap ?? this.shrinkWrap,
    );
  }
}
