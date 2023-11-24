module ApplicationHelper
    def data_br(data_usa)
        data_usa.strftime("%d/%m/%Y")
    end

    def nome_aplicacao
        "CRYPTO WALLET APP"
    end
end
