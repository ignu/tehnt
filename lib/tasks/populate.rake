
task :populate => :environment do 
  require 'active_record/fixtures'
  Fixtures.create_fixtures( 'spec/fixtures', %w(campsites reservations campgrounds) )
end