# Flutter Clean Architecture 개발 가이드라인

> 본 문서는 Flutter Compass 앱의 아키텍처를 기반으로 작성된 실무 중심의 개발 가이드입니다.  
> MVVM + Clean Architecture 패턴을 프로젝트 규모에 맞게 적용하는 방법을 제시합니다.

## 목차

1. [아키텍처 개요](#1-아키텍처-개요)
2. [레이어별 상세 가이드](#2-레이어별-상세-가이드)
3. [핵심 패턴 가이드](#3-핵심-패턴-가이드)
4. [프로젝트 규모별 적용 가이드](#4-프로젝트-규모별-적용-가이드)
5. [테스트 전략](#5-테스트-전략)
6. [디렉토리 구조](#6-디렉토리-구조)
7. [베스트 프랙티스](#7-베스트-프랙티스)
8. [안티패턴과 주의사항](#8-안티패턴과-주의사항)

---

## 1. 아키텍처 개요

### 1.1 Clean Architecture 원칙

본 프로젝트는 Robert C. Martin의 Clean Architecture를 Flutter에 적용한 구조입니다. 핵심 원칙은 다음과 같습니다:

**핵심 원칙**
- **의존성 규칙(Dependency Rule)**: 외부 레이어는 내부 레이어를 의존하지만, 그 반대는 불가능
- **관심사의 분리(Separation of Concerns)**: 각 레이어는 명확한 책임을 가짐
- **테스트 가능성(Testability)**: 모든 레이어는 독립적으로 테스트 가능
- **프레임워크 독립성**: 비즈니스 로직은 Flutter에 의존하지 않음

### 1.2 레이어 구조

```
┌─────────────────────────────────────────┐
│         UI Layer (Presentation)          │
│   - Widgets (View)                       │
│   - ViewModels                           │
│   - State Management                     │
└──────────────┬──────────────────────────┘
               │ depends on
┌──────────────▼──────────────────────────┐
│           Domain Layer                   │
│   - Models (Entities)                    │
│   - Repository Interfaces                │
│   - Use Cases                            │
└──────────────┬──────────────────────────┘
               │ depends on
┌──────────────▼──────────────────────────┐
│            Data Layer                    │
│   - Repository Implementations           │
│   - Data Sources (API, Local)            │
│   - DTOs / API Models                    │
└─────────────────────────────────────────┘
```

**의존성 방향**
- UI Layer → Domain Layer (인터페이스 사용)
- Data Layer → Domain Layer (인터페이스 구현)
- Domain Layer는 다른 레이어에 의존하지 않음

### 1.3 MVVM 패턴 적용

본 프로젝트는 Clean Architecture와 MVVM을 결합하여 사용합니다:

- **View (Widget)**: 사용자 인터페이스를 표시하고 사용자 입력을 받음
- **ViewModel**: 비즈니스 로직을 실행하고 View의 상태를 관리
- **Model**: Domain 레이어의 Entity와 매핑

**MVVM 흐름**
```
User Input → View → ViewModel → Use Case/Repository → Data Source
                ↑                                            │
                └────────── State Update ←──────────────────┘
```

---

## 2. 레이어별 상세 가이드

### 2.1 UI Layer (Presentation)

UI 레이어는 사용자와 직접 상호작용하는 계층으로, Widget과 ViewModel로 구성됩니다.

#### 2.1.1 View (Widget) 구현 원칙

**기본 원칙**
- Widget은 비즈니스 로직을 포함하지 않음
- ViewModel을 통해서만 데이터와 상호작용
- 상태는 ViewModel에서 관리
- UI 로직(애니메이션, 네비게이션)만 포함

**실제 예제: HomeScreen**

```dart
// lib/ui/home/widgets/home_screen.dart
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Command의 결과를 리스닝
    widget.viewModel.deleteBooking.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewModel.deleteBooking.removeListener(_onResult);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go(Routes.search),
        label: Text(AppLocalization.of(context).bookNewTrip),
      ),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: widget.viewModel.load,
          builder: (context, child) {
            // 로딩 상태 처리
            if (widget.viewModel.load.running) {
              return const Center(child: CircularProgressIndicator());
            }
            
            // 에러 상태 처리
            if (widget.viewModel.load.error) {
              return ErrorIndicator(
                title: AppLocalization.of(context).errorWhileLoadingHome,
                onPressed: widget.viewModel.load.execute,
              );
            }
            
            return child!;
          },
          // 데이터 표시
          child: ListenableBuilder(
            listenable: widget.viewModel,
            builder: (context, _) {
              return CustomScrollView(
                slivers: [
                  SliverList.builder(
                    itemCount: widget.viewModel.bookings.length,
                    itemBuilder: (_, index) => _buildBookingItem(index),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _onResult() {
    // Command 완료 시 SnackBar 표시
    if (widget.viewModel.deleteBooking.completed) {
      widget.viewModel.deleteBooking.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalization.of(context).bookingDeleted)),
      );
    }
  }
}
```

**핵심 포인트**
- ViewModel을 생성자로 주입받음
- `ListenableBuilder`로 상태 변경 감지
- Command 패턴으로 비동기 작업 상태 관리
- UI 로직(네비게이션, SnackBar)만 Widget에 포함

#### 2.1.2 ViewModel 패턴과 상태 관리

**ViewModel의 책임**
- Repository/Use Case를 통해 데이터 로드
- UI에 필요한 상태 관리
- 사용자 액션을 비즈니스 로직으로 변환
- Command를 통한 비동기 작업 관리

**실제 예제: HomeViewModel**

```dart
// lib/ui/home/view_models/home_viewmodel.dart
class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required BookingRepository bookingRepository,
    required UserRepository userRepository,
  })  : _bookingRepository = bookingRepository,
        _userRepository = userRepository {
    // Command 초기화
    load = Command0(_load)..execute();
    deleteBooking = Command1(_deleteBooking);
  }

  final BookingRepository _bookingRepository;
  final UserRepository _userRepository;
  final _log = Logger('HomeViewModel');
  
  // Private state
  List<BookingSummary> _bookings = [];
  User? _user;

  // Public Commands
  late Command0 load;
  late Command1<void, int> deleteBooking;

  // Public getters
  List<BookingSummary> get bookings => _bookings;
  User? get user => _user;

  Future<Result> _load() async {
    try {
      // 데이터 로드
      final result = await _bookingRepository.getBookingsList();
      switch (result) {
        case Ok<List<BookingSummary>>():
          _bookings = result.value;
          _log.fine('Loaded bookings');
        case Error<List<BookingSummary>>():
          _log.warning('Failed to load bookings', result.error);
          return result;
      }

      final userResult = await _userRepository.getUser();
      switch (userResult) {
        case Ok<User>():
          _user = userResult.value;
        case Error<User>():
          _log.warning('Failed to load user', userResult.error);
      }

      return userResult;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _deleteBooking(int id) async {
    try {
      final resultDelete = await _bookingRepository.delete(id);
      switch (resultDelete) {
        case Ok<void>():
          _log.fine('Deleted booking $id');
        case Error<void>():
          return resultDelete;
      }

      // 삭제 후 목록 재로드
      final resultLoadBookings = await _bookingRepository.getBookingsList();
      switch (resultLoadBookings) {
        case Ok<List<BookingSummary>>():
          _bookings = resultLoadBookings.value;
        case Error<List<BookingSummary>>():
          return resultLoadBookings;
      }

      return resultLoadBookings;
    } finally {
      notifyListeners();
    }
  }
}
```

**핵심 포인트**
- `ChangeNotifier` 상속으로 상태 변경 알림
- Repository는 인터페이스를 통해 주입
- Private 상태 + Public getter 패턴
- Command로 비동기 작업 캡슐화
- Result 타입으로 에러 처리
- `finally`에서 항상 `notifyListeners()` 호출

#### 2.1.3 Command 패턴을 통한 액션 처리

Command 패턴은 비동기 작업의 실행, 상태, 결과를 캡슐화합니다.

**Command의 장점**
- 비동기 작업의 running, completed, error 상태 자동 관리
- 중복 실행 방지
- 결과 캐싱 및 소비 패턴
- ViewModel과 View의 결합도 감소

자세한 내용은 [3.1 Command 패턴](#31-command-패턴)을 참고하세요.

---

### 2.2 Domain Layer

Domain 레이어는 비즈니스 로직의 핵심으로, 다른 레이어에 의존하지 않습니다.

#### 2.2.1 Models (Entity) 정의

**Entity의 특징**
- 불변(Immutable) 객체
- 비즈니스 규칙 포함
- Framework 독립적
- Freezed를 사용한 간결한 구현

**실제 예제: Booking**

```dart
// lib/domain/models/booking/booking.dart
@freezed
class Booking with _$Booking {
  const factory Booking({
    /// Optional ID (저장 전엔 null)
    int? id,
    
    /// 여행 시작일
    required DateTime startDate,
    
    /// 여행 종료일
    required DateTime endDate,
    
    /// 목적지
    required Destination destination,
    
    /// 선택한 액티비티 목록
    required List<Activity> activity,
  }) = _Booking;

  factory Booking.fromJson(Map<String, Object?> json) =>
      _$BookingFromJson(json);
}
```

**핵심 포인트**
- Freezed로 불변 객체 생성
- 필수/선택 필드 명확히 구분
- 도메인 개념을 직접적으로 표현
- JSON 직렬화 지원 (Data 레이어와의 연동)

#### 2.2.2 Repository 인터페이스

**Repository 패턴의 목적**
- 데이터 소스 추상화
- 테스트 용이성 (Mock/Fake 구현)
- 구현체 교체 가능 (Remote ↔ Local)

**실제 예제: BookingRepository**

```dart
// lib/data/repositories/booking/booking_repository.dart
abstract class BookingRepository {
  /// 현재 사용자의 예약 목록 조회
  Future<Result<List<BookingSummary>>> getBookingsList();

  /// ID로 특정 예약 상세 조회
  Future<Result<Booking>> getBooking(int id);

  /// 새 예약 생성
  Future<Result<void>> createBooking(Booking booking);

  /// 예약 삭제
  Future<Result<void>> delete(int id);
}
```

**핵심 포인트**
- Abstract class로 인터페이스 정의
- 모든 메서드가 `Result` 타입 반환
- 비즈니스 용어 사용 (기술 용어 X)
- Domain 모델만 사용 (DTO 사용 X)

#### 2.2.3 Use Case 패턴

**Use Case를 사용하는 경우**
- 여러 Repository를 조합하는 복잡한 로직
- 재사용 가능한 비즈니스 규칙
- 도메인 로직이 복잡한 경우

**실제 예제: BookingCreateUseCase**

```dart
// lib/domain/use_cases/booking/booking_create_use_case.dart
class BookingCreateUseCase {
  BookingCreateUseCase({
    required DestinationRepository destinationRepository,
    required ActivityRepository activityRepository,
    required BookingRepository bookingRepository,
  })  : _destinationRepository = destinationRepository,
        _activityRepository = activityRepository,
        _bookingRepository = bookingRepository;

  final DestinationRepository _destinationRepository;
  final ActivityRepository _activityRepository;
  final BookingRepository _bookingRepository;
  final _log = Logger('BookingCreateUseCase');

  /// ItineraryConfig에서 Booking 생성
  Future<Result<Booking>> createFrom(ItineraryConfig config) async {
    // 1. Destination 검증 및 로드
    if (config.destination == null) {
      return Result.error(Exception('Destination is not set'));
    }
    
    final destinationResult = await _fetchDestination(config.destination!);
    if (destinationResult is Error) {
      return Result.error(destinationResult.error);
    }
    final destination = (destinationResult as Ok<Destination>).value;

    // 2. Activities 검증 및 로드
    if (config.activities.isEmpty) {
      return Result.error(Exception('Activities are not set'));
    }
    
    final activitiesResult = 
        await _activityRepository.getByDestination(config.destination!);
    if (activitiesResult is Error) {
      return Result.error(activitiesResult.error);
    }
    final activities = (activitiesResult as Ok<List<Activity>>).value
        .where((a) => config.activities.contains(a.ref))
        .toList();

    // 3. 날짜 검증
    if (config.startDate == null || config.endDate == null) {
      return Result.error(Exception('Dates are not set'));
    }

    // 4. Booking 생성 및 저장
    final booking = Booking(
      startDate: config.startDate!,
      endDate: config.endDate!,
      destination: destination,
      activity: activities,
    );

    final saveResult = await _bookingRepository.createBooking(booking);
    if (saveResult is Error) {
      return Result.error(saveResult.error);
    }

    return Result.ok(booking);
  }

  Future<Result<Destination>> _fetchDestination(String ref) async {
    final result = await _destinationRepository.getDestinations();
    switch (result) {
      case Ok<List<Destination>>():
        final destination = result.value.firstWhere(
          (d) => d.ref == ref,
        );
        return Result.ok(destination);
      case Error<List<Destination>>():
        return Result.error(result.error);
    }
  }
}
```

**핵심 포인트**
- 여러 Repository를 조합
- 비즈니스 규칙 검증 포함
- 재사용 가능한 단위로 분리
- 단일 책임 원칙 준수

#### 2.2.4 Result 타입을 통한 에러 처리

**Result 패턴의 장점**
- 예외 대신 타입으로 에러 표현
- 강제적인 에러 처리
- 함수형 프로그래밍 스타일

자세한 내용은 [3.2 Result 패턴](#32-result-패턴)을 참고하세요.

---

### 2.3 Data Layer

Data 레이어는 실제 데이터 소스와 통신하며 Domain 레이어의 인터페이스를 구현합니다.

#### 2.3.1 Repository 구현체

**구현체의 책임**
- Data Source와 통신
- DTO ↔ Domain Model 변환
- 에러 처리 및 Result 타입 반환
- 캐싱 전략 (선택적)

**실제 예제: BookingRepositoryRemote**

```dart
// lib/data/repositories/booking/booking_repository_remote.dart
class BookingRepositoryRemote implements BookingRepository {
  BookingRepositoryRemote({required ApiClient apiClient})
      : _apiClient = apiClient;

  final ApiClient _apiClient;
  List<Destination>? _cachedDestinations;

  @override
  Future<Result<void>> createBooking(Booking booking) async {
    try {
      // Domain Model → DTO 변환
      final bookingApiModel = BookingApiModel(
        startDate: booking.startDate,
        endDate: booking.endDate,
        name: '${booking.destination.name}, ${booking.destination.continent}',
        destinationRef: booking.destination.ref,
        activitiesRef: booking.activity.map((a) => a.ref).toList(),
      );
      
      return _apiClient.postBooking(bookingApiModel);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Booking>> getBooking(int id) async {
    try {
      // 1. API에서 예약 정보 가져오기
      final resultBooking = await _apiClient.getBooking(id);
      if (resultBooking is Error) {
        return Result.error(resultBooking.error);
      }
      final bookingApi = (resultBooking as Ok<BookingApiModel>).value;

      // 2. 캐시된 Destination 사용 또는 로드
      if (_cachedDestinations == null) {
        final resultDest = await _apiClient.getDestinations();
        if (resultDest is Error) {
          return Result.error(resultDest.error);
        }
        _cachedDestinations = (resultDest as Ok<List<Destination>>).value;
      }

      final destination = _cachedDestinations!.firstWhere(
        (d) => d.ref == bookingApi.destinationRef,
      );

      // 3. Activities 로드
      final resultActivities = 
          await _apiClient.getActivityByDestination(destination.ref);
      if (resultActivities is Error) {
        return Result.error(resultActivities.error);
      }
      final activities = (resultActivities as Ok<List<Activity>>).value
          .where((a) => bookingApi.activitiesRef.contains(a.ref))
          .toList();

      // 4. DTO → Domain Model 변환
      return Result.ok(
        Booking(
          id: bookingApi.id,
          startDate: bookingApi.startDate,
          endDate: bookingApi.endDate,
          destination: destination,
          activity: activities,
        ),
      );
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<BookingSummary>>> getBookingsList() async {
    try {
      final result = await _apiClient.getBookings();
      switch (result) {
        case Ok<List<BookingApiModel>>():
          final bookingsApi = result.value;
          // DTO → Domain Model 변환
          return Result.ok(
            bookingsApi.map((api) => BookingSummary(
              id: api.id!,
              name: api.name,
              startDate: api.startDate,
              endDate: api.endDate,
            )).toList(),
          );
        case Error<List<BookingApiModel>>():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> delete(int id) async {
    try {
      return _apiClient.deleteBooking(id);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
```

**핵심 포인트**
- API Client를 주입받아 사용
- try-catch로 예외를 Result로 변환
- DTO와 Domain Model 간 변환
- 캐싱 로직 포함 가능

#### 2.3.2 다중 구현 전략

**왜 다중 구현이 필요한가?**
- 개발 환경별 데이터 소스 분리
- 오프라인 모드 지원
- 테스트 용이성

**구현 예시**
```
BookingRepository (interface)
    ├── BookingRepositoryRemote (실제 API)
    ├── BookingRepositoryLocal (로컬 데이터)
    └── FakeBookingRepository (테스트용)
```

**환경별 주입 설정**

```dart
// lib/config/dependencies.dart

// Remote 환경 (프로덕션/스테이징)
List<SingleChildWidget> get providersRemote {
  return [
    Provider(create: (context) => ApiClient()),
    Provider(
      create: (context) =>
          BookingRepositoryRemote(apiClient: context.read())
              as BookingRepository,
    ),
    // ... 다른 providers
  ];
}

// Local 환경 (개발/테스트)
List<SingleChildWidget> get providersLocal {
  return [
    Provider.value(value: LocalDataService()),
    Provider(
      create: (context) =>
          BookingRepositoryLocal(localDataService: context.read())
              as BookingRepository,
    ),
    // ... 다른 providers
  ];
}
```

#### 2.3.3 Data Source

**Data Source의 역할**
- 외부 시스템과의 직접 통신
- HTTP 요청, 로컬 파일 읽기 등
- 저수준 에러 처리

**실제 예제: ApiClient**

```dart
// lib/data/services/api/api_client.dart
class ApiClient {
  ApiClient({String? host, int? port})
      : _host = host ?? 'localhost',
        _port = port ?? 8080;

  final String _host;
  final int _port;
  AuthHeaderProvider? _authHeaderProvider;

  Future<Result<List<BookingApiModel>>> getBookings() async {
    final client = HttpClient();
    try {
      final request = await client.get(_host, _port, '/booking');
      await _authHeader(request.headers);
      final response = await request.close();
      
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final json = jsonDecode(stringData) as List<dynamic>;
        final bookings = json
            .map((e) => BookingApiModel.fromJson(e))
            .toList();
        return Result.ok(bookings);
      } else {
        return const Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<void> _authHeader(HttpHeaders headers) async {
    final header = _authHeaderProvider?.call();
    if (header != null) {
      headers.add(HttpHeaders.authorizationHeader, header);
    }
  }
}
```

**핵심 포인트**
- HTTP 통신의 세부사항 캡슐화
- 인증 헤더 자동 추가
- 에러를 Result 타입으로 변환
- finally에서 리소스 정리

---

## 3. 핵심 패턴 가이드

### 3.1 Command 패턴

Command 패턴은 비동기 작업의 실행과 상태를 캡슐화하는 유틸리티입니다.

#### 3.1.1 Command의 구조

```dart
// lib/utils/command.dart
abstract class Command<T> extends ChangeNotifier {
  bool _running = false;
  bool get running => _running;

  Result<T>? _result;
  bool get error => _result is Error;
  bool get completed => _result is Ok;
  Result? get result => _result;

  void clearResult() {
    _result = null;
    notifyListeners();
  }

  Future<void> _execute(CommandAction0<T> action) async {
    // 중복 실행 방지
    if (_running) return;

    _running = true;
    _result = null;
    notifyListeners();

    try {
      _result = await action();
    } finally {
      _running = false;
      notifyListeners();
    }
  }
}

// 인자 없는 Command
class Command0<T> extends Command<T> {
  Command0(this._action);
  final CommandAction0<T> _action;

  Future<void> execute() async {
    await _execute(_action);
  }
}

// 인자 1개인 Command
class Command1<T, A> extends Command<T> {
  Command1(this._action);
  final CommandAction1<T, A> _action;

  Future<void> execute(A argument) async {
    await _execute(() => _action(argument));
  }
}
```

#### 3.1.2 Command 사용 패턴

**ViewModel에서 Command 정의**

```dart
class MyViewModel extends ChangeNotifier {
  MyViewModel({required MyRepository repository})
      : _repository = repository {
    // 초기화 시 Command 생성
    loadData = Command0(_loadData)..execute(); // 즉시 실행
    saveData = Command1(_saveData);
  }

  final MyRepository _repository;
  
  late Command0<List<Data>> loadData;
  late Command1<void, Data> saveData;

  Future<Result<List<Data>>> _loadData() async {
    return await _repository.getData();
  }

  Future<Result<void>> _saveData(Data data) async {
    return await _repository.save(data);
  }
}
```

**View에서 Command 사용**

```dart
class MyScreen extends StatefulWidget {
  final MyViewModel viewModel;
  // ...
}

class _MyScreenState extends State<MyScreen> {
  @override
  void initState() {
    super.initState();
    // Command 결과 리스닝
    widget.viewModel.saveData.addListener(_onSaveResult);
  }

  @override
  void dispose() {
    widget.viewModel.saveData.removeListener(_onSaveResult);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 로딩 상태 표시
          ListenableBuilder(
            listenable: widget.viewModel.loadData,
            builder: (context, child) {
              if (widget.viewModel.loadData.running) {
                return CircularProgressIndicator();
              }
              if (widget.viewModel.loadData.error) {
                return ErrorWidget();
              }
              return DataList();
            },
          ),
          
          // 저장 버튼
          ElevatedButton(
            onPressed: widget.viewModel.saveData.running
                ? null // 실행 중엔 비활성화
                : () => widget.viewModel.saveData.execute(data),
            child: Text('저장'),
          ),
        ],
      ),
    );
  }

  void _onSaveResult() {
    final command = widget.viewModel.saveData;
    
    if (command.completed) {
      command.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('저장 완료')),
      );
    }
    
    if (command.error) {
      command.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('저장 실패')),
      );
    }
  }
}
```

#### 3.1.3 Command 패턴의 장점

- ✅ **상태 자동 관리**: running, completed, error 상태 자동 처리
- ✅ **중복 실행 방지**: 실행 중인 Command는 재실행 불가
- ✅ **결과 캐싱**: 결과를 저장하고 UI에서 소비 가능
- ✅ **테스트 용이**: Command 상태를 검증하기 쉬움
- ✅ **UI 로직 분리**: 버튼 비활성화 등의 로직이 자동화

---

### 3.2 Result 패턴

Result 패턴은 함수형 에러 처리를 위한 타입입니다.

#### 3.2.1 Result 타입 정의

```dart
// lib/utils/result.dart
sealed class Result<T> {
  const Result();

  const factory Result.ok(T value) = Ok._;
  const factory Result.error(Exception error) = Error._;
}

final class Ok<T> extends Result<T> {
  const Ok._(this.value);
  final T value;
}

final class Error<T> extends Result<T> {
  const Error._(this.error);
  final Exception error;
}
```

#### 3.2.2 Result 사용 패턴

**Repository에서 Result 반환**

```dart
abstract class UserRepository {
  Future<Result<User>> getUser();
}

class UserRepositoryImpl implements UserRepository {
  @override
  Future<Result<User>> getUser() async {
    try {
      final response = await api.get('/user');
      final user = User.fromJson(response);
      return Result.ok(user);
    } on HttpException catch (e) {
      return Result.error(e);
    } on FormatException catch (e) {
      return Result.error(Exception('Parse error: $e'));
    }
  }
}
```

**Switch Expression으로 Result 처리**

```dart
Future<void> loadUser() async {
  final result = await userRepository.getUser();
  
  switch (result) {
    case Ok<User>():
      _user = result.value;
      print('User loaded: ${result.value.name}');
    case Error<User>():
      _error = result.error;
      print('Error: ${result.error}');
  }
  
  notifyListeners();
}
```

**패턴 매칭으로 Result 처리**

```dart
Future<void> saveData() async {
  final result = await repository.save(data);
  
  if (result is Ok) {
    print('Save successful');
  } else if (result is Error) {
    print('Save failed: ${result.error}');
  }
}
```

#### 3.2.3 Result 패턴의 장점

- ✅ **명시적 에러 처리**: 컴파일러가 에러 처리를 강제
- ✅ **타입 안전성**: 성공/실패 케이스를 타입으로 표현
- ✅ **예외 없음**: try-catch 없이 에러 처리 가능
- ✅ **함수형 스타일**: 순수 함수처럼 동작
- ✅ **테스트 용이**: 에러 케이스 테스트가 간단

---

### 3.3 Dependency Injection

본 프로젝트는 Provider 패키지를 사용한 Dependency Injection을 구현합니다.

#### 3.3.1 Provider를 통한 DI

**의존성 구성 파일**

```dart
// lib/config/dependencies.dart
List<SingleChildWidget> get providersRemote {
  return [
    // Services (Data Sources)
    Provider(create: (context) => AuthApiClient()),
    Provider(create: (context) => ApiClient()),
    Provider(create: (context) => SharedPreferencesService()),
    
    // Repositories
    ChangeNotifierProvider(
      create: (context) => AuthRepositoryRemote(
        authApiClient: context.read(),
        apiClient: context.read(),
        sharedPreferencesService: context.read(),
      ) as AuthRepository,
    ),
    Provider(
      create: (context) => BookingRepositoryRemote(
        apiClient: context.read(),
      ) as BookingRepository,
    ),
    
    // Use Cases
    Provider(
      create: (context) => BookingCreateUseCase(
        destinationRepository: context.read(),
        activityRepository: context.read(),
        bookingRepository: context.read(),
      ),
    ),
  ];
}
```

**앱 진입점에서 Provider 주입**

```dart
// lib/main_development.dart
void main() {
  runApp(
    MultiProvider(
      providers: providersLocal, // 또는 providersRemote
      child: const MainApp(),
    ),
  );
}
```

#### 3.3.2 Router에서 ViewModel 생성

```dart
// lib/routing/router.dart
GoRouter router(AuthRepository authRepository) => GoRouter(
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        // context.read()로 의존성 주입
        final viewModel = HomeViewModel(
          bookingRepository: context.read(),
          userRepository: context.read(),
        );
        return HomeScreen(viewModel: viewModel);
      },
    ),
    GoRoute(
      path: Routes.booking,
      builder: (context, state) {
        final viewModel = BookingViewModel(
          itineraryConfigRepository: context.read(),
          createBookingUseCase: context.read(),
          shareBookingUseCase: context.read(),
          bookingRepository: context.read(),
        );
        return BookingScreen(viewModel: viewModel);
      },
    ),
  ],
);
```

#### 3.3.3 테스트를 위한 Fake 구현

**Fake Repository 구현**

```dart
// testing/fakes/repositories/fake_booking_repository.dart
class FakeBookingRepository implements BookingRepository {
  final List<Booking> _bookings = [];

  @override
  Future<Result<List<BookingSummary>>> getBookingsList() async {
    return Result.ok(
      _bookings.map((b) => BookingSummary(
        id: b.id!,
        name: b.destination.name,
        startDate: b.startDate,
        endDate: b.endDate,
      )).toList(),
    );
  }

  @override
  Future<Result<Booking>> getBooking(int id) async {
    try {
      final booking = _bookings.firstWhere((b) => b.id == id);
      return Result.ok(booking);
    } catch (e) {
      return Result.error(Exception('Booking not found'));
    }
  }

  @override
  Future<Result<void>> createBooking(Booking booking) async {
    final newBooking = booking.copyWith(id: _bookings.length);
    _bookings.add(newBooking);
    return Result.ok(null);
  }

  @override
  Future<Result<void>> delete(int id) async {
    _bookings.removeWhere((b) => b.id == id);
    return Result.ok(null);
  }
}
```

**테스트에서 Fake 사용**

```dart
// test/ui/home/widgets/home_screen_test.dart
void main() {
  group('HomeScreen tests', () {
    late HomeViewModel viewModel;
    late FakeBookingRepository bookingRepository;

    setUp(() {
      bookingRepository = FakeBookingRepository()
        ..createBooking(kBooking);
      
      viewModel = HomeViewModel(
        bookingRepository: bookingRepository,
        userRepository: FakeUserRepository(),
      );
    });

    testWidgets('should delete booking', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomeScreen(viewModel: viewModel),
        ),
      );
      
      // Swipe to delete
      await tester.drag(find.text('Booking'), Offset(-1000, 0));
      await tester.pumpAndSettle();
      
      // Verify deletion
      expect(bookingRepository.bookings, isEmpty);
    });
  });
}
```

---

## 4. 프로젝트 규모별 적용 가이드

동일한 아키텍처 원칙을 유지하면서 프로젝트 규모에 맞게 구조를 조정할 수 있습니다.

### 4.1 소규모 프로젝트 (1-3개월, 1-3명)

**특징**
- 빠른 개발 속도 우선
- 최소한의 추상화
- 단순한 비즈니스 로직

**적용 가이드**

#### 레이어 구조
```
lib/
  ├── ui/
  │   ├── screens/
  │   │   ├── home_screen.dart
  │   │   └── detail_screen.dart
  │   └── widgets/
  ├── models/
  │   └── user.dart
  └── services/
      ├── api_service.dart
      └── database_service.dart
```

#### 단순화 전략

**1. Use Case 생략**
- ViewModel에서 Repository 직접 호출
- 복잡한 로직이 없으면 Use Case 불필요

```dart
class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required this.repository});
  
  final BookingRepository repository;
  List<Booking> bookings = [];

  Future<void> loadBookings() async {
    final result = await repository.getBookingsList();
    if (result is Ok) {
      bookings = result.value;
      notifyListeners();
    }
  }
}
```

**2. Repository 단일 구현**
- 인터페이스 없이 직접 구현
- 필요할 때 추상화 추가

```dart
// services/booking_service.dart
class BookingService {
  final ApiClient _api;
  
  Future<Result<List<Booking>>> getBookings() async {
    // 구현
  }
}
```

**3. 간단한 상태 관리**
- Command 패턴 대신 단순 bool 플래그
- 복잡도가 낮으면 충분

```dart
class SimpleViewModel extends ChangeNotifier {
  bool isLoading = false;
  String? error;
  
  Future<void> loadData() async {
    isLoading = true;
    error = null;
    notifyListeners();
    
    try {
      // 데이터 로드
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
```

**언제 확장해야 하나?**
- 여러 환경 (dev/staging/prod)이 필요할 때
- 테스트가 복잡해질 때
- 비즈니스 로직이 증가할 때

---

### 4.2 중규모 프로젝트 (3-6개월, 3-5명)

**특징**
- 균형잡힌 아키텍처
- 유지보수성과 개발 속도 모두 중요
- Compass 앱 수준

**적용 가이드**

#### 레이어 구조
```
lib/
  ├── ui/
  │   ├── home/
  │   │   ├── view_models/
  │   │   │   └── home_viewmodel.dart
  │   │   └── widgets/
  │   │       ├── home_screen.dart
  │   │       └── booking_card.dart
  │   └── booking/
  ├── domain/
  │   ├── models/
  │   │   ├── booking/
  │   │   └── user/
  │   └── use_cases/
  │       └── booking/
  │           └── booking_create_use_case.dart
  └── data/
      ├── repositories/
      │   ├── booking/
      │   │   ├── booking_repository.dart
      │   │   ├── booking_repository_remote.dart
      │   │   └── booking_repository_local.dart
      │   └── user/
      └── services/
```

**권장 사항**

**1. Feature별 모듈화**
- 기능별로 디렉토리 분리
- 각 Feature는 독립적인 ViewModel과 Widget 보유

**2. Use Case 선택적 적용**
- 복잡한 로직: Use Case 사용
- 단순 CRUD: ViewModel에서 Repository 직접 호출

```dart
// 복잡한 로직 → Use Case
class BookingViewModel extends ChangeNotifier {
  BookingViewModel({required this.createBookingUseCase});
  
  final BookingCreateUseCase createBookingUseCase;
  
  Future<void> createBooking() async {
    final result = await createBookingUseCase.createFrom(config);
    // ...
  }
}

// 단순 CRUD → Repository 직접 사용
class UserViewModel extends ChangeNotifier {
  UserViewModel({required this.userRepository});
  
  final UserRepository userRepository;
  
  Future<void> loadUser() async {
    final result = await userRepository.getUser();
    // ...
  }
}
```

**3. Repository 추상화**
- 인터페이스와 다중 구현 사용
- Remote/Local 구현 분리
- 테스트용 Fake 구현 제공

**4. Command 패턴 활용**
- 비동기 작업에 Command 사용
- 중복 실행 방지 및 상태 관리

---

### 4.3 대규모 프로젝트 (6개월 이상, 5명 이상)

**특징**
- 엄격한 아키텍처 규칙
- 높은 확장성과 유지보수성
- 대규모 팀 협업

**적용 가이드**

#### 레이어 구조
```
lib/
  ├── features/
  │   ├── booking/
  │   │   ├── presentation/
  │   │   │   ├── view_models/
  │   │   │   ├── widgets/
  │   │   │   └── screens/
  │   │   ├── domain/
  │   │   │   ├── entities/
  │   │   │   ├── repositories/
  │   │   │   └── use_cases/
  │   │   └── data/
  │   │       ├── repositories/
  │   │       ├── data_sources/
  │   │       └── models/
  │   └── user/
  ├── core/
  │   ├── utils/
  │   ├── errors/
  │   └── network/
  └── shared/
```

**권장 사항**

**1. Feature 모듈화**
- 각 Feature는 완전히 독립된 모듈
- Feature 간 직접 의존 금지
- Shared layer를 통한 공통 코드 공유

```dart
// ❌ 잘못된 예
// features/booking/presentation/booking_screen.dart
import '../../user/domain/entities/user.dart'; // Feature 간 직접 의존

// ✅ 올바른 예
// shared/domain/entities/user.dart
// features/booking과 features/user 모두 shared의 User 사용
```

**2. 모든 비즈니스 로직을 Use Case화**
- 단순 CRUD도 Use Case로 래핑
- 일관성 있는 구조
- 비즈니스 규칙의 명확한 문서화

```dart
// 단순 조회도 Use Case로
class GetUserUseCase {
  GetUserUseCase({required this.repository});
  
  final UserRepository repository;
  
  Future<Result<User>> execute() async {
    return repository.getUser();
  }
}

// 복잡한 로직도 Use Case로
class CreateBookingUseCase {
  // 여러 Repository 조합
}
```

**3. 고급 DI 패턴**
- Feature별 DI 컨테이너
- Lazy loading
- Scope 관리

```dart
// features/booking/di/booking_module.dart
class BookingModule {
  static List<SingleChildWidget> get providers => [
    // Data Sources
    Provider(create: (_) => BookingRemoteDataSource()),
    Provider(create: (_) => BookingLocalDataSource()),
    
    // Repositories
    Provider<BookingRepository>(
      create: (context) => BookingRepositoryImpl(
        remoteDataSource: context.read(),
        localDataSource: context.read(),
      ),
    ),
    
    // Use Cases
    Provider(create: (context) => GetBookingsUseCase(context.read())),
    Provider(create: (context) => CreateBookingUseCase(context.read())),
    Provider(create: (context) => DeleteBookingUseCase(context.read())),
    
    // ViewModels (ChangeNotifierProvider for lazy creation)
  ];
}
```

**4. Layer 간 엄격한 분리**
- DTO와 Entity 명확히 구분
- Mapper 클래스 사용

```dart
// data/models/booking_dto.dart
class BookingDto {
  final int id;
  final String destinationRef;
  // API 구조 그대로
}

// data/mappers/booking_mapper.dart
class BookingMapper {
  static Booking toEntity(BookingDto dto, Destination destination) {
    return Booking(
      id: dto.id,
      destination: destination,
      // 변환 로직
    );
  }
  
  static BookingDto toDto(Booking entity) {
    return BookingDto(
      id: entity.id,
      destinationRef: entity.destination.ref,
      // 변환 로직
    );
  }
}
```

**5. 에러 처리 고도화**
- 커스텀 Exception 계층
- 에러 로깅 및 분석
- 사용자 친화적 에러 메시지

```dart
// core/errors/failures.dart
sealed class Failure {
  const Failure(this.message);
  final String message;
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super('Network error occurred');
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure() : super('Cache error occurred');
}

// Result 타입 확장
sealed class Result<T> {
  const factory Result.success(T data) = Success;
  const factory Result.failure(Failure failure) = Failed;
}
```

**6. 성능 최적화**
- Repository 레벨 캐싱 전략
- 페이지네이션
- 데이터 prefetching

---

## 5. 테스트 전략

### 5.1 테스트 피라미드

```
        /\
       /UI\       ← 적음 (통합 테스트)
      /────\
     /Widget\     ← 중간 (위젯 테스트)
    /────────\
   /Unit Tests\   ← 많음 (단위 테스트)
  /────────────\
```

### 5.2 단위 테스트

#### Use Case 테스트

```dart
// test/domain/use_cases/booking_create_use_case_test.dart
void main() {
  group('BookingCreateUseCase tests', () {
    test('Create booking successfully', () async {
      // Arrange
      final useCase = BookingCreateUseCase(
        activityRepository: FakeActivityRepository(),
        destinationRepository: FakeDestinationRepository(),
        bookingRepository: FakeBookingRepository(),
      );

      final config = ItineraryConfig(
        startDate: DateTime(2024, 1, 1),
        endDate: DateTime(2024, 2, 12),
        destination: 'dest-1',
        activities: ['activity-1'],
      );

      // Act
      final result = await useCase.createFrom(config);

      // Assert
      expect(result, isA<Ok<Booking>>());
      expect((result as Ok<Booking>).value.destination.ref, 'dest-1');
    });

    test('Fail when destination is not set', () async {
      // Arrange
      final useCase = BookingCreateUseCase(
        activityRepository: FakeActivityRepository(),
        destinationRepository: FakeDestinationRepository(),
        bookingRepository: FakeBookingRepository(),
      );

      final config = ItineraryConfig(
        startDate: DateTime(2024, 1, 1),
        endDate: DateTime(2024, 2, 12),
        destination: null, // 목적지 없음
        activities: ['activity-1'],
      );

      // Act
      final result = await useCase.createFrom(config);

      // Assert
      expect(result, isA<Error>());
    });
  });
}
```

#### Repository 테스트

```dart
// test/data/repositories/booking_repository_remote_test.dart
void main() {
  group('BookingRepositoryRemote', () {
    late BookingRepositoryRemote repository;
    late MockApiClient mockApiClient;

    setUp(() {
      mockApiClient = MockApiClient();
      repository = BookingRepositoryRemote(apiClient: mockApiClient);
    });

    test('getBookingsList returns list on success', () async {
      // Arrange
      when(() => mockApiClient.getBookings()).thenAnswer(
        (_) async => Result.ok([
          BookingApiModel(
            id: 1,
            name: 'Test Booking',
            startDate: DateTime(2024, 1, 1),
            endDate: DateTime(2024, 1, 10),
            destinationRef: 'dest-1',
            activitiesRef: [],
          ),
        ]),
      );

      // Act
      final result = await repository.getBookingsList();

      // Assert
      expect(result, isA<Ok<List<BookingSummary>>>());
      expect((result as Ok).value.length, 1);
    });

    test('getBookingsList returns error on failure', () async {
      // Arrange
      when(() => mockApiClient.getBookings()).thenAnswer(
        (_) async => Result.error(Exception('Network error')),
      );

      // Act
      final result = await repository.getBookingsList();

      // Assert
      expect(result, isA<Error>());
    });
  });
}
```

### 5.3 Widget 테스트

```dart
// test/ui/home/widgets/home_screen_test.dart
void main() {
  group('HomeScreen tests', () {
    late HomeViewModel viewModel;
    late FakeBookingRepository bookingRepository;

    setUp(() {
      bookingRepository = FakeBookingRepository()
        ..createBooking(kBooking);
      
      viewModel = HomeViewModel(
        bookingRepository: bookingRepository,
        userRepository: FakeUserRepository(),
      );
    });

    testWidgets('should load screen', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: HomeScreen(viewModel: viewModel),
        ),
      );
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('should show user name', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: HomeScreen(viewModel: viewModel),
        ),
      );
      await tester.pumpAndSettle();

      // Assert
      expect(find.text("NAME's Trips"), findsOneWidget);
    });

    testWidgets('should delete booking on swipe', (tester) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: HomeScreen(viewModel: viewModel),
        ),
      );
      await tester.pumpAndSettle();

      // Act
      await tester.drag(
        find.text('Test Booking'),
        const Offset(-1000, 0),
      );
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Test Booking'), findsNothing);
      expect(bookingRepository.bookings, isEmpty);
    });
  });
}
```

### 5.4 통합 테스트

```dart
// integration_test/app_local_data_test.dart
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App with local data', () {
    testWidgets('Full booking flow', (tester) async {
      // 앱 시작
      await tester.pumpWidget(
        MultiProvider(
          providers: providersLocal,
          child: const MainApp(),
        ),
      );
      await tester.pumpAndSettle();

      // 홈 화면 확인
      expect(find.byType(HomeScreen), findsOneWidget);

      // 새 예약 버튼 탭
      await tester.tap(find.byKey(const ValueKey('booking-button')));
      await tester.pumpAndSettle();

      // 검색 화면으로 이동 확인
      expect(find.byType(SearchFormScreen), findsOneWidget);

      // 목적지 선택
      await tester.tap(find.text('Europe'));
      await tester.pumpAndSettle();

      // 날짜 선택
      await tester.tap(find.text('Select dates'));
      // ... 날짜 선택 로직

      // 예약 생성
      await tester.tap(find.text('Create booking'));
      await tester.pumpAndSettle();

      // 예약 목록에 새 예약 표시 확인
      expect(find.text('Europe'), findsWidgets);
    });
  });
}
```

### 5.5 Fake 구현체 활용

Fake는 실제 동작하는 간단한 구현체로, Mock보다 실제 시나리오에 가깝습니다.

```dart
// testing/fakes/repositories/fake_booking_repository.dart
class FakeBookingRepository implements BookingRepository {
  final List<Booking> _bookings = [];

  void createBooking(Booking booking) {
    _bookings.add(booking.copyWith(id: _bookings.length));
  }

  @override
  Future<Result<List<BookingSummary>>> getBookingsList() async {
    // 실제처럼 약간의 지연
    await Future.delayed(const Duration(milliseconds: 100));
    
    return Result.ok(
      _bookings.map((b) => BookingSummary(
        id: b.id!,
        name: '${b.destination.name}, ${b.destination.continent}',
        startDate: b.startDate,
        endDate: b.endDate,
      )).toList(),
    );
  }

  @override
  Future<Result<Booking>> getBooking(int id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    
    try {
      final booking = _bookings.firstWhere((b) => b.id == id);
      return Result.ok(booking);
    } catch (e) {
      return Result.error(Exception('Booking not found'));
    }
  }

  @override
  Future<Result<void>> delete(int id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    
    _bookings.removeWhere((b) => b.id == id);
    return Result.ok(null);
  }

  // 테스트 헬퍼
  List<Booking> get bookings => _bookings;
  void clear() => _bookings.clear();
}
```

**Fake vs Mock**
- **Fake**: 실제 동작하는 간단한 구현 (메모리 저장소 등)
- **Mock**: 특정 호출과 반환값을 설정 (Mocktail 등)

**언제 Fake를 사용하나?**
- 여러 테스트에서 재사용
- 복잡한 상태 관리가 필요한 경우
- 실제 동작을 시뮬레이션하고 싶을 때

**언제 Mock을 사용하나?**
- 특정 메서드 호출 검증
- 한 번만 사용하는 경우
- 에러 케이스 테스트

---

## 6. 디렉토리 구조

### 6.1 권장 폴더 구조

```
lib/
├── config/                    # 앱 전역 설정
│   ├── assets.dart           # Asset 경로 상수
│   └── dependencies.dart     # DI 설정
│
├── data/                     # Data Layer
│   ├── repositories/         # Repository 구현체
│   │   ├── booking/
│   │   │   ├── booking_repository.dart            # 인터페이스
│   │   │   ├── booking_repository_remote.dart     # Remote 구현
│   │   │   └── booking_repository_local.dart      # Local 구현
│   │   └── user/
│   │
│   └── services/             # Data Sources
│       ├── api/
│       │   ├── api_client.dart
│       │   ├── auth_api_client.dart
│       │   └── model/        # API DTOs
│       │       ├── booking/
│       │       └── user/
│       └── local/
│           └── local_data_service.dart
│
├── domain/                   # Domain Layer
│   ├── models/              # Entities
│   │   ├── booking/
│   │   │   ├── booking.dart
│   │   │   ├── booking.freezed.dart
│   │   │   └── booking_summary.dart
│   │   ├── user/
│   │   └── destination/
│   │
│   └── use_cases/           # Use Cases
│       └── booking/
│           ├── booking_create_use_case.dart
│           └── booking_share_use_case.dart
│
├── routing/                 # 라우팅 설정
│   ├── router.dart
│   └── routes.dart
│
├── ui/                      # UI Layer
│   ├── core/               # 공통 UI 요소
│   │   ├── localization/
│   │   ├── themes/
│   │   └── ui/            # 재사용 위젯
│   │
│   ├── home/              # Feature: Home
│   │   ├── view_models/
│   │   │   └── home_viewmodel.dart
│   │   └── widgets/
│   │       ├── home_screen.dart
│   │       └── home_title.dart
│   │
│   ├── booking/           # Feature: Booking
│   │   ├── view_models/
│   │   └── widgets/
│   │
│   └── search_form/       # Feature: Search
│       ├── view_models/
│       └── widgets/
│
├── utils/                  # 유틸리티
│   ├── command.dart
│   ├── result.dart
│   └── image_error_listener.dart
│
├── main.dart              # 앱 진입점
├── main_development.dart  # 개발 환경
└── main_staging.dart      # 스테이징 환경

test/                      # 테스트
├── data/
│   ├── repositories/
│   └── services/
├── domain/
│   └── use_cases/
└── ui/
    ├── home/
    └── booking/

testing/                   # 테스트 헬퍼
├── fakes/
│   ├── repositories/
│   └── services/
├── mocks.dart
└── models/               # 테스트 데이터

integration_test/         # 통합 테스트
└── app_local_data_test.dart
```

### 6.2 파일 명명 규칙

**일반 원칙**
- snake_case 사용
- 명확하고 설명적인 이름
- 파일 이름과 클래스 이름 일치

**패턴별 명명**

```dart
// ViewModels
home_viewmodel.dart          → class HomeViewModel
booking_viewmodel.dart       → class BookingViewModel

// Screens/Widgets
home_screen.dart             → class HomeScreen
booking_card.dart            → class BookingCard

// Repositories
booking_repository.dart      → abstract class BookingRepository
booking_repository_remote.dart → class BookingRepositoryRemote
booking_repository_local.dart  → class BookingRepositoryLocal

// Models
booking.dart                 → class Booking
booking_summary.dart         → class BookingSummary

// Use Cases
booking_create_use_case.dart → class BookingCreateUseCase
booking_share_use_case.dart  → class BookingShareUseCase

// Services
api_client.dart              → class ApiClient
local_data_service.dart      → class LocalDataService

// Tests
home_viewmodel_test.dart
home_screen_test.dart
booking_repository_remote_test.dart

// Fakes
fake_booking_repository.dart → class FakeBookingRepository
fake_user_repository.dart    → class FakeUserRepository
```

### 6.3 규모별 구조 변형

**소규모: 평면 구조**
```
lib/
├── screens/
├── widgets/
├── models/
├── services/
└── utils/
```

**중규모: Feature별 분리 (Compass 앱)**
```
lib/
├── ui/
│   ├── home/
│   ├── booking/
│   └── search_form/
├── domain/
└── data/
```

**대규모: Feature 모듈화**
```
lib/
├── features/
│   ├── booking/
│   │   ├── presentation/
│   │   ├── domain/
│   │   └── data/
│   └── user/
├── core/
└── shared/
```

---

## 7. 베스트 프랙티스

### 7.1 상태 관리 원칙

#### 원칙 1: 상태는 ViewModel에서만 관리

```dart
// ✅ 올바른 예
class HomeViewModel extends ChangeNotifier {
  List<Booking> _bookings = [];
  bool _isLoading = false;
  
  List<Booking> get bookings => _bookings;
  bool get isLoading => _isLoading;
  
  void updateBookings(List<Booking> newBookings) {
    _bookings = newBookings;
    notifyListeners();
  }
}

// ❌ 잘못된 예
class HomeScreen extends StatefulWidget {
  // Widget에서 비즈니스 상태 관리
  List<Booking> bookings = [];
  
  void loadBookings() async {
    final result = await repository.getBookings();
    setState(() {
      bookings = result;
    });
  }
}
```

#### 원칙 2: 불변 상태 사용

```dart
// ✅ 올바른 예
class BookingViewModel extends ChangeNotifier {
  Booking? _booking;
  
  Booking? get booking => _booking;
  
  void updateBooking(Booking newBooking) {
    _booking = newBooking; // 새 객체로 교체
    notifyListeners();
  }
}

// ❌ 잘못된 예
class BookingViewModel extends ChangeNotifier {
  final Booking booking = Booking(...);
  
  void updateDestination(Destination dest) {
    booking.destination = dest; // 가변 객체 수정
    notifyListeners();
  }
}
```

#### 원칙 3: 상태 변경 후 항상 알림

```dart
// ✅ 올바른 예
Future<void> loadData() async {
  try {
    final result = await repository.getData();
    _data = result;
  } finally {
    notifyListeners(); // 항상 호출
  }
}

// ❌ 잘못된 예
Future<void> loadData() async {
  final result = await repository.getData();
  if (result is Ok) {
    _data = result.value;
    notifyListeners(); // 성공 시에만 호출
  }
  // 실패 시 UI 업데이트 안 됨
}
```

### 7.2 에러 처리 가이드

#### 원칙 1: Result 타입으로 일관되게 처리

```dart
// ✅ 올바른 예
Future<Result<User>> getUser() async {
  try {
    final response = await api.get('/user');
    return Result.ok(User.fromJson(response));
  } on HttpException catch (e) {
    return Result.error(e);
  } catch (e) {
    return Result.error(Exception('Unknown error: $e'));
  }
}

// ❌ 잘못된 예
Future<User> getUser() async {
  final response = await api.get('/user');
  return User.fromJson(response); // 에러 처리 없음
}
```

#### 원칙 2: 레이어별 에러 처리 책임

**Data Layer**: 기술적 에러를 Result로 변환
```dart
Future<Result<Data>> fetchData() async {
  try {
    final response = await http.get(url);
    return Result.ok(parse(response));
  } on SocketException {
    return Result.error(Exception('Network error'));
  } on FormatException {
    return Result.error(Exception('Invalid data format'));
  }
}
```

**Domain Layer**: 비즈니스 규칙 검증
```dart
Future<Result<Booking>> createBooking(Config config) async {
  if (config.destination == null) {
    return Result.error(Exception('Destination is required'));
  }
  if (config.startDate.isAfter(config.endDate)) {
    return Result.error(Exception('Invalid date range'));
  }
  // ...
}
```

**UI Layer**: 사용자에게 에러 표시
```dart
void _onLoadError() {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(AppLocalization.of(context).errorLoadingData),
      action: SnackBarAction(
        label: 'Retry',
        onPressed: viewModel.load.execute,
      ),
    ),
  );
}
```

#### 원칙 3: 로깅 활용

```dart
class HomeViewModel extends ChangeNotifier {
  final _log = Logger('HomeViewModel');
  
  Future<Result> _load() async {
    _log.fine('Loading bookings...');
    
    final result = await _repository.getBookings();
    switch (result) {
      case Ok():
        _log.fine('Loaded ${result.value.length} bookings');
      case Error():
        _log.warning('Failed to load bookings', result.error);
    }
    
    return result;
  }
}
```

### 7.3 코드 재사용 전략

#### 전략 1: 공통 Widget 분리

```dart
// ui/core/ui/error_indicator.dart
class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({
    super.key,
    required this.title,
    required this.label,
    required this.onPressed,
  });

  final String title;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 48),
          SizedBox(height: 16),
          Text(title),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: onPressed,
            child: Text(label),
          ),
        ],
      ),
    );
  }
}
```

#### 전략 2: Base ViewModel 패턴

```dart
// ui/core/base_viewmodel.dart
abstract class BaseViewModel extends ChangeNotifier {
  bool _disposed = false;

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}

// 사용
class HomeViewModel extends BaseViewModel {
  // dispose 걱정 없이 사용
}
```

#### 전략 3: Extension Methods

```dart
// utils/result_extensions.dart
extension ResultExtension<T> on Result<T> {
  bool get isOk => this is Ok<T>;
  bool get isError => this is Error<T>;
  
  T? get valueOrNull => this is Ok<T> ? (this as Ok<T>).value : null;
  Exception? get errorOrNull => this is Error<T> ? (this as Error<T>).error : null;
}

// 사용
final result = await repository.getData();
if (result.isOk) {
  final data = result.valueOrNull;
}
```

### 7.4 성능 최적화 팁

#### 팁 1: Selective rebuild with ListenableBuilder

```dart
// ✅ 효율적
ListenableBuilder(
  listenable: viewModel.loadCommand,
  builder: (context, child) {
    if (viewModel.loadCommand.running) {
      return CircularProgressIndicator();
    }
    return child!;
  },
  child: ExpensiveWidget(), // rebuild 안 됨
)

// ❌ 비효율적
ListenableBuilder(
  listenable: viewModel,
  builder: (context, _) {
    return Column(
      children: [
        if (viewModel.isLoading) CircularProgressIndicator(),
        ExpensiveWidget(), // 매번 rebuild
      ],
    );
  },
)
```

#### 팁 2: Repository 레벨 캐싱

```dart
class DestinationRepositoryRemote implements DestinationRepository {
  List<Destination>? _cachedDestinations;
  DateTime? _cacheTime;
  final _cacheDuration = Duration(minutes: 5);

  @override
  Future<Result<List<Destination>>> getDestinations() async {
    // 캐시 유효성 검사
    if (_cachedDestinations != null && _cacheTime != null) {
      if (DateTime.now().difference(_cacheTime!) < _cacheDuration) {
        return Result.ok(_cachedDestinations!);
      }
    }

    // 새 데이터 로드
    final result = await _apiClient.getDestinations();
    if (result is Ok) {
      _cachedDestinations = result.value;
      _cacheTime = DateTime.now();
    }
    
    return result;
  }
}
```

#### 팁 3: Command의 Lazy Execution

```dart
class MyViewModel extends ChangeNotifier {
  MyViewModel() {
    // 즉시 실행하지 않음
    loadData = Command0(_loadData);
    
    // 필요할 때만 실행
    // loadData.execute();
  }
  
  late Command0 loadData;
}
```

#### 팁 4: Const Constructors 활용

```dart
// ✅ 올바른 예
const ErrorIndicator(
  title: 'Error occurred',
  label: 'Retry',
  onPressed: retryFunction,
)

// Widget이 rebuild되어도 재생성 안 됨
```

---

## 8. 안티패턴과 주의사항

### 8.1 의존성 방향 위반

#### ❌ 안티패턴: Domain이 Data에 의존

```dart
// domain/models/booking.dart
import '../../data/services/api/api_client.dart'; // ❌ 잘못됨

class Booking {
  // Domain이 Data Layer를 알면 안 됨
}
```

#### ✅ 해결책: 인터페이스로 의존성 역전

```dart
// domain/repositories/booking_repository.dart
abstract class BookingRepository {
  Future<Result<Booking>> getBooking(int id);
}

// data/repositories/booking_repository_remote.dart
class BookingRepositoryRemote implements BookingRepository {
  // Data Layer가 Domain의 인터페이스를 구현
}
```

### 8.2 God Object (신 객체)

#### ❌ 안티패턴: 모든 것을 하는 ViewModel

```dart
class AppViewModel extends ChangeNotifier {
  // User 관련
  User? user;
  Future<void> loadUser() {}
  Future<void> updateUser() {}
  
  // Booking 관련
  List<Booking> bookings = [];
  Future<void> loadBookings() {}
  Future<void> createBooking() {}
  
  // Search 관련
  String searchQuery = '';
  List<Destination> searchResults = [];
  Future<void> search() {}
  
  // ... 100줄 이상
}
```

#### ✅ 해결책: 책임별로 ViewModel 분리

```dart
class HomeViewModel extends ChangeNotifier {
  // Home 화면 관련 로직만
}

class BookingViewModel extends ChangeNotifier {
  // Booking 관련 로직만
}

class SearchViewModel extends ChangeNotifier {
  // Search 관련 로직만
}
```

### 8.3 Widget에서 직접 Repository 호출

#### ❌ 안티패턴

```dart
class HomeScreen extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    final repository = context.read<BookingRepository>();
    
    return ElevatedButton(
      onPressed: () async {
        // Widget에서 직접 비즈니스 로직 실행
        final result = await repository.getBookings();
        if (result is Ok) {
          // ...
        }
      },
      child: Text('Load'),
    );
  }
}
```

#### ✅ 해결책: ViewModel을 통해서만 접근

```dart
class HomeScreen extends StatefulWidget {
  final HomeViewModel viewModel;
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: viewModel.loadBookings.execute,
      child: Text('Load'),
    );
  }
}
```

### 8.4 Stateful Widget 남용

#### ❌ 안티패턴

```dart
class BookingScreen extends StatefulWidget {
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  List<Booking> bookings = [];
  bool isLoading = false;
  
  @override
  void initState() {
    super.initState();
    loadBookings();
  }
  
  Future<void> loadBookings() async {
    setState(() => isLoading = true);
    // 비즈니스 로직
    setState(() => isLoading = false);
  }
}
```

#### ✅ 해결책: StatefulWidget은 UI 상태만, 비즈니스 상태는 ViewModel

```dart
class BookingScreen extends StatefulWidget {
  final BookingViewModel viewModel;
  
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final ScrollController _scrollController = ScrollController(); // UI 상태만
  
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        return ListView(
          controller: _scrollController,
          children: widget.viewModel.bookings.map(...).toList(),
        );
      },
    );
  }
}
```

### 8.5 과도한 추상화

#### ❌ 안티패턴: 단순한 것을 복잡하게

```dart
// 단순한 getter를 Use Case로
class GetUserNameUseCase {
  final UserRepository repository;
  
  Future<Result<String>> execute() async {
    final result = await repository.getUser();
    return result.map((user) => user.name);
  }
}

// ViewModel에서
class ProfileViewModel {
  late Command0<String> getUserName;
  
  ProfileViewModel({required GetUserNameUseCase useCase}) {
    getUserName = Command0(() => useCase.execute());
  }
}
```

#### ✅ 해결책: 적절한 수준의 추상화

```dart
class ProfileViewModel {
  final UserRepository _repository;
  User? _user;
  
  User? get user => _user;
  String get userName => _user?.name ?? '';
  
  Future<void> loadUser() async {
    final result = await _repository.getUser();
    if (result is Ok) {
      _user = result.value;
      notifyListeners();
    }
  }
}
```

### 8.6 Result 타입 무시

#### ❌ 안티패턴

```dart
Future<void> loadData() async {
  final result = await repository.getData();
  // Result 타입을 검사하지 않고 바로 사용
  _data = (result as Ok).value; // 런타임 에러 가능
  notifyListeners();
}
```

#### ✅ 해결책: 항상 Result 타입 검사

```dart
Future<void> loadData() async {
  final result = await repository.getData();
  
  switch (result) {
    case Ok<Data>():
      _data = result.value;
      _error = null;
    case Error<Data>():
      _error = result.error;
      _log.warning('Failed to load data', result.error);
  }
  
  notifyListeners();
}
```

### 8.7 Memory Leaks

#### ❌ 안티패턴: Listener 해제 안 함

```dart
class MyScreen extends StatefulWidget {
  final MyViewModel viewModel;
}

class _MyScreenState extends State<MyScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(_onUpdate);
    // dispose에서 제거 안 함
  }
  
  void _onUpdate() {
    setState(() {});
  }
}
```

#### ✅ 해결책: dispose에서 정리

```dart
class _MyScreenState extends State<MyScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(_onUpdate);
  }
  
  @override
  void dispose() {
    widget.viewModel.removeListener(_onUpdate);
    super.dispose();
  }
  
  void _onUpdate() {
    setState(() {});
  }
}
```

#### ✅ 더 나은 해결책: ListenableBuilder 사용

```dart
@override
Widget build(BuildContext context) {
  return ListenableBuilder(
    listenable: widget.viewModel,
    builder: (context, _) {
      // 자동으로 관리됨
      return Text(widget.viewModel.data);
    },
  );
}
```

---

## 결론

이 가이드라인은 Flutter 애플리케이션에서 Clean Architecture와 MVVM 패턴을 실용적으로 적용하는 방법을 제시합니다.

**핵심 원칙 요약**
1. **레이어 분리**: UI, Domain, Data를 명확히 구분
2. **의존성 규칙**: 외부에서 내부로만 의존
3. **테스트 가능성**: 모든 레이어를 독립적으로 테스트
4. **유연성**: 프로젝트 규모에 맞게 조정

**프로젝트 규모에 따른 선택**
- **소규모**: 단순화, 빠른 개발에 집중
- **중규모**: 표준 구조, 균형잡힌 접근
- **대규모**: 엄격한 규칙, 높은 확장성

**다음 단계**
1. 기존 프로젝트에 점진적으로 적용
2. 팀과 함께 규칙 정립
3. 프로젝트에 맞게 커스터마이징
4. 지속적인 개선과 리팩토링

이 가이드라인을 기반으로 확장 가능하고 유지보수하기 쉬운 Flutter 애플리케이션을 개발하시기 바랍니다.

---

**참고 자료**
- [Flutter Compass App (Official Sample)](https://github.com/flutter/samples/tree/main/compass_app)
- [Clean Architecture by Robert C. Martin](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Flutter Architecture Samples](https://github.com/brianegan/flutter_architecture_samples)
- [Provider Package Documentation](https://pub.dev/packages/provider)

