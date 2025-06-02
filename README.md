# Rhilo Investimentos - Website

![Rhilo Logo](/assets/images/logo.svg)

## Sobre o Projeto

Rhilo Investimentos é um fundo de investimentos especializado em ativos judiciais, oferecendo soluções inovadoras para investidores que buscam diversificação e rentabilidade, além de soluções para advogados e seus clientes que desejam antecipar o recebimento de seus ativos judiciais.

Este repositório contém o código-fonte do site institucional da Rhilo Investimentos, construído com Jekyll - um gerador de sites estáticos.

## 📋 Índice

- [Visão Geral](#visão-geral)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Requisitos](#requisitos)
- [Instalação e Configuração](#instalação-e-configuração)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Personalização e Desenvolvimento](#personalização-e-desenvolvimento)
- [Sistema de Blog](#sistema-de-blog)
- [Implantação](#implantação)
- [Funcionalidades Implementadas](#funcionalidades-implementadas)
- [Licença](#licença)

## 🔍 Visão Geral

O site da Rhilo Investimentos foi desenvolvido com foco em:

1. **Apresentação do Fundo de Investimentos**: Destaque para os produtos de investimento em ativos judiciais, com informações sobre rentabilidade, risco e vantagens.

2. **Educação sobre Ativos Judiciais**: Explicação sobre o que são ativos judiciais e como funciona o mercado de investimentos nesse segmento.

3. **Antecipação de Créditos**: Informações direcionadas a advogados e seus clientes sobre como antecipar o recebimento de ativos judiciais.

4. **Blog Especializado**: Artigos sobre investimentos, ativos judiciais e o mercado financeiro-jurídico.

5. **Geração de Leads**: Captação de contatos tanto de investidores interessados no fundo quanto de advogados/clientes com créditos judiciais.

## 🛠️ Tecnologias Utilizadas

- **Jekyll**: Gerador de sites estáticos em Ruby
- **Bootstrap 5**: Framework CSS para desenvolvimento responsivo
- **Sass/SCSS**: Pré-processador CSS para estilização avançada
- **Font Awesome**: Biblioteca de ícones
- **Chart.js**: Biblioteca para gráficos e visualizações
- **Docker**: Containerização para desenvolvimento consistente
- **Vercel**: Plataforma de deploy e hospedagem

## 📋 Requisitos

Para desenvolvimento local:

- Ruby 3.0+
- RubyGems
- Bundler
- Jekyll
- Git

Para ambiente containerizado:
- Docker
- Docker Compose

## 🚀 Instalação e Configuração

### Usando Docker (Recomendado)

O projeto está configurado para ser executado em um ambiente containerizado com Docker, garantindo consistência entre diferentes ambientes de desenvolvimento.

1. **Clone o repositório**:
   ```bash
   git clone git@github.com:CalculoJuridico/rhilo-homepage.git
   cd rhilo-homepage
   ```

2. **Iniciar com o script de execução simples**:
   ```bash
   # Executa Jekyll em um container Docker com live reload
   ./start.sh
   ```

3. **Acesse o site**:
   O site estará disponível em http://localhost:4000

### Usando Docker Compose (Para desenvolvimento)

Para um ambiente de desenvolvimento mais completo, você pode usar o Docker Compose:

1. **Construir e iniciar os containers**:
   ```bash
   docker-compose up
   ```

2. **Executar em segundo plano**:
   ```bash
   docker-compose up -d
   ```

3. **Parar os containers**:
   ```bash
   docker-compose down
   ```

### Instalação Manual

Se preferir executar o projeto localmente sem Docker:

1. **Clone o repositório**:
   ```bash
   git clone git@github.com:CalculoJuridico/rhilo-homepage.git
   cd rhilo-homepage
   ```

2. **Instale as dependências**:
   ```bash
   bundle install
   ```

3. **Inicie o servidor de desenvolvimento**:
   ```bash
   bundle exec jekyll serve --livereload
   ```

4. **Acesse o site**:
   O site estará disponível em http://localhost:4000

## 📁 Estrutura do Projeto

O projeto segue a estrutura padrão do Jekyll com algumas personalizações:

```
rhilo-homepage/
├── _authors/            # Perfis de autores do blog
├── _data/               # Arquivos de dados em YAML (navegação, rodapé, etc.)
├── _includes/           # Componentes reutilizáveis HTML
│   ├── navigation.html  # Menu de navegação
│   ├── footer.html      # Rodapé do site
│   ├── hero.html        # Banner principal da página inicial
│   ├── investment-funds.html # Seção de fundos de investimento
│   ├── resources.html   # Seção de ativos judiciais
│   └── ...
├── _layouts/            # Templates de layout
│   ├── default.html     # Layout base
│   ├── home.html        # Layout da página inicial
│   ├── post.html        # Layout para posts do blog
│   ├── page.html        # Layout para páginas simples
│   └── ...
├── _posts/              # Artigos do blog
├── _sass/               # Arquivos de estilo SCSS
├── assets/              # Recursos estáticos
│   ├── css/             # Arquivos CSS compilados
│   ├── js/              # Scripts JavaScript
│   ├── images/          # Imagens do site
│   └── ...
├── docs/                # Documentação do projeto
│   └── articles/        # Conteúdo extraído de artigos relevantes
├── pages/               # Páginas principais do site
├── _config.yml          # Configuração principal do Jekyll
├── Gemfile              # Dependências Ruby
├── docker-compose.yml   # Configuração do Docker Compose
├── Dockerfile           # Configuração do Docker
├── fetch_articles.rb    # Script para extração de conteúdo
└── fetch_migalhas.sh    # Script para executar extração via Docker
```

## 🎨 Personalização e Desenvolvimento

### Navegação e Menu

O menu de navegação é controlado pelo arquivo `_data/navigation.yml`. Para adicionar, remover ou modificar itens do menu:

```yaml
# _data/navigation.yml
- name: Início
  link: /
- name: Fundos de Investimento
  link: /#investment
- name: Ativos Judiciais
  link: /#resources
# Adicione novos itens abaixo
```

### Rodapé

O rodapé é controlado pelo arquivo `_data/footer.yml`. Aqui você pode personalizar:

```yaml
# _data/footer.yml
copyright: "© 2025 Rhilo Investimentos LTDA. Todos os direitos reservados."
socials:
  - name: LinkedIn
    icon: fab fa-linkedin
    link: https://linkedin.com/
  # Adicione novas redes sociais aqui

links:
  - title: Investimentos
    items:
      - name: Fundos de Investimento
        link: /#investment
```

### Estilização

O projeto utiliza Sass/SCSS para estilização. O arquivo principal é `assets/css/main.css`.

Para modificar cores, fontes e outros aspectos visuais:

1. Edite as variáveis no início do arquivo:
   ```css
   :root {
     --primary-color: #4A6FFF;
     --secondary-color: #6C757D;
     --light-color: #F8F9FA;
     --dark-color: #212529;
     --accent-color: #10B981;
   }
   ```

2. Adicione novos estilos nas seções apropriadas ou crie novos arquivos CSS.

## 📝 Sistema de Blog

### Adicionar Novo Post

1. Crie um arquivo na pasta `_posts` seguindo o formato de nomenclatura: `YYYY-MM-DD-titulo-do-post.md`

2. Adicione o cabeçalho YAML no início do arquivo:
   ```yaml
   ---
   layout: post
   title: "Título do Post"
   author: nome-do-autor
   date: YYYY-MM-DD HH:MM:SS -0300
   categories: [Categoria1, Categoria2]
   tags: [tag1, tag2, tag3]
   image: /assets/images/posts/imagem.jpg
   description: "Breve descrição do post para SEO (150-160 caracteres)."
   ---

   Conteúdo do post em Markdown aqui...
   ```

3. Escreva o conteúdo do post utilizando a sintaxe Markdown.

### Adicionar Novo Autor

1. Crie um arquivo na pasta `_authors` com o nome do autor: `nome-do-autor.md`

2. Adicione o cabeçalho YAML:
   ```yaml
   ---
   name: nome-do-autor
   display_name: Nome Completo
   position: Cargo ou Título
   avatar: /assets/images/authors/nome-do-autor.jpg
   bio: Biografia breve do autor (1-2 parágrafos).
   linkedin: https://linkedin.com/in/nome-do-autor
   website: https://site-do-autor.com.br
   ---
   ```

## 🚀 Implantação

### Preparação para Produção

Antes de implantar para produção:

1. **Verifique o SEO**:
   - Todas as páginas devem ter title, description e imagens adequadas
   - Links internos devem estar funcionando
   - Sitemap deve estar atualizado

2. **Otimize para Performance**:
   - Comprima imagens
   - Verifique o carregamento de scripts
   - Teste em diferentes dispositivos e tamanhos de tela

### Implantação no Vercel (Recomendado)

O projeto está configurado para ser facilmente implantado no Vercel, com o arquivo `vercel.json` já incluído.

1. Faça push do código para o GitHub:
   ```bash
   git push origin master
   ```

2. Vincule o repositório ao Vercel:
   - Acesse o [Dashboard do Vercel](https://vercel.com/dashboard)
   - Importe o repositório do GitHub
   - Mantenha as configurações padrão e clique em "Deploy"

3. Configure um domínio personalizado:
   - No dashboard do Vercel, acesse o projeto
   - Vá para "Settings" > "Domains"
   - Adicione seu domínio personalizado (ex: rhilo.adv.br)
   - Siga as instruções para configurar os registros DNS

## 📊 Funcionalidades Implementadas

### Gráficos e Visualizações

O site utiliza a biblioteca Chart.js para criar visualizações de dados interativas:

1. **Gráfico de Performance Comparativa**: Compara o desempenho do fundo Rhilo com outros índices de mercado (CDI e Ibovespa).

2. **Gráfico de Distribuição de Ativos**: Mostra a composição do portfólio do fundo por tipo de ativo judicial.

Para modificar ou adicionar novos gráficos:

1. Localize os scripts Chart.js nas seções correspondentes.
2. Edite os dados, opções e configurações conforme necessário.

### Timeline e Processo de Investimento

Foi implementada uma timeline visual que explica o processo de investimento em ativos judiciais, desde a prospecção até a gestão do portfólio. Esta funcionalidade encontra-se na seção de fundos de investimento.

### Formulário de Contato

O formulário de contato está integrado e configurado para captar leads tanto de investidores quanto de advogados/clientes com créditos judiciais.

### Scripts de Extração de Conteúdo

O projeto inclui scripts para extração de conteúdo relevante de artigos do Migalhas:

- `fetch_articles.rb`: Script Ruby para extração de conteúdo.
- `fetch_migalhas.sh`: Shell script para executar a extração via Docker.

Estes scripts são úteis para manter o site atualizado com informações relevantes sobre o mercado de ativos judiciais.

## 📝 Licença

Copyright © 2025 Rhilo Investimentos LTDA. Todos os direitos reservados.