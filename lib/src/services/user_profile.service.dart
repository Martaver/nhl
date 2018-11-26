import 'package:angular/core.dart';

import 'package:firebase/firebase.dart' as fb;

@Injectable()
class UserProfileService {

  String get currentUserId => fb.auth().currentUser.uid;

  // Use this service to save options, configurations etc for user.
}