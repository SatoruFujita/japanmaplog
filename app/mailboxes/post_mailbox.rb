class PostsMailbox < ApplicationMailbox
  before_processing :ensure_sender_is_a_user

  def process
    User.find_by(email: mail.from).posts.create!(post_attrs)
  end


  private
    def ensure_sender_is_a_user
      unless User.exist?(email: mail.from)
        bounce_with UserMailer.missing_forward(inbound_email)
      end
    end

    private
    def post_attrs
      {
        title: mail.subject || Time.current.to_s,
        body: EmailParser.parse(mail.source)
        #添付ファイルもココに書く
        
      }
    end

end
