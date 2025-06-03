# Voga - Ecossistema de Soluções Tecnológicas para Advogados

![Voga Logo](/assets/images/logo.svg)

## Sobre o Projeto

A **Voga** é um hub de soluções tecnológicas desenvolvido especificamente para advogados, oferecendo um ecossistema completo de ferramentas que permitem aos escritórios de advocacia faturar mais com maior eficiência. 

A principal solução da Voga é o **Cálculo Jurídico** ([calculojuridico.com.br](https://calculojuridico.com.br)), que foi o início da empresa e continua sendo o carro-chefe das soluções oferecidas. Além disso, o ecossistema Voga inclui outras soluções especializadas:

- **[calculojuridico.com.br](https://calculojuridico.com.br)** - Solução principal de cálculos jurídicos
- **[edossie.com.br](https://edossie.com.br)** - Gestão de dossiês e documentos
- **[chatjuridico.com.br](https://chatjuridico.com.br)** - Assistente jurídico com IA
- **[clientes.adv.br](https://clientes.adv.br)** - Gestão de relacionamento com clientes
- **[advogadosaprovados.com.br](https://advogadosaprovados.com.br)** - Plataforma de capacitação

Este repositório contém o código-fonte do site institucional da Voga, construído com Jekyll - um gerador de sites estáticos.

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

O site da Voga foi desenvolvido com foco em:

1. **Apresentação do Ecossistema**: Destaque para o Cálculo Jurídico como solução principal e apresentação das demais ferramentas do ecossistema Voga.

2. **Hub de Soluções para Advogados**: Posicionamento da Voga como o local onde advogados encontram todas as ferramentas tecnológicas necessárias para modernizar e otimizar seus escritórios.

3. **Educação sobre Tecnologia Jurídica**: Explicação sobre como a tecnologia e IA podem transformar a prática jurídica e aumentar a eficiência dos escritórios.

4. **Blog Especializado**: Artigos sobre tecnologia jurídica, gestão de escritórios, automação de processos e inovação no direito.

5. **Geração de Leads**: Captação de advogados interessados em modernizar seus escritórios com as soluções do ecossistema Voga.

## 🛠️ Tecnologias Utilizadas

- **Jekyll**: Gerador de sites estáticos em Ruby
- **Bootstrap 5**: Framework CSS para desenvolvimento responsivo
- **Sass/SCSS**: Pré-processador CSS para estilização avançada
- **Font Awesome**: Biblioteca de ícones
- **JavaScript**: Animações e interatividade
- **Docker**: Containerização para desenvolvimento consistente
- **Google Cloud Build**: CI/CD para build automático
- **Firebase Hosting**: Plataforma de deploy e hospedagem

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

Para deploy automático:
- Google Cloud CLI (`gcloud`)
- Projeto configurado no Firebase
- Permissões no Google Cloud Build

## 🚀 Instalação e Configuração

### Usando Docker (Recomendado)

O projeto está configurado para ser executado em um ambiente containerizado com Docker, garantindo consistência entre diferentes ambientes de desenvolvimento.

1. **Clone o repositório**:
   ```bash
   git clone [URL_DO_REPOSITORIO]
   cd voga-homepage
   ```

2. **Iniciar com o script de execução simples**:
   ```bash
   # Executa Jekyll em um container Docker com live reload
   ./start.sh
   ```

3. **Acesse o site**:
   O site estará disponível em http://localhost:4000

### Usando Docker Compose (Para desenvolvimento)

Para um ambiente de desenvolvimento mais completo:

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
   git clone [URL_DO_REPOSITORIO]
   cd voga-homepage
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

O projeto segue a estrutura padrão do Jekyll com personalizações para o ecossistema Voga:

```
voga-homepage/
├── _authors/            # Perfis de autores do blog
├── _data/               # Arquivos de dados em YAML (navegação, rodapé, etc.)
├── _includes/           # Componentes reutilizáveis HTML
│   ├── navigation.html  # Menu de navegação
│   ├── footer.html      # Rodapé do site
│   ├── hero.html        # Banner principal da página inicial
│   ├── venture-builder.html # Seção do ecossistema Voga
│   ├── investment-funds.html # Seção de soluções
│   └── ...
├── _layouts/            # Templates de layout
│   ├── default.html     # Layout base
│   ├── home.html        # Layout da página inicial
│   ├── post.html        # Layout para posts do blog
│   └── ...
├── _posts/              # Artigos do blog
├── _sass/               # Arquivos de estilo SCSS
├── assets/              # Recursos estáticos
│   ├── css/             # Arquivos CSS compilados
│   ├── js/              # Scripts JavaScript e animações
│   ├── images/          # Imagens do site
│   └── ...
├── pages/               # Páginas principais do site
├── _config.yml          # Configuração principal do Jekyll
├── Gemfile              # Dependências Ruby
├── docker-compose.yml   # Configuração do Docker Compose
├── Dockerfile           # Configuração do Docker
├── cloudbuild.yaml      # Configuração do Google Cloud Build
└── firebase.json        # Configuração para deploy no Firebase
```

## 🎨 Personalização e Desenvolvimento

### Navegação e Menu

O menu de navegação é controlado pelo arquivo `_data/navigation.yml`. Para adicionar, remover ou modificar itens do menu:

```yaml
# _data/navigation.yml
- name: Início
  link: /
- name: Soluções
  link: /#solutions
- name: Blog
  link: /blog
```

### Rodapé

O rodapé é controlado pelo arquivo `_data/footer.yml` e inclui links para todas as soluções do ecossistema Voga.

### Estilização

O projeto utiliza Sass/SCSS para estilização. O arquivo principal é `assets/css/main.css`.

Para modificar cores, fontes e outros aspectos visuais:

```css
:root {
  --primary-color: #4A6FFF;
  --secondary-color: #6C757D;
  --light-color: #F8F9FA;
  --dark-color: #212529;
  --accent-color: #10B981;
}
```

## 📝 Sistema de Blog

### Adicionar Novo Post

1. Crie um arquivo na pasta `_posts` seguindo o formato: `YYYY-MM-DD-titulo-do-post.md`

2. Adicione o cabeçalho YAML:
   ```yaml
   ---
   layout: post
   title: "Título do Post"
   author: nome-do-autor
   date: YYYY-MM-DD HH:MM:SS -0300
   categories: [Tecnologia, Advocacia]
   tags: [automacao, ia, gestao]
   image: /assets/images/posts/imagem.jpg
   description: "Descrição do post para SEO."
   ---
   ```

### Adicionar Novo Autor

1. Crie um arquivo na pasta `_authors`: `nome-do-autor.md`

2. Adicione o cabeçalho YAML:
   ```yaml
   ---
   name: nome-do-autor
   display_name: Nome Completo
   position: Cargo ou Título
   avatar: /assets/images/authors/nome-do-autor.jpg
   bio: Biografia do autor.
   ---
   ```

## 🚀 Implantação

### Deploy no Firebase Hosting via Cloud Build (Automático)

O projeto está configurado para deploy automático usando Google Cloud Build + Firebase Hosting:

1. **Configuração inicial** (uma vez):
   ```bash
   # Configure o projeto no Google Cloud
   gcloud config set project voga-adv
   
   # Conecte o repositório ao Cloud Build
   gcloud builds triggers create github \
     --repo-name=voga-homepage \
     --repo-owner=MauricioMoraes \
     --branch-pattern=^master$ \
     --build-config=cloudbuild.yaml
   ```

2. **Deploy automático**:
   ```bash
   git add .
   git commit -m "Atualização do site Voga"
   git push origin master
   ```
   - Cloud Build detecta o push automaticamente
   - Executa build do Jekyll
   - Deploy automático para Firebase Hosting
   - Site disponível em voga.adv.br

### Deploy Manual

Para deploy manual em outros serviços:

1. **Gere o site estático**:
   ```bash
   bundle exec jekyll build
   ```

2. **Os arquivos estarão na pasta `_site/`** prontos para upload

## 📊 Funcionalidades Implementadas

### Animações Interativas

O site inclui animações JavaScript personalizadas para:
- Apresentação do ecossistema Voga
- Demonstração das soluções
- Efeitos visuais de transição

### Seções Principais

1. **Hero Section**: Apresentação da Voga como ecossistema
2. **Cálculo Jurídico**: Destaque da solução principal
3. **Ecossistema de Soluções**: Apresentação de todas as ferramentas
4. **Blog Técnico**: Artigos sobre tecnologia jurídica
5. **Formulários de Contato**: Captação de leads

### Integração com Soluções

O site serve como hub central que direciona para todas as soluções do ecossistema:
- Links diretos para cada plataforma
- Descrições detalhadas de funcionalidades
- Cases de uso e benefícios

## 🔗 Links Importantes

- **Site Principal**: [voga.adv.br](https://voga.adv.br)
- **Cálculo Jurídico**: [calculojuridico.com.br](https://calculojuridico.com.br)
- **E-Dossie**: [edossie.com.br](https://edossie.com.br)
- **Chat Jurídico**: [chatjuridico.com.br](https://chatjuridico.com.br)
- **Clientes ADV**: [clientes.adv.br](https://clientes.adv.br)
- **Advogados Aprovados**: [advogadosaprovados.com.br](https://advogadosaprovados.com.br)

## 📝 Licença

Copyright © 2025 Voga. Todos os direitos reservados.

---

**Voga - Transformando a advocacia através da tecnologia**