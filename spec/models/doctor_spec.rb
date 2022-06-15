require 'rails_helper'

RSpec.describe Doctor, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "with phone_no starting with not '+'" do
    it 'cannot save a phone_no' do
      doctor = Doctor.new(first_name: "Ali", last_name: "Burgaz", phone_no: "05028547770549")
      # expect(3).to eq 3

      expect { doctor.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
