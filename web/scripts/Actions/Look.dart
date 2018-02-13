import '../Item.dart';
import "Action.dart";
import "../random.dart";
import "../weighted_lists.dart";
class Look extends Action {

    static List<String> ALTS = <String>["LOOK","OBSERVE","EXAMINE","SEE","EYEBALL","OOGLE","OGLE","LEER","PONDER","CONTEMPLATE","REGARD","VIEW"];

    static bool isCommand(String word) {
        //print("is $word another word for LOOK?");
        return ALTS.contains(word.toUpperCase().trim());
    }

    Look():super("Look",ALTS);



  static String performAction(String itemName) {
      print("going to look at $itemName");
    Item item = Action.findItemFromString(itemName);
    if(item != null) {
        print("item found, it's $item");
        Look l = item.findActionWithSameClassAs(new Look());
        if(l != null) return l.apply(item);
        return "...This is probably a bug but you find yourself unable to even LOOK at the ${item.name}";
    }else {
        Random rand = new Random();
        return rand.pickFrom(Action.cantFidnItemSnark(itemName));
    }
  }
  @override
  String apply(Item item, [String itemName]) {
      return "You LOOK at the ${item.name}. ${item.description}";
  }
}