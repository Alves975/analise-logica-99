from conexao import carregar_corridas

df = carregar_corridas()

taxa_conclusao = (df['status_entrega'].eq('concluida').mean()) * 100
print("Taxa de conclusão:", round(taxa_conclusao, 2), "%")

# calcula: (corridas concluídas / total) × 100