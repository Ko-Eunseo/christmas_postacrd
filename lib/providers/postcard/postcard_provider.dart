import 'package:christmas_postcard/providers/postcard/postcard_state.dart';
import 'package:state_notifier/state_notifier.dart';

class PostcardProvider extends StateNotifier<PostcardState> with LocatorMixin {
  PostcardProvider() : super(PostcardState.init());
}
