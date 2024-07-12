import '../../domain/entities/credentials_entity.dart';

class CredentialsModel extends CredentialsEntity {
  CredentialsModel({
    required String email,
    required String password,
  }) : super(
          email: email,
          password: password,
        );
}
