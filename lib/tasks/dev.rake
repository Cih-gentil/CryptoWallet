namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando Banco de dados") {%x(rails db:drop)}
          
      show_spinner("Criando Banco de dados") {%x(rails db:create)}
        
      show_spinner("Migrando Banco de dados") {%x(rails db:migrate)}
      
      %x(rails dev:add_coins)

       
    else 
    puts "Você não está no ambiente de deselvolvimento!"
    end
  end

  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas") do
  coins = [
    {discription: "Bitcoin",
    acronym: "BTC",
    url_image: "https://images.rawpixel.com/image_png_600/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTAyL3JtNDY3LWNyeXB0b2N1cnJlbmN5LTAxMy5wbmc.png"
    },
    {discription: "Etherum",
    acronym: "ETH",
    url_image: "https://upload.wikimedia.org/wikipedia/commons/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png"
    },
    {discription: "Dash",
    acronym: "DASH",
    url_image: "https://cryptologos.cc/logos/dash-dash-logo.png?v=026"
    }
    ] 

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
       end
   end
  end

=begin
  desc "Cadastro de tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando minerações") do 
    mining_types = [
      {description: "Proof of Work", acronym: "POW"},
      {description: "Proof of Stake", acronym: "POS"},
      {description: "Proof of Capacity", acronym: "POC"}
    ]
    mining_types.each do |mining_type|
      MiningType.find_or_create_by!(mining_type)
    end
=end
  


    def show_spinner(msg_start, msg_end = "Concluído!")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})") 
    end
end
