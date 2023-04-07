abstract class AuthRepository {
  Future emailRegister(String email, String password);
  Future googleRegister();
  Future logout();
}
