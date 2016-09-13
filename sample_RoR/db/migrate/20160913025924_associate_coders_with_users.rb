class AssociateCodersWithUsers < ActiveRecord::Migration
  def change
    add_reference :coders, :user, index: true
  end
end
