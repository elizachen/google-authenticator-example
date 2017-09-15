class User < ActiveRecord::Base
  acts_as_google_authenticated lookup_token: :salt, drift: 30, issuer: 'eliza''s ROR Lab'
  before_save {|record| record.salt = SecureRandom.hex unless record.salt }
  after_create {|record| record.set_google_secret }
end
