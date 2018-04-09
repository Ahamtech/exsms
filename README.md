# Exsms

"Exsms: A Elixir library for sending transactional SMS - supoprts Sendinblue, mailjet and textlocal"

## Supported Services

* textlocal (India)
* Sendinblue
* Mailjet

MR is always Supported

## Installation
```elixir
def deps do
  [
    {:exsms, "~> 0.1.0"}
  ]
end
```

### Usage

```
config :exsms, :sendinblue, api: "xkeysib"

config :exsms, :mailjet, api: "123"

config :exsms, :textlocal, api: "123"
```

```elixir

```


## License
Exsms is Copyright © Ahamtech. It is free software, and may be redistributed under the terms specified in the LICENSE file.

## About Ahamtech

![img](https://sos-ch-dk-2.exo.io/aham-web/company/ahamtech.png)

> Exsms is maintained by Ahamtech.

We love open source software, Erlang, Elixir, and Phoenix. See our other opensource projects, or hire our Elixir Phoenix development team to design, develop, and grow your product.
