// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
const baseUrl = "https://desafio-mobile.nyc3.digitaloceanspaces.com/movies";
const serverError = "Não foi obtida resposta do servidor!";
final dioOptions = BaseOptions(
  baseUrl: baseUrl,
  connectTimeout: 5000,
  receiveTimeout: 3000,
  contentType: 'application/json;charset=utf-8'
);