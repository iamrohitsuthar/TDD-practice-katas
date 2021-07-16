import 'package:string_calculator/negative_number_exception.dart';
import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  test(
    'Given an empty string, when an add operation is performed, then 0 is returned',
    () {
      final stringCalculator = StringCalculator();
      expect(stringCalculator.add(''), 0);
    },
  );

  test(
    'Given a one number string, when an add operation is performed, then that number is returned',
    () {
      final stringCalculator = StringCalculator();
      expect(stringCalculator.add('1'), 1);
      expect(stringCalculator.add('8'), 8);
    },
  );

  test(
    'Given a two numbers string, when an add operation is performed, then sum of that two numbers is returned',
    () {
      final stringCalculator = StringCalculator();
      expect(stringCalculator.add('1,2'), 3);
    },
  );

  test(
    'Given a mutliple numbers string, when an add operation is performed, then sum of that numbers is returned',
    () {
      final stringCalculator = StringCalculator();
      expect(stringCalculator.add('1,2,3,4,5,6,7,8,9,10'), 55);
    },
  );

  test(
    'Given a numbers string with \n or , as a seperator, when an add operation is performed, then sum of that numbers is returned',
    () {
      final stringCalculator = StringCalculator();
      expect(stringCalculator.add('1\n2,3'), 6);
      expect(stringCalculator.add('1\n2'), 3);
    },
  );

  test(
    'Given a numbers string with custom separator of length one char, when an add operation is performed, then sum of that numbers is returned',
    () {
      final stringCalculator = StringCalculator();
      expect(stringCalculator.add('//;\n1;2'), 3);
    },
  );

  test(
    'Given a numbers string without custom separator line i.e with ; as default separator, when an add operation is performed, then sum of that numbers is returned',
    () {
      final stringCalculator = StringCalculator();
      expect(stringCalculator.add('1;2'), 3);
    },
  );

  test(
    'Given a numbers string with single negative number, when an add operation is performed, then exception is throwned',
    () {
      try {
        final stringCalculator = StringCalculator();
        stringCalculator.add('-1,2');
      } on NegativeNumberException catch (exception) {
        expect(exception.message, 'negatives not allowed -1');
      }
    },
  );

  test(
    'Given a numbers string with multiple negative numbers, when an add operation is performed, then exception is throwned',
    () {
      try {
        final stringCalculator = StringCalculator();
        stringCalculator.add('-1,2\n3,-4');
      } on NegativeNumberException catch (exception) {
        expect(exception.message, 'negatives not allowed -1 -4');
      }
    },
  );

  test(
    'Given a numbers string having some numbers greater than 1000, when an add operation is performed, then only the sum of numbers which are less than or equal to 1000 is returned',
    () {
      final stringCalculator = StringCalculator();
      expect(stringCalculator.add('//,\n5,1005'), 5);
      expect(stringCalculator.add('//,\n1,1000,22'), 1023);
    },
  );

  test(
    'Given a numbers string with custom separator of length more than one char, when an add operation is performed, then sum of that numbers is returned',
    () {
      final stringCalculator = StringCalculator();
      expect(stringCalculator.add('//[***]\n1***22***3'), 26);
      expect(stringCalculator.add('//[,,,]\n1,,,2,,,3'), 6);
    },
  );

  test(
    'Given a numbers string with multiple custom separators of length one char, when an add operation is performed, then sum of that numbers is returned',
    () {
      final stringCalculator = StringCalculator();
      expect(stringCalculator.add('//[*][%]\n1*2%3'), 6);
    },
  );

  test(
    'Given a numbers string with multiple custom separators of length more than one char, when an add operation is performed, then sum of that numbers is returned',
    () {
      final stringCalculator = StringCalculator();
      expect(stringCalculator.add('//[***][###][!!!]\n1###2***3!!!44'), 50);
    },
  );
}
