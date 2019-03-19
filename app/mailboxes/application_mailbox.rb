class ApplicationMailbox < ActionMailbox::Base
  # route /something/i => :somewhere
  routing "post@example.com"   => :posts
  routing /\Areply-[0-9a-f]+\z/i => :comments
ends
