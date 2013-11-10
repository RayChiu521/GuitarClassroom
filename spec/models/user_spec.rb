require "spec_helper"

describe User do
  describe "Authentication" do

  	let!(:user) { build_user(account: "Test Authentication") }
  	let!(:duplicate_user) { build_user(account: "Test Authentication") }
		subject { user }
		subject { duplicate_user }

		it "success" do
			expect { user.save }.to change { User.count }.by(1)
		end

		it "raise error when password is empty" do
			user.password = ""
			expect { user.save! }.to raise_error
		end

		it "raise error when password_confirmation is empty" do
			user.password_confirmation = ""
			expect { user.save! }.to raise_error
		end

		it "raise error when password is not equal to password_confirmation" do
			user.password = user.password_confirmation + "a"
			expect { user.save! }.to raise_error
		end

		it "raise error when account is empty" do
			user.account = ""
			expect { user.save! }.to raise_error
		end

		it "raise error when account duplicate" do
			user.save
			expect { duplicate_user.save! }.to raise_error
		end
	end
end