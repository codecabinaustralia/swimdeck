class CreateTemplateCustoms < ActiveRecord::Migration[5.2]
  def change
    create_table :template_customs do |t|
      t.string :header_1_img
      t.string :header_1_overlay_color
      t.string :header_1_subtxt
      t.string :header_1_primarytxt
      t.string :header_1_btntxt
      t.string :quotebar_1_subtxt
      t.string :quote_bar_primarytxt
      t.string :quote_bar_btntxt
      t.string :content_6col_leftimg1
      t.string :content_6col_leftimg2
      t.text :content_6col_righttxt
      t.string :content_6col_rightsubtxt
      t.string :content_6col_rightprimarytxt
      t.string :content_6col_rightimg1
      t.string :content_6col_rightimg2
      t.text :content_6col_lefttxt
      t.string :content_6col_leftsubtxt
      t.string :content_6col_leftprimarytxt
      t.string :quotebox_1_subtxt
      t.string :quotebox_1_primarytxt
      t.string :quotebox_1_btntxt
      t.string :services_1_primarytxt
      t.string :about_1_img1
      t.string :about_1_img2
      t.string :about_1_subtxt
      t.string :about_1_primarytxt
      t.text :about_1_txt

      t.timestamps
    end
  end
end
