import Char "mo:base/Char";
import Text "mo:base/Text";
import Array "mo:base/Array";
import Nat8 "mo:base/Nat8";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import Option "mo:base/Option";

actor {

  //challenge 1
  public func swap(arr : [Nat], j : Nat, i : Nat) : async [Nat] {
    let jv = arr[j];
    let iv = arr[i];
    let var_arr : [var Nat] = Array.thaw<Nat>(arr);
    var_arr[j] := iv;
    var_arr[i] := jv; 
    return Array.freeze<Nat>(var_arr);
  };

  //challenge 2
  public query func init_count(n : Nat) : async [Nat] {
    let arr : [var Nat] = Array.init<Nat>(n, 0);
    for(i in Iter.range(1, n - 1)){
      arr[i] := i;
    };
    return Array.freeze(arr);
  };

  //challenge 3
  public query func seven(n : [Nat]) : async Text {
    let p = #text(Nat.toText(7));
    var string : Text = "";
    for (v in n.vals()) {
      let t : Text = Nat.toText(v);
      string := string # t;
    };
    if(Text.contains(string, p)) {
      return "seven found 😁 veri happy";
    } else {
      return "seven not found 😭 veri sad";
    };
  };

  //challenge 4
  public query func nat_opt_to_nat(n : ?Nat , m : Nat) : async Nat {
    switch(n) {
      case (null) {
        return m;
      };
      case (?value) {
        return value;
      };
    };
  };

  //challenge 5
  public query func day_of_the_week(n : Nat) : async ?Text { 
    switch(n){
      case(1) return ?"Monday";
      case(2) return ?"Thursday";
      case(3) return ?"Wednesday";
      case(4) return ?"Tuesday";
      case(5) return ?"Friday";
      case(6) return ?"Saturday";
      case(7) return ?"Sunday";
      case(_) return null;
    };
  };

  //challenge 6
  public query func populate_array(arr : [?Nat]) : async [Nat] { 
    return Array.map<?Nat, Nat>(arr, func (x) {
      switch(x) {
        case (null) return 0;
        case (?value) return value;
      };
    });
  };

  //challenge 7
  public query func sum_of_array(arr : [Nat]) : async Nat { 
    return Array.foldLeft<Nat, Nat>(arr, 0, func (sumAfter, x) {
      sumAfter + x;
    });
  };

  //challenge 8
  public query func squared_array(arr: [Nat]) : async [Nat] {
    return Array.map<Nat, Nat>(arr, func (x) { x * x});
  };

  //challenge 9
  public query func increase_by_index(arr: [Nat]) : async [Nat] {
    return Array.mapEntries<Nat, Nat>(arr, func (i, x) { 
      x + i;
    });
  };

  //challenge 10
  private func contains<A>(arr : [A], a : A, f: (A,A) -> Bool): Bool {
    Option.isSome(Array.find<A>(arr, func(x) { f(x, a) }))
  };

};
