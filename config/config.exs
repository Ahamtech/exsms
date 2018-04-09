# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :exsms, :sendinblue, url: "https://api.sendinblue.com/v3/transactionalSMS/sms", type: :post

config :exsms, :mailjet, url: "https://api.mailjet.com/v4/sms-send", type: :post

config :exsms, :textlocal, url: "https://api.textlocal.in/send/", type: :post
