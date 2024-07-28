import Blob "mo:base/Blob";
import Nat8 "mo:base/Nat8";
import Text "mo:base/Text";

module {
    public func generateV4(seed : Blob) : Text {
        processbytes(seed)
    };

    private func processbytes(e : Blob) : Text {
        let bytes = Blob.toArrayMut(e);
        assert(bytes.size() >= 16);
        bytes[6] := (bytes[6] & 0x0F) | 0x40;
        bytes[8] := (bytes[8] & 0x3F) | 0x80;
        
        func byteToHex(byte : Nat8) : Text {
            let hexChars = ['0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'];
            let highNibble = byte >> 4;
            let lowNibble = byte & 0x0F;
            return Text.fromChar(hexChars[Nat8.toNat(highNibble)]) # Text.fromChar(hexChars[Nat8.toNat(lowNibble)]);
        };
        
        let uuid = byteToHex(bytes[0]) # byteToHex(bytes[1]) # byteToHex(bytes[2]) # byteToHex(bytes[3]) #
               "-" #
               byteToHex(bytes[4]) # byteToHex(bytes[5]) #
               "-" #
               byteToHex(bytes[6]) # byteToHex(bytes[7]) #
               "-" #
               byteToHex(bytes[8]) # byteToHex(bytes[9]) #
               "-" #
               byteToHex(bytes[10]) # byteToHex(bytes[11]) # byteToHex(bytes[12]) # byteToHex(bytes[13]) # byteToHex(bytes[14]) # byteToHex(bytes[15]);
        return uuid;
    };
}
