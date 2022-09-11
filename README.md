# Course 3 MyCounter

第三课作业

## Motoko代码

```Motoko
/* increment_counter.mo */
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
```

## 样例演示

IC部署完成后，点击显示链接进入网页

![](./images/1.jpg)

打开另一个页面，进入currentValue的操作Candid UI

![](./images/2.jpg)

调用自增方法increment()后刷新显示页面，发现currentValue变为1

![](./images/3.jpg)

![](./images/4.jpg)

调用设置数字方法set()，传入参数520后刷新页面，发现currentValue变为520

![](./images/5.jpg)

![](./images/6.jpg)
