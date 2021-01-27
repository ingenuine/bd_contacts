class AuthorizeRequest
  CERT_PATH = Rails.root.join("lib/certs")

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  private

  def token
    raw_token = @headers['Authorization']
    raw_token.split(' ').last if raw_token
  end

  def decoded_token
    return unless token
    begin
      JWT.decode(
        token,
        rsa_public,
        true,
        { exp_leeway: leeway, algorithm: 'RS256' }
      )
    rescue JWT::DecodeError
      nil
    rescue JWT::ExpiredSignature
      nil
    end
  end

  def user
    if decoded_token
      # email = decoded_token[0]['sub']['email']
      # @user = User.find_by(email: email)
      true
    end
  end

  def rsa_public
    OpenSSL::PKey.read(File.read(File.join(CERT_PATH, 'rsa-public.pem')))
  end

  def leeway
    ENV.fetch('LEEWAY', 3000000).to_i
  end
end
