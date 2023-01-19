import Int "mo:base/Int";
import Text "mo:base/Text";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";
import Array "mo:base/Array";
import Buffer "mo:base/Buffer";


actor {
    public query func average_array(array: [Int]) : async Int {
        var average: Int = 0;
        var sum: Int = 0;
        for (element in array.vals()) {
            sum += element;
        };
        average := sum / array.size();
        return average;
    };

    public query func count_character(t: Text, c: Char) : async Nat {
        var occurrences: Nat = 0;
        label letters for (character in Text.toIter(t)) {
            if (character == c) {
                occurrences += 1;
            };
            continue letters;
        };
        return occurrences;
    };

    public query func factorial(n: Nat) : async Nat {
        var factorial = 1;
        if (n==0) {
            return 1;
        } else {
            for (i in Iter.range(1, n)) {
                factorial := factorial * i;
            };
            return factorial;
        };
    };

    public query func number_of_words(t: Text) : async Nat {
        var count: Nat = 1;
        for (character in Text.toIter(t)) {
            if (character == ' ') {
                count += 1;
            };
        };
        return count + 1;
    };

    public query func find_duplicates(a: [Nat]) : async [Nat] {
        var duplicate_buffer = Buffer.Buffer<Nat>(1);
        for (i in Iter.range(0, a.size() - 1)) {
            for (j in Iter.range(i+1, a.size() - 1)) {
                if (a[i] == a[j]) {
                    duplicate_buffer.add(a[i])
                };
            };
        };
        return Buffer.toArray<Nat>(duplicate_buffer);
    };

    public query func convert_to_binary(n : Nat) : async Text {
        var number : Nat = n;
        var binary: Nat = 0;
        var one : Nat = 1;
        while (number > 0) {
            var rem: Nat = number % 2;
            binary += rem * one;
            number /= 2;
            one *= 10;
        };
        return Nat.toText(binary);
    };

}