import 'package:dio/dio.dart';
import 'package:flutter_t/src/features/domain/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_repository.g.dart';

@riverpod
Future<List<Product>> fetchProducts(Ref ref) async {
  final dio = Dio();
  final response = await dio.get('https://fakestoreapi.com/products');
  final List<dynamic> data = response.data;

  return data.map((json) => Product.fromJson(json)).toList();
}
