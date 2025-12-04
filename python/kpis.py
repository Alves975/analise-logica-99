from conexao import carregar_corridas

df = carregar_corridas()

total = len(df)
concluidas = len(df[df["status_entrega"] == "concluida"])
taxa = concluidas / total * 100

print("Total de corridas:", total)
print("Concluídas:", concluidas)
print("Taxa de conclusão:", round(taxa, 2), "%")

# Carregacorridas do banco
# Conta todas as corridas
# Conta_concluídas
# Calcula a taxa percentual
# Imprime tudo no console