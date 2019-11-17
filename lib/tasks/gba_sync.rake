namespace :gba_sync do
  desc "Call Google Books Api and Syncronize"
  task execute: :environment do
    Book::GbaSyncronizer.execute(Book.where(is_sync_gba: false))
  end
end
