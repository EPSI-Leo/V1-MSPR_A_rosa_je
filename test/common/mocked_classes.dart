import 'package:arosa_je/core/local/session_manager/session_manager.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements Client {}

class MockResponse extends Mock implements Response {}

class MockSessionManager extends Mock implements SessionManager {}
