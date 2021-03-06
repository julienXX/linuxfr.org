Factory.define :news do |f|
  f.state 'published'
  f.title "New release of J2EE"
  f.wiki_body "Not much to say about it"
  f.second_part "Nothing here"
  f.association :moderator
  f.association :section
  f.author_name "Pierre Tramo"
  f.author_email "pierre.tramo@dlfp.org"
  f.after_create do |n|
    n.node.public = true
    n.node.created_at = DateTime.now
    n.node.save
  end
end
