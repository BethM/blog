class PermittedParams < Struct.new(:params, :user)
  def article
    params.require(:article).permit(*article_attributes)
  end

  def article_attributes
    if user && user.admin?
      [:title, :body, :author, :sticky]
    else
      [:title, :body, :author]
    end
  end
end