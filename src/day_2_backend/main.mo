import Char "mo:base/Char";
import Text "mo:base/Text";
import Array "mo:base/Array";
import Nat8 "mo:base/Nat8";
import Nat "mo:base/Nat";

actor {
  //challenge 1
  public func nat_to_nat8(n : Nat) : async Nat8 {
    if(n > 255) {
      return 0;
    } else {
      return Nat8.fromNat(n);
    };
  };

  //challenge 2
  public func max_number_with_n_bits(n : Nat) : async Nat {
    return(2 ** n - 1);
  };

  //challenge 3
  public func decimal_to_bits(n : Nat) : async Text {
    var in_bits = 0;
    var na = n;
    var m = 1;
      while(na > 0) {
        let r = na % 2;
        in_bits += r * m;
        na /= 2;
        m *= 10;
      };
    return Nat.toText(in_bits);
  };

  //challenge 4
  public func capitalize_character(c : Char) : async Char {
    let u = Char.toNat32(c);
    return(Char.fromNat32(u - 32));
  };

  //challenge 5
  func _capitalize_character(c : Char) : Char {
    let u = Char.toNat32(c);
    return(Char.fromNat32(u - 32));
  };

  public func capitalize_text(t : Text) : async Text {
    var ta : Text = "";
    for(char in t.chars()) {
        ta #= Char.toText(_capitalize_character(char));
    };
    return ta;
  };

  //challenge 6
  public func is_inside(t: Text, c: Char) : async Bool {
    let p = #text(Char.toText(c));
    return Text.contains(t, p);
  };

  //challenge 7
  public func trim_whitespace(t: Text) : async Text {
    let p = #char(' ');
    return Text.trim(t, p);
  };

  //challenge 8
  public func duplicate_character(t : Text) : async Text {
        var a : [Char] = [];
        for (c in t.chars()){
          a := Array.append<Char>(a, [c]);
        };
       
        for (c in t.chars()){
           
            var newC : [Char] = Array.filter<Char>(a, func (x: Char) : Bool {x == c});
            if (newC.size() > 1) {
              return Char.toText(c);
            };
           
        };
        return (t);
    };

  //challenge 9
  public func size_in_bytes(t: Text) : async Nat {
    let utf : Blob = Text.encodeUtf8(t);
    return utf.size();
  };

  //challenge 10
  public func sort(arr : [Nat]) : async [Nat] {
    let thaw_arr : [var Nat] = Array.thaw<Nat>(arr);
    return Array.sort(arr, Nat.compare);
  };

};
