JobCategory.create name: "Coding"
JobCategory.create name: "Marketing"
JobCategory.create name: "Copywriting"
JobCategory.create name: "Executive"
JobCategory.create name: "Design"

if Rails.env.development?
  Admin.create!(email: 'admin-1@example.com', password: 'admin-1@example.com',
                password_confirmation: 'admin-1@example.com')

  pwd1 = 'employer-1@example.com'
  Employer.create(name: "Employer 1", email: pwd1,
                  password: pwd1, password_confirmation: pwd1).tap do |e1|
    e1.job_posts.create(title: "Mid Level Web Developer Needed for Immediate Placement",
                         summary: "Lorem amet a pariatur possimus incidunt porro corrupti! Nulla minima eius qui unde nisi. Inventore eum odit porro impedit odit rem nostrum. Molestias at ducimus at repudiandae nesciunt nam quidem.",
                         description: "# this is a header\n***bold***\nLorem amet a pariatur possimus incidunt porro corrupti! Nulla minima eius qui unde nisi. Inventore eum odit porro impedit odit rem nostrum. Molestias at ducimus at repudiandae nesciunt nam quidem.",
                         compensation: "100k/yr",
                         job_category: JobCategory.first,
                         apply: "Do a search for I totally rock and look for my listing, click it, stamp your right foot three times, makes a wish, kiss a unicorn, take a hit, and call me baby!")



  end

  pwd2 = 'employer-2@example.com'
  Employer.create(name: "Asshat Factory", email: pwd2,
                  password: pwd2, password_confirmation: pwd2).tap do |e2|
    e2.job_posts.create(title: "Play games all day - laugh at in-house clowns, dink every monday!",
                         summary: "Lorem amet a pariatur possimus incidunt porro corrupti! Nulla minima eius qui unde nisi. Inventore eum odit porro impedit odit rem nostrum. Molestias at ducimus at repudiandae nesciunt nam quidem.",
                         description: "# this is a header\n***bold***\nLorem amet a pariatur possimus incidunt porro corrupti! Nulla minima eius qui unde nisi. Inventore eum odit porro impedit odit rem nostrum. Molestias at ducimus at repudiandae nesciunt nam quidem.",
                         compensation: "20k/yr",
                         job_category: JobCategory.first,
                         apply: "And now for something totally different: apply here: https://yeah.youfellforit.com",
                         featured: true)
  end
end

