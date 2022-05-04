Given("there are grades in the gradebook") do
    @teacher = create(:user)
    @bad_user = create(:user, account_id: 2)
    @eric = create(:grade, :valid)
    @tomai = create(:grade, :valid)
    @schweller = create(:grade, :valid)
    @wylie = create(:grade, :valid)
end

Given("I sign in") do
    visit new_user_session_path
    fill_in "user_email", with: @teacher.email
    fill_in "user_password", with: "123greetings"
    click_on "Log in"
end

Given("I sign in bad_user") do
    visit new_user_session_path
    fill_in "user_email", with: @bad_user.email
    fill_in "user_password", with: "123greetings"
    click_on "Log in"
end

When("I visit the homepage") do
    visit root_path
end

Then ("I click on a user's name") do
    click_on @eric.student_name
end

When("I click {string}") do |string|
    click_on string
end

When("I fill out the form and submit") do
    fill_in "grade_student_id", with: "123456"
    fill_in "grade_student_name", with: "Bob Dylan"
    fill_in "grade_student_grade", with: 80
    click_on "Create Grade"
end

Then("I should have added a grade") do
    expect(page).to have_content("Grade was successfully created.")
end

Then("that post should be deleted") do
    expect(page).to have_content("Grade was successfully destroyed.")
end

Then("I should see everyone's grades") do
    @grades = Grade.all
    @grades.each do |g|
        expect(page.body).to include(g.student_id)
    end
end


Then("I should see that user's detailed grade information") do
    expect(page).to have_content(@eric.student_id)
    expect(page).to have_content(@eric.student_name)
    expect(page).to have_content(@eric.student_grade)
end

When("I click {string} on a post") do |string|
    click_on string, :match => :first
end

##adding teacher definition###########################################
Given("I am a Teacher") do
  @teacher.account_id == 1
end

Given("I am an unauthorized POSTer") do
    @bad_user.account_id != 1 or @bad_user.account_id != 0
end

Given("I am an unauthorized PATCHer") do
    @bad_user.account_id != 1 or @bad_user.account_id != 0
end

Given("I am an unauthorized DELETEr") do
    @bad_user.account_id != 1
end

Then("that post should NOT be deleted") do
    expect(page).to have_content("User is not authorized.")
end

Then("I should NOT have added a grade") do
    expect(page).to have_content("User is not authorized.")
end

When("I edit the name and submit") do
    fill_in "grade_student_grade", with: 25.0
    click_on "Update Grade"
end

Then("I should have updated the grade") do
    expect(page).to have_content("Grade was successfully updated.")
end

Then("I should NOT have updated the grade") do
    expect(page).to have_content("User is not authorized.")
end

    ######################################################################
Given("I am a user") do
    @user = create(:user)
  end
  
  When("I go to sign in page") do
    visit 'users/sign_in'
  end
  
  Then("I should not be able to see the {string} button") do |string|
    expect(page).not_to have_content(string)
  end
  Then("I should see grades sorted least to greatest") do
    @grades = Grade.all.order("student_grade").reverse
  end
  
  Then("I should see grades sorted greatest to least") do
    @grades = Grade.all.order("student_grade")
  end

