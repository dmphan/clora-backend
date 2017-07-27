namespace :consultants do
  desc "Seed the Consultant data from json file"
  task :seed, [:file] => :environment do |t, args|
    File.foreach(args[:file]) do |line|
      json = JSON.parse(line)
      
      uid = json["unique_id"]
      
      next if Consultant.exists?(uid: uid)     
      consultant = Consultant.new(uid: uid)
      
      given_name = json["given_name"]
      family_name = json["family_name"]
      summary = json["summary"] || nil
      skills = json["skills"] || nil
      experience = json["experience"] || nil
      linkedin_uri = json["url"] || nil
      locality = json["locality"] || nil
      if locality
        locality.slice! "Greater"
        locality.slice! "Area"
        locality.strip!
        consultant.city = locality
        consultant.state = "MA" if locality == "Boston"      
      end


      consultant.uid = uid
      consultant.given_name = given_name
      consultant.family_name = family_name
      consultant.summary = summary
      consultant.skills = skills
      consultant.experience = experience
      consultant.linkedin_uri = linkedin_uri
      consultant.save!
    end
  end

end
