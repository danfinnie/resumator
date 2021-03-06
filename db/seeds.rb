Job.delete_all
Education.delete_all
Resume.delete_all

Job.create!(started_at: '05 Nov 2012', ended_at: '05 Jul 2013', title: "Full Stack Web Developer", place: "Noise New York", location: "New York, NY", description: <<-EOT)
  * Implement browser-based video chatting and appointment scheduling,
  interface with third-party POS system for promotion that increased same-store
  sales by 25% over stores without promotion.
  * Grow video library microsite to maintainable platform designed to easily
  support limited-time campaigns.
EOT

Job.create!(started_at: '05 Aug 2012', ended_at: '05 Nov 2013', title: "Backend Developer", place: "Plum Analytics (contract)", location: "Bethlehem, PA", description: <<-EOT)
  * Harvest and crawl 20+ web APIs (REST, data dumps, and screen scraping) in a
  reliable and scalable manner. Merge similar records across data streams and
  transform data to fit internal schemas and classifications.
EOT

Job.create!(started_at: '05 Jan 2010', ended_at: '05 Dec 2012', title: "Web Developer", place: "University's International Multimedia Resource Center", location: "Bethlehem, PA", description: <<-EOT)
  * Determine needs of web development clients, estimate cost and time to
  completion, delegate work amongst staff.
  * Create web sites for University departments from scratch and using the
  Drupal content management system.
  * Integrate sites with University systems to access user and course data
  using LDAP and custom integrations.
EOT

Education.create!(obtained_at: '05 Dec 2012', place: 'Lehigh University', location: 'Bethlehem, PA', gpa: '3.7', title: 'Joint B.S. in Computer Science & Business', description: <<-EOT)
List of the Deans

Lehigh Liner
EOT

Resume.create!(
  name: "My First Resume",
  last_name: "Radcliffe",
  first_name: "Chelsea",
  phone: "514-345-5544",
  personal_website: "chelsearadcliffe.com",
  email: "chelsea@gmail.com",
  experiences: Experience.all
)

