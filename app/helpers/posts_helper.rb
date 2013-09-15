module PostsHelper
  def post_type_for_form_object(object)
    if object
      object.post_type
    else
      1
    end
  end
end
