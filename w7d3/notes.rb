# Basic Setup: Database, RSpec, and Test Files
#   Set up a test database if necessary
      "rails db:create" # to create development and test databases
      "rails db:test:load" # to sync test DB after migrations
#   Install RSpec using rails generate rspec:Install
      .rspec, spec/, spec_helper.rb, rails_helper.rb
#   add configs to .rspec
#     --require spec_helper
#     --color
#     --format_documentation
#   Auto-Generate Test Files
#   change the config/application.rb file to use rspec

#Basic Setup: Configurations
 # In application.rb:
    config.generators do |g|
      g.test_framework :rspec,
        :fixtures => false,
        :view_specs => false,
        :helper_specs => false,
        :routing_specs => false,
        :controller_specs => true,
        :request_specs => false
      g.fixture_replacement :factory_bot, :dir => "spec/factories"

  # rails_helper.rb
    Shoulda:Matchers.configure do |config|
      config.integrate do |with|
        with.test_framework :rspec
        with.library :rails
      end
    end

#Create rspec file and spec ddirectory: "be rails g spec:install"
  #creates 
    .rspec
    spec/ directory
    spec/spec_helper.rb
    spec/rails_helper.rb

# In .rspec
#   add
#     --require spec_helper 
#     --color
#     --format documentation

# In application.rb:
    config.generators do |g|
      g.test_framework :rspec,
        :fixtures => false,
        :view_specs => false,
        :helper_specs => false,
        :routing_specs => false,
        :controller_specs => true,
        :request_specs => false
        g.fixture_replacement :factory_bot, :dir => "spec/factories"
      end
    end

# In rails_helper.rb
  # Add "Shoulda Matcher" configuration
    Shoulda:Matchers.configure do |config|
      config.integrate do |with|
        with.test_framework :rspec
        with.library :rails
      end
    end

# Unit Testing: Models
  # Small in scope
  #   Test only touch model code
  #   Tests can touch the database
  # Things to test
  #   Validations/error messages
  #   Associations
  #   Class AND instance methods (not private)

# Shoulda Matchers Syntax
  # Validations
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }

  # Associations
    it { should have_many(:chirps) }
    it { should belong_to(:user) }

# "rails g rspec:model user" in terminal
  # creates spec/models/user_spec.rb
  # creates spec/factories/users.rb

# user_spec.rb
    require 'rails_helper'

    RSpec.describe User, type: model do
      describe "validations" do
        # it "validates the presence of a username" do
          # incomplete_user = { User.new(username: "", age: 99, email: "a@a.com", password: "123456") }
          # expect(incomplete_user).to_not be_valid

        # end
        subject(:toby) { User.create(username: "toby", age: 2, email: "toby@toby.com", password: "123456") }

        it { should validate_presence_of(:username) }
        it { should validate_presence_of(:email) }
        it { should validate_presence_of(:session_token) }
        it { should validate_presence_of(:age) }
        it { should validate_presence_of(:password_digest) }
        it { should validate_length_of(:password).is_at_least(6) }
        # Shoulda Matchers know under the hood that we want to reference a User object and automatically creates the subject to use for the 'Expect'
        it { should validate_uniqueness_of(:username) }
      end

      describe "associations" do
        it { should have_many(:chirps) }
        it { should have_many(:likes) }
        it { should have_many(:liked_chirps) }
      end
    end

# Run the below RSpec command to test
 "be rspec ./spec/models/user_spec.rb"

# How to use the FactoryBot and Faker gems
# In ./spec/factories/users.rb
FactoryBot.define do
  factory :user do
    username { Faker::Movies::HarryPotter.character }
    age { 20 }
    email { Faker::Internet.email }
    password { "password" }

    factory :harry_potter do # creates a harry_potter subfactory, which will automatically use "Harry Potter" as the username instead of choosing something random
      username { "Harry Potter" }
    end
  end
end

# Now we write a test for our User FactoryBot in user_spec.rb
describe "#password?" do
  let(:user { FactoryBot.build(:user) })

  context "with a valid password" do
    it "should return true" do
      expect(user.password?("password")).to be true
    end
  end

  context "with an invalid password" do
    it "should return false" do
      expect(user.password?("banana")).to be false
    end
  end

end

