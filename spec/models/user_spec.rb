require 'spec_helper'

describe User do
 # pending "add some examples to (or delete) #{__FILE__}"
 before do
 	@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar") 
 	#@user = User.new(name: "anh", email: " ") 
 end
 subject { @user}
# respond: dap ung
 it { should respond_to(:name) }
 it { should respond_to(:email) }
 # ma hoa password
 it { should respond_to(:password_digest) }

 it { should respond_to(:password)}
# xac nhan password
it { should respond_to(:password_confirmation)}
# xac thuc nguoi dung
it { should respond_to(:authenticate)}
# kiem tra su ton tai cua cac bienß
 it { should be_valid }

 describe " when name is not present " do
 	before { @user.name = " "}
 	it { should_not be_valid }
 end

 it "should respond to 'name'" do
 	expect(@user).to respond_to(:name)
 end

 describe "when email is not present " do
 	before { @user.email = " "}
 	it { should_not be_valid }
 end

describe " when name is too long " do
	before { @user.name = "a"*51 }
	it { should_not be_valid }
end

# spec o tren chi de ktra name va email khong trong
# cac yeu cau cua email se ngat hon nhu sau

 describe "when email format is invalid " do
 	it "should be invalid" do
 		addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid_address|
        	@user.email = invalid_address
        	expect(@user).not_to be_valid
        end
 	end
 end

 describe " when email format is valid " do
 	it "should be valid " do
 		addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
 		addresses.each do |valid_address|
 			@user.email = valid_address
 			expect(@user).to be_valid
 		end
 	end
 end
# Émail xac dinh duy nhat nhung chua phan biet duoc chu hoa voi chu thuong
 describe " when email address is already taken " do
 	before do
 		user_with_same_email = @user.dup # tao email giong voi @user
 		user_with_same_email.save # luu lai
 	end
 	it { should_not be_valid} # email de su dung roi khong nen ton tai
 end
# email phan biet chu hoa voi chu thuong
 describe " when email address is already taken " do
 	before do
 		user_with_same_email = @user.dup
 		user_with_same_email.email = @user.email.upcase # bien email chu thuong sang chu hoa
 		user_with_same_email.save
 	end
 	it { should_not be_valid }
 end
 # khong nhap password null
 describe "when password is not present " do
 	before do
 		@user = User.new(name: "Example User", email: "user@example.com", password: " ", password_confirmation: " ")
 	end
 	it { should_not be_valid}
 end
 # khi password khac cofirmation - xac nhan
 describe " when password doesn't match confirmation " do
 	before { @user.password_confirmation = "mismatch"}
 	it { should_not be_valid }
 end
 # User authentication : xac thuc nguoi dung

# thong tin password co do dai > 5
 describe "with a password that's too short " do
	before { @user.password = @user.password_confirmation = "a"*5 }
	it { should be_valid}
 end
# thong tin password trung voi user
 describe " return value of authentication method " do
	before {@user.save}
	let(:found_user) { User.find_by(email: @user.email) }
	describe " with valid password " do
		it { should eq found_user.authenticate(@user.password)}
	end

	describe " with invalid password" do
		let(:user_for_invalid_password) { found_user.authenticate("invalid")}
		it { should_not eq user_for_invalid_password }
		specify { expect(user_for_invalid_password).to be_false}
	end
 end
 # A test for the email downcasing : 
 describe "email address with mixed case - dia chi email voi truong hop hon don" do
 	let(:mixed_case_email) {"Foo@ExAMPle.CoM" }
 	it " should be saved as lower-case " do
 		@user.email = mixed_case_email
 		@user.save
 		expect(@user.reload.email).to eq mixed_case_email.dowmcase
 	end
 end
end






























