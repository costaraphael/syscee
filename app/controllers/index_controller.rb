class IndexController < ApplicationController
  require 'net/http'
  require 'openssl'

  def index
  end

  def login
    render 'login', layout: false
  end

  def logar
    login = login_params

    cgu = login[:cgu]
    senha = login[:senha]
    url = "https://memphis.ulbranet.com.br/aamovel/login?i_cgu=#{cgu}&i_senha=#{senha}"

    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, 443)
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http.use_ssl = true
    http.ssl_version = :SSLv3
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request).body

    if response[1..4] == 'ERRO'
      redirect_to login_path, notice: 'Dados de login incorretos.'
    else
      usuario = Usuario.where("cgu = #{login[:cgu]}").take
      cookies[:login] = {value: usuario.id, expires: Time.now + 900}
      redirect_to root_path
    end
  end

  def logout
    cookies.delete :login
    redirect_to login_path
  end

  private
  def login_params
    params.require(:login).permit(:cgu, :senha)
  end
end
