import 'dart:math';

import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/collection/sort_functions.dart';

void main() {
  ///람다의 표현 설명

  //(int 파라미터 1, String 파라미터2) => 반환값

  int add( int a, int b){
    return a+b;
  }
  final add2 = (int a, int b)=> a+b;    // 가능하기는 하나 이렇게 하는것을 지양해야함.
  int add3(int a, int b) => a+b;        // dart는 이러한 방식으로 진행하기를 추천
  ///람다의 특징 설명
  ///
  /// 1. 익명 : 이름을 지을 수 없다(변수에 담을 수 있음)
    //final add2 = add3(int a, int b)=> a+b;

  /// 2. 함수 : class에 종속되지 않음
    final animal = Animal(30, 'abc');
    // final addFunction = animal.add2;
    // print(addFunction(3, 5));
    // print(animal.add3(4,6));
    animal.eat();
    print(animal.toString());

  /// 3. 전달 : 1급 객ㅊ페로서 함수 파라미터로 전달,변수에 저장 가능
    run(add2,1,3);
    //함수를 전달해서 적용한다는 건데 그닥 잘 모르겠다.
  /// 4. 간결성 : 익명 클래스처럼 많은 코드를 구현한 필요가 없다.
    // 리컨을 한줄로 해야하지만 => 할 수록 코드 정렬이 쉽고 보기 편함.

  /// List Sort 예제
    final list2 = [5,7,10,53,82,13,46,36];
    list2.sort();   //기본 오름차순
    print(list2);
    list2.sort((a,b) => a==b? 0 : a<b ? 1 : -1);   //기본 내림차순
    print(list2);

    final aniList =[Animal(5,'abc'),Animal(6,'a4bc'),Animal(3,'afgbc'),Animal(8,'ad332'),Animal(4,'1153c')];
    aniList.sort(byIntField((el) => el.age,reverse: true));
    print(aniList);
    aniList.sort(byStringField((el) => el.name));
    print(aniList);

    final bcde = (a) => (b) => a+b;
    final bcde2 = bcde(2);
    print('bcde 2 는 :');
    print(bcde2(3));
    print('bcde 원래 값은...');
    print(bcde(2)(3));


}

class Animal{
  int age;
  final String name;
  //final add2 = (int a, int b) => a+b; // 하지말라라며...
  //int add3(int a, int b) => a+b; // 하지말라라며...

  Animal(this.age, this.name) ;

  void eat(){
    age++;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Animal: age = $age, name + $name";
  }

}

void run(int Function(int a, int b) add2, int a, int b){
  final sum = add2(a,b);
  print('출력 합니다. $sum');

}