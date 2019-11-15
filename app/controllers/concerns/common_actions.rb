module CommonActions
  #以下extendは必須
   extend ActiveSupport::Concern
 
   def set_parents
    @parents = Category.where(ancestry: nil)
  end
 
 end