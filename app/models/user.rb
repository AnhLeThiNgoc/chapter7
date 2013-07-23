class User < ActiveRecord::Base
	# downcase cac thuoc tinh cua emailtruoc khi luu vao databse
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: { maximum: 50 }
	# dinh dang email theo dung chuan
	#VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	# dinh dang khong co dang vd nhua anh@gmail...com -> nhieu dau .
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	# validates :email, presence: true, format: { with: VALID_EMAIL_REGEX}, uniqueness: true #email la duy nhat, nhuoc diem la khong phan biet duoc chua hoa voi chu thuong
	# phan biet chu hoa
	# validates :email, presence: true, format: { with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false}
	validates :email, presence: true,
						format: { with: VALID_EMAIL_REGEX },
						uniqueness: { case_sensitive: false }
	# lay het cac mat khau hien tai de qua va no con nhieu hon the
	has_secure_password

	# xac nhan chieu dai cho mat khau
	validates :password, length: { minimum: 6 }
end
