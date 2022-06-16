require 'rails_helper'

RSpec.describe Doctor, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "validate phone_no" do
    let!(:doctor) { build(:random_doctor) }
    # p doctor

    it 'check phone format' do
      doctor.phone_no = "39 24 92"
      expect(doctor.save).to eq(false)
    end

    it 'check phone format2' do
      doctor.phone_no = "392492342342333334"
      expect(doctor.save).to eq(false)
    end

    it 'phone_no should start with "+"' do
      doctor.phone_no[0] = "0"
      expect(doctor.save).to eq(false)
    end

    it 'should successfully save an object' do
      expect(doctor.save).to eq(true)
    end
  end
end
