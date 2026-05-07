## =============================================================
##  SETUP DO PORTFÓLIO QUARTO — GUIA PASSO A PASSO
##  Inspirado em: https://brunomesquitaa.github.io/
## =============================================================
##
##  ESTRUTURA DE ARQUIVOS GERADA:
##
##  portfolio/
##  ├── _quarto.yml               ← configuração global (navbar, tema, rodapé)
##  ├── custom.scss               ← estilos customizados (cores, fontes, cards)
##  ├── index.qmd                 ← Home (hero section)
##  ├── about.qmd                 ← Sobre (abas: experiência, skills, educação)
##  ├── images/
##  │   ├── profile.jpg           ← SUA FOTO (coloque aqui)
##  │   └── favicon.png           ← ícone da aba do navegador
##  ├── portfolio/
##  │   ├── index.qmd             ← Listagem automática do portfólio (listing)
##  │   └── posts/
##  │       ├── 01_churn_xgboost.qmd
##  │       └── 02_dashboard_shiny.qmd
##  └── artigos/
##      ├── index.qmd             ← Listagem automática de artigos (listing)
##      └── posts/
##          └── 01_llm_limpeza_dados.qmd
##
## =============================================================

# ── 1. INSTALAR QUARTO (se ainda não tiver) ──────────────────
# Baixe em: https://quarto.org/docs/get-started/
# Verifique a instalação:
system("quarto --version")

# ── 2. INSTALAR PACOTES R NECESSÁRIOS ───────────────────────
pacotes <- c("quarto", "rmarkdown", "knitr",
             "tidyverse", "ggplot2", "plotly",
             "scales", "lubridate")

instalar_se_necessario <- function(p) {
  if (!requireNamespace(p, quietly = TRUE)) install.packages(p)
}

invisible(sapply(pacotes, instalar_se_necessario))

# ── 3. PERSONALIZAR OS ARQUIVOS ─────────────────────────────
# Abra os arquivos abaixo e substitua pelos seus dados:
#
#  _quarto.yml  → title, favicon, links de navbar, GitHub/LinkedIn/YouTube
#  index.qmd    → foto, nome, descrição, links dos botões
#  about.qmd    → experiência, habilidades, educação, hobbies
#  custom.scss  → cores ($primary), fontes (Google Fonts import)
#
# Para trocar a paleta de cores, edite em custom.scss:
#   $primary:   #2563eb;   ← azul padrão – escolha sua cor principal
#   $secondary: #64748b;   ← cinza para textos secundários

# ── 4. ADICIONAR SUA FOTO ────────────────────────────────────
# Coloque sua foto em:  portfolio/images/profile.jpg
# (pode ser .jpg, .png ou .webp — ajuste o caminho nos .qmd)
#
# Tamanho recomendado: 400×400 px, quadrada ou circular

# ── 5. CRIAR NOVOS PROJETOS / ARTIGOS ───────────────────────
# Duplique um dos arquivos em portfolio/posts/ ou artigos/posts/
# e edite o YAML no topo:
#
# ---
# title: "Título do Projeto"
# description: "Descrição breve (aparece no card da listagem)"
# date: "2024-08-01"
# categories: [R, Shiny, Estatística]   ← tags de filtragem
# image: capa.png                        ← opcional: imagem do card
# ---

# ── 6. VISUALIZAR LOCALMENTE ────────────────────────────────
# No terminal, dentro da pasta portfolio/:
#   quarto preview
#
# Ou pelo RStudio: Build → Render Website
# Atalho: Ctrl+Shift+K (renderiza o arquivo atual)

quarto::quarto_preview(".")   # Equivalente ao comando acima no R

# ── 7. GERAR O SITE (build final) ────────────────────────────
quarto::quarto_render(".")    # Gera a pasta _site/

# ── 8. PUBLICAR NO GITHUB PAGES ─────────────────────────────
# Opção A – quarto publish (mais simples):
#   quarto publish gh-pages
#
# Opção B – manual:
#   1. git init && git add . && git commit -m "init portfolio"
#   2. git remote add origin https://github.com/SEU-USUARIO/SEU-USUARIO.github.io
#   3. git push -u origin main
#   4. No GitHub: Settings → Pages → Branch: main / folder: /docs
#      (mude output-dir para 'docs' no _quarto.yml se usar esta opção)
#
# Opção C – Netlify / Quarto Pub:
#   quarto publish netlify
#   quarto publish quarto-pub

# ── 9. ADICIONAR ÍCONES FONT AWESOME ─────────────────────────
# Os ícones {{< fa brands github >}} requerem a extensão:
#   quarto add quarto-ext/fontawesome
# Execute isso no terminal dentro da pasta do projeto.

# ── 10. DICAS EXTRAS ─────────────────────────────────────────
#
# • Modo escuro: já está ativado via theme: [flatly, custom.scss]
#   e [darkly, custom.scss] no _quarto.yml
#
# • Listing de portfólio: a página portfolio/index.qmd usa
#   "listing: contents: posts" — basta adicionar .qmd em posts/
#   e o card aparece automaticamente.
#
# • Categorias/filtros: defina "categories:" no YAML de cada post;
#   a sidebar de categorias é gerada automaticamente.
#
# • Reading time: o campo "reading-time: true" no listing mostra
#   tempo estimado de leitura em cada card.
#
# • Tabset (abas): use ::: {.panel-tabset} como em about.qmd
#   para criar seções com abas sem JavaScript extra.
#
# • Animações: definidas no custom.scss via @keyframes fadeUp;
#   os cards aparecem em cascata (animation-delay incremental).