#The below test checks to make sure it is using BCrypt to encrypt the password and that it doesn't save the real password to the database
describe "password encryption" do
  it "does not save password to the database" do
    FactoryBot.create(:harry_potter)
    
    user = User.find_by(username: "Harry Potter")

    expect(user.password).not_to eq("starwars") # password should not be in our table at all so it should return nil and then gets compared to some random string so it should equal false
  end

  it "encrypts password using BCrypt" do
    expect(BCrypt::Password).to receive(:create).with("abcdef")

    FactoryBot.build(:user, password: "abcdef") # We use FactoryBot.build instead of .create here because we don't need to be saving the user to the database
  end
end

# Rails Controller Testing API
#   Request Methods
#   get
  #   post
  #   patch
  #   delete
  # Assertions
  #   render_template
  #   redirect_to
  #   have_http_status, be_success

# Request Syntax
#   (http request) :(controller action), (params)
get :new
post :create, params { user: { username: "harry_potter" } } # structure is just like strong params

"rails g rspec:controller users" # Creates spec/controllers/users_controller_spec.rb

# users_controller_spec.rb
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "Get #new" do
    it "renders the new user template" do
      get :new

      expect(response).to render_template(:new) # :new template must already exist for this to work
    end
  end

  describe "POST #create" do
    let(:valid_params) { { user: { username: "snape", age: 33, email: "snape@snape.com", password: "lily124" } } }
    let(:invalid_params) { { user: { username: "dudley", age: 99, email: "dudley@dudley.com", password: "" } } }
    let(:user) { User.find_by(username: "snape") }
    
    context "with valid params" do
      before :each do
        post :create, params: valid_params 
      end
      
      it "creates the user" do
        expect(User.last.username).to eq("snape")
      end
      
      it "logs in the user" do
        expect(session[:session_token]).to eq(user.session_token)
      end
      
      it "redirects to user show page" do
        expect(response).to redirect_to(user_url(user))
      end
    end

    context "with invalid params" do
      before :each do
        post :create, params: invalid_params
      end

      it "renders the new template" do
        expect(response).to render_template(:new)
      end

      it "adds errors to flash" do
        expect(flash[:errors]).to be_present # checks to make sure we have the errors key in our flash method
      end
    end
  end
end

# SLIDES
# End-to-End Testing: Features
#   Simulates how a real user would interact with app
#   Test in a "headless" browser (no actual UI)
#   Capybara can open a real browser for debugging
#   (save_and_open_page)

# Capybara API
#   Navigation
#   visit
#   click_on
# Forms
#   fill_in "field, with: "value
#   choose, check, uncheck
#   select "option, from: "select box"
# Assertions
#   have_content
#   current_path
#   page
# Debugging
#   save_and_open_page
# AND MUCH MORE!

# Capybara - RSpec Conventions
#   Capybara changes the names of some of RSpec's standard methods to reflect its specific testing purpose
#     #describe => feature
#     #it => #scenario
#     #before => background
#     #let => #given

# CAPYBARA DEMO
# manually create a folder in /spec named "features", and in that create a new ruby file named "auth_spec.rb"
# auth_spec.rb
require 'rails_helper'

feature "signing up", type: :feature do
  background :each do # this is the "before_each" equivalent
    visit new_user_url
  end

  scenario "has a user sign up page" do
    expect(page).to have_content("Sign Up") # Looks for the text "Sign Up" anywhere on the page, substring matches are valid
  end

  scenario "take a username, password, and age" do
    save_and_open_page # This method comes from the Launchy gem

    expect(page).to have_content("Username")
    expect(page).to have_content("Age")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
  end

  scenario "redirects to user show page and displays username on suuccess" do
    fill_in "Username", with: "dobby"
    fill_in "Age", with: 12
    fill_in "Email", with: "dobby@dobby.com"
    fill_in "Password", with: "password"

    # save_and_open_page
    click_button "Create User"

    expect(page).to have_content("dobby")

    user = User.find_by(username: "dobby")
    expect(current_path).to eq(user_path(user)) #/users/:id
  end

  scenario "re-renders sign up page with invalid user information" do
    fill_in "Username", with: "dobby"
    fill_in "Age", with: 12
    fill_in "Email", with: "dobby@dobby.com"
    click_button "Create User"

    expect(page).to have_content("Password is too short (minimum is 6 characters")
  end

end











    