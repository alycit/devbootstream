class AddFullTextSearch < ActiveRecord::Migration
  def up
    execute "
      create index post_body_index on posts using gin(to_tsvector('english', body));
      create index post_title_index on posts using gin(to_tsvector('english', title));"
  end

  def down
    execute "
      drop index post_body_index;
      drop index post_title_index;"    
  end
end
