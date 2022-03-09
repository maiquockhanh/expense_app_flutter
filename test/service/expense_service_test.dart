import 'package:flutter_application_1/constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'expense_service_test.mocks.dart';
import 'package:flutter_application_1/service/login/expense_service.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetchExpenses', () {
    test('returns an Expense List if the http call completes successfully', () async {
      final client = MockClient();

      const String mockResponse = 
        '''
          [
            {
              "id": 10,
              "date": "2022-03-09",
              "merchant": "mesh",
              "amount": 61122,
              "status": "APROVED",
              "paymentMethod": "Cash",
              "category": {
                "id": 2,
                "name": "open-source"
              }
            },
            {
              "id": 6,
              "date": "2022-03-08",
              "merchant": "microchip",
              "amount": 95338,
              "status": "WAITING_FOR_APPROVAL",
              "paymentMethod": "Cash",
              "category": {
                "id": 1,
                "name": "Table"
              }
            }
          ]
        '''
      ;

      when(
        client.get(
          Uri.parse(
            '$baseUrl/api/expenses'
          ),
          headers: anyNamed('headers')
        )
      )
      .thenAnswer((_) async =>
          http.Response(mockResponse, 200));

      expect(await ExpenseService().getAll("",client), isA<List<Expense>>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(
        client.get(
          Uri.parse('$baseUrl/api/expenses'),
          headers: anyNamed('headers')
        )
      )
      .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(ExpenseService().getAll("",client), throwsException);
    });
  });
}
