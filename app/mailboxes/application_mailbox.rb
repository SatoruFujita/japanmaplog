class ApplicationMailbox < ActionMailbox::Base
  # route /something/i => :somewhere
  routing /^save@/i     => :forwards
  routing /@replies\./i => :replies
ends
