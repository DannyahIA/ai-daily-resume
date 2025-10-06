# Daily Maker with AI 🤖📊

Uma aplicação desktop inteligente que monitora sua atividade, analisa o contexto com IA e gera relatórios diários estruturados.

![Version](https://img.shields.io/badge/version-3.5-blue)
![Python](https://img.shields.io/badge/python-3.8+-green)
![License](https://img.shields.io/badge/license-MIT-orange)

## 🌟 Funcionalidades

- **Monitoramento Automático**: Captura screenshots a cada 5 minutos
- **Análise com IA**: Usa Google Gemini para analisar e descrever atividades
- **Relatórios Estruturados**: Gera summaries matutinos e vespertinos
- **Banner Sempre Visível**: Indicador de status com feedback visual a cada captura
- **Interface Intuitiva**: GUI com abas para fácil navegação
- **Configuração Flexível**: Personalize horários, idiomas e modelos de IA
- **Segurança**: Opção de mostrar/ocultar API key
- **Templates Personalizáveis**: Defina seu próprio formato de relatório

## 📋 Requisitos

- Python 3.8 ou superior
- Google Gemini API Key ([obtenha aqui](https://ai.google.dev/))
- Sistema operacional: Linux ou Windows

## 🚀 Instalação

### Opção 1: Usar Executável Pré-compilado (Recomendado)

1. Baixe o executável para seu sistema:
   - **Linux**: `DailyMaker` (sem extensão)
   - **Windows**: `DailyMaker.exe`

2. Execute o arquivo
   - **Linux**: `./DailyMaker`
   - **Windows**: Clique duas vezes em `DailyMaker.exe`

### Opção 2: Executar a partir do Código Fonte

```bash
# Clone o repositório
git clone https://github.com/DannyahIA/ai-daily-resume.git
cd ai-daily-resume

# Instale as dependências
pip install -r requirements.txt

# Execute a aplicação
python daily_maker_gui.py
```

## 🔨 Build do Zero

Se você deseja compilar a aplicação você mesmo:

### Linux
```bash
chmod +x build_linux.sh
./build_linux.sh
```

### Windows
```bash
# No CMD ou PowerShell
build_windows.bat

# Ou no Git Bash
chmod +x build_windows.sh
./build_windows.sh
```

Para mais detalhes, consulte [BUILD_INSTRUCTIONS.md](BUILD_INSTRUCTIONS.md)

## ⚙️ Configuração

1. **Obtenha sua API Key do Gemini**
   - Acesse [Google AI Studio](https://ai.google.dev/)
   - Crie uma API key gratuita

2. **Configure a Aplicação**
   - Vá para a aba "Settings"
   - Preencha seu nome
   - Cole sua API Key
   - Ajuste os horários dos relatórios (formato HH:MM)
   - Escolha o idioma dos summaries
   - (Opcional) Personalize os modelos de IA
   - Clique em "Save Settings"

3. **Inicie o Monitoramento**
   - Clique em "Start Monitoring"
   - O banner de status aparecerá
   - A cada 5 minutos, uma captura será feita (banner pisca em verde)

## 📊 Como Funciona

1. **Captura**: A cada 5 minutos, a aplicação captura uma screenshot
2. **Análise**: O Google Gemini analisa a imagem e identifica a atividade
3. **Registro**: A atividade é registrada com timestamp nos logs
4. **Summaries**: Nos horários configurados, gera relatórios:
   - **Matutino**: Resume atividades da manhã
   - **Vespertino**: Resume atividades da tarde e compila o dia todo
5. **Edição**: Você pode editar o relatório final antes de enviá-lo

## 🎨 Interface

### Aba "Daily Summary"
Exibe o relatório gerado pela IA. Você pode editar o texto antes de copiar/enviar.

### Aba "AI Logs"
Mostra em tempo real as atividades identificadas pela IA.

### Aba "Settings"
Configurações completas:
- Nome do usuário
- API Key (com botão mostrar/ocultar)
- Horários dos relatórios
- Idioma (Português/English)
- Modelos de IA personalizáveis
- Template do relatório
- Controles de monitoramento

## 🔒 Privacidade e Segurança

- ✅ Todas as capturas são processadas localmente
- ✅ Imagens são enviadas apenas para a API do Google Gemini
- ✅ Nenhum dado é armazenado em servidores externos
- ✅ Você controla quando o monitoramento está ativo
- ✅ API Key armazenada localmente em `config.json`
- ⚠️ Mantenha seu arquivo `config.json` seguro

## 🛠️ Solução de Problemas

### "API ERROR" nos logs
- Verifique se sua API Key está correta
- Confirme que você tem créditos disponíveis no Google AI
- Verifique sua conexão com a internet

### Banner não aparece
- Clique no botão "Show Banner"
- Verifique se o monitoramento está ativo

### Relatórios não são gerados
- Confirme se os horários estão no formato HH:MM (24h)
- Aguarde o horário configurado
- Verifique se há atividades registradas nos logs

### Executável não inicia (Linux)
```bash
chmod +x DailyMaker
./DailyMaker
```

### Antivírus bloqueia (Windows)
- Adicione exceção para o executável
- O arquivo é seguro (código-fonte disponível)

## 🔄 Modelos de IA Suportados

### Para Análise de Imagens (Vision Model):
- `gemini-1.5-flash-latest` (padrão, rápido)
- `gemini-1.5-pro-latest` (mais preciso)
- `gemini-pro-vision`

### Para Geração de Texto (Text Model):
- `gemini-1.5-flash-latest` (padrão, rápido)
- `gemini-1.5-pro-latest` (mais elaborado)
- `gemini-pro`

## 📝 Template Personalizado

O template suporta as seguintes variáveis:
- `[USER_NAME]`: Seu nome
- `[DATE]`: Data atual
- `[MORNING_UPDATES]`: Resumo matutino
- `[AFTERNOON_UPDATES]`: Resumo vespertino

Exemplo:
```markdown
# Daily Summary – [USER_NAME] – [DATE]
## Morning Updates:
[MORNING_UPDATES]

## Afternoon Updates:
[AFTERNOON_UPDATES]
```

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para:
- Reportar bugs
- Sugerir novas funcionalidades
- Enviar pull requests

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

## 👨‍💻 Autor

**Tavares**
- GitHub: [@DannyahIA](https://github.com/DannyahIA)

## 🙏 Agradecimentos

- Google Gemini API por fornecer capacidades de IA
- Comunidade Python por bibliotecas incríveis

---

**Versão atual**: 3.5  
**Última atualização**: Outubro 2025

⭐ Se este projeto foi útil, considere dar uma estrela no GitHub!
