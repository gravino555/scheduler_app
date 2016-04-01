require 'rails_helper'

RSpec.feature "User sign out" do
    
    before do
          @john = Student.create!(first_name: "John",
            last_name: "doe",
            student_id: 11111133,
            department: "Computer Science",
            email: "john@concordia.ca",
            password: "password",
            password_confirmation: "password")
    end
    
    scenario "with valid credentials" do
        visit "/"
        click_link "Sign In"
        fill_in "Email", with: "john@concordia.ca"
        fill_in "Password", with: "password"
        click_button "Sign In"
        
        visit "/"
        expect(page).to have_content("Signed in as John")
        
        click_link "Sign Out"
        expect(page).to have_content("Sign In")
    end
    
    scenario "with invalid credentials" do
        visit "/"
        click_link "Sign In"
        fill_in "Email", with: "john@concordia.ca"
        fill_in "Password", with: "potato123"
        click_button "Sign In"
        
       expect(page).not_to have_content("Signed in as John")
    end
end

