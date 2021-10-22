class Contact < ApplicationRecord
  def phone_number_format
    return "(#{phone_number[0]}#{phone_number[1]}#{phone_number[2]})#{phone_number[3]}#{phone_number[4]}#{phone_number[5]}-#{phone_number[6]}#{phone_number[7]}#{phone_number[8]}#{phone_number[9]}"
  end

  # def address_to_coordinates
  #   return address.first_coordinates
  # end
end
