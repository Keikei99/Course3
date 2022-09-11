import Text "mo:base/Text";
import Nat "mo:base/Nat";

// Create a simple Counter actor.
actor Counter {
  var currentValue : Nat = 0;

  // Increment the counter with the increment function.
  public func increment() : async () {
    currentValue += 1;
  };

  // Read the counter value with a get function.
  public query func get() : async Nat {
    currentValue
  };

  // Write an arbitrary value with a set function.
  public func set(n: Nat) : async () {
    currentValue := n;
  };

  type HeaderField = (Text, Text);

  type HttpRequest = {
    url : Text;
    method : Text;
    body : Blob;
    headers : [HeaderField];
  };

  type HttpResponse = {
    body : Blob;
    headers : [HeaderField];
    status_code : Nat16;
  };

  public query func http_request(args: HttpRequest): async HttpResponse {
    {
      body = Text.encodeUtf8("<html><body><h1>currentValue: " # Nat.toText(currentValue) # "</html></body></h1>");
      headers = [];
      status_code = 200;
    }
  }
}
