class CreatePonies < ActiveRecord::Migration
  def change
    create_table :ponies do |t|
      t.string :title #rails g model ponny title:string 이라고 배시창에 치면 뜸
#수정한 후에는 반드시 rake db:migrate
      t.timestamps null: false
    end
  end
end
