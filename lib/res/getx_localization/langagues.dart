import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_label': 'Email',
          'email_hint': 'Enter your email',
          'email_validation': 'Empty or invalid email',
          'password_label': 'Password',
          'password_hint': 'Enter your password',
          'password_validation': 'Incorrect password',
          'internet_exception': 'Not internet network.',
          'retry': 'Reload',
          'general_exception': 'We\'re unable to process your request \n Please try again.',
          'welcome': 'Welcome',
          'login': 'Login',
          'error': 'Error',
          'login_success': 'Login successfully',
          'login_error': 'Login error',
          'logout': 'Logout successfully',
          'logout_success': 'Logout',
          'user_list_error': 'Error to fetch data',
          'back_to_home': 'Back to home',
        },
        'fr_FR': {
          'email_label': 'Email',
          'email_hint': 'Entrez votre email',
          'email_validation': 'Email incorrect',
          'password_label': 'Mot de passe',
          'password_hint': 'Entrez votre mot de passe',
          'password_validation': 'Mot de passe incorrect',
          'internet_exception': 'Pas de connexion internet.',
          'retry': 'Actualiser',
          'general_exception': 'Nous ne sommes pas en mesure de traiter votre demande.\n Veuillez réessayer',
          'welcome': 'Bienvenue',
          'login': 'Connexion',
          'error': 'Erreur',
          'login_success': 'Connexion réussie',
          'login_error': 'Erreur de connexion',
          'logout': 'Déconnexion',
          'logout_success': 'Déconnexion réussie',
          'user_list_error': 'Erreur lors du chargement des données',
          'back_to_home': 'Retour à l\'accueil',
        }
      };
}
