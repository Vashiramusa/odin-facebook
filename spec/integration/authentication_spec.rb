require 'rails_helper'

RSpec.feature 'Authentications', type: :feature do
  scenario 'Log in and log out' do
    User.create!(first_name: 'User', last_name: 'Name', email: 'example@example.com', password: 'password',
                 password_confirmation: 'password')
    visit new_user_session_path
    have_link 'Log in', href: new_user_session_path
    have_link 'Sign up', href: new_user_registration_path
    have_link 'Sign in with Facebook', href: user_facebook_omniauth_authorize_path
    page.fill_in 'Email', with: 'example@example.com'
    page.fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page.current_path).to eq root_path
    have_link 'Users', href: users_path
    have_link 'Log out', href: destroy_user_session_path
    have_link 'Profile', href: user_path
    click_on 'Log out'
    expect(page.current_path).to eq root_path
  end
end
