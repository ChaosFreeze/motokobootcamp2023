import Nat "mo:base/Nat";

actor {
    public query func multiply(n: Nat, m: Nat) : async Nat {
        return n*m;
    };

    public query func volume(n : Nat) : async Nat {
        return n*n*n;
    };

    public query func hours_to_minutes(n : Nat) : async Nat {
        return n * 60;
    };

    var counter: Nat = 0;

    public func set_counter(n: Nat) : async () {
        counter:= n;
    };

    public query func get_counter() : async Nat {
        return counter;
    };

    public query func test_divide(n: Nat, m : Nat) : async Bool {
        if (n % m == 0) {
            return true;
        };
        return false;
    };

    public query func is_even(n: Nat) : async Bool {
        if (n % 2 == 0) {
            return true;
        };
        return false;
    };
};