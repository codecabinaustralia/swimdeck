class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :StuSurname
      t.string :StuGivenNames
      t.string :StudId
      t.string :LessonDay
      t.string :LessonTime
      t.string :LessonLevel
      t.string :Area
      t.string :TeachSurname
      t.string :TeachGivenNames
      t.string :StuBookStartDate
      t.string :RPSurname
      t.string :RPGivenNames
      t.string :RPId
      t.string :RPAddress
      t.string :RPSuburb
      t.string :RPPostCode
      t.string :RPHomePhone
      t.string :RPWorkPhone
      t.string :RPPhone
      t.string :RPEmail
      t.string :RPBookingBalance
      t.string :RPBookingFee
      t.string :FamilyPaymentType
      t.string :SpecialDiscount
      t.string :RP
      t.string :StuGender
      t.string :StuDateOfBirth
      t.string :StuAge

      t.timestamps
    end
  end
end
