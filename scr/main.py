import pandas as pd
import openpyxl

def read_data(dir, file):
    """
    Lê o arquivo xlsx e retorna um dataframe

    Args: 
        dir: diretorio dos arquivos
        file: nome do arquivo xlsx
    
    Returns:
        dataframe
    """
    df = pd.read_excel(f"{dir}/{file}.xlsx", na_values = '-')
    return df

def melt_data(df):
    """
    Faz a transformação da estrutura da tabela

    Args: 
        df: dataframe que será estruturado

    Returns:
        dataframe limpo
    """

    df_melted = df.melt(
        id_vars = 'Ano',
        var_name = 'mes_nome',
        value_name = 'taxa'
    )

    map_mes = {
    'Jan': 1, 'Fev': 2, 'Mar': 3, 'Abr': 4, 'Mai': 5, 'Jun': 6, 'Jul': 7, 'Ago': 8, 'Set': 9, 'Out': 10, 'Nov': 11, 'Dez': 12
    }

    df_melted['mes_num'] = df_melted['mes_nome'].map(map_mes)
    df_taxas = df_melted[['Ano', 'mes_nome', 'mes_num', 'taxa']]
    df_taxas['taxa'] = df_taxas['taxa'].astype(float)

    return df_taxas

def main():
    dir = "data/raw"
    selic = "serie_historica_selic"
    ipca = "serie_historica_ipca"
    
    df_selic = read_data(dir, selic)
    df_selic = melt_data(df_selic)
    df_selic.to_csv("data/processed/selic_historico.csv", index = False)

    df_ipca = read_data(dir, ipca)
    df_ipca = melt_data(df_ipca)
    df_ipca.to_csv("data/processed/ipca_historico.csv", index = False)
    print("Dados salvos em data/processed")

if __name__ == "__main__":
    main()