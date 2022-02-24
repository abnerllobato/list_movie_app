import 'package:dio/dio.dart';
import 'package:movie_app/service/dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/4/', headers: {
        'content-type': 'application/json;charset=utf-8',
        'authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZmNjZGJkMzQ4NTNlOTRjODg0Njk0MGFkZTAyOTg1YyIsInN1YiI6IjYyMGU4NmExYTBiNjkwMDA2OTcyNmQ1MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.00Q_0Ih06sBS1uNTFkT2JpVP-A42tgyjSRk_9Whncjc'
      }),
    );
  }
}
