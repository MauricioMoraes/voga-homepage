# Resolução do Problema de Loop de Redirecionamentos em ia10x.adv.br

Este documento apresenta soluções para o problema de loop de redirecionamentos identificado no site ia10x.adv.br hospedado no Vercel com DNS no CloudFlare.

## Diagnóstico do Problema

Quando um loop de redirecionamento ocorre entre Vercel e CloudFlare, geralmente é causado por configurações conflitantes de SSL ou regras de redirecionamento. Os cenários mais comuns são:

1. Configurações SSL incompatíveis entre Vercel e CloudFlare
2. Regras de redirecionamento duplicadas (no Vercel e no CloudFlare)
3. Configurações de WWW vs non-WWW conflitantes
4. Problemas relacionados ao protocolo HTTPS

## Soluções Recomendadas (em ordem de prioridade)

### 1. Corrigir Configuração SSL no CloudFlare

O modo SSL no CloudFlare deve ser configurado como "Full" ou "Full (Strict)" para funcionar corretamente com o Vercel:

1. Acesse o dashboard do CloudFlare
2. Selecione o domínio ia10x.adv.br
3. Vá para a seção "SSL/TLS"
4. Mude o modo SSL para "Full" ou "Full (Strict)"

> **Por que isso funciona**: No modo "Flexible", o CloudFlare se conecta via HTTPS com o cliente, mas via HTTP com o Vercel. O Vercel redirecionará para HTTPS, causando um loop.

### 2. Desativar Redirecionamentos Duplicados

Se o problema persistir, verifique se não há redirecionamentos duplicados:

1. No dashboard do CloudFlare, verifique se há Page Rules configuradas que forçam HTTPS ou redirecionam www para non-www (ou vice-versa).
2. Compare com as configurações do Vercel (no dashboard do Vercel, na seção "Settings" > "Domain")

> **Solução**: Escolha apenas um lugar para gerenciar redirecionamentos, preferencialmente no CloudFlare. Remova qualquer regra duplicada no Vercel.

### 3. Adicionar um Arquivo `_redirects` ao Projeto

Crie um arquivo `_redirects` na raiz do projeto para gerenciar redirecionamentos (se necessário):

```
# Exemplo para garantir consistência
http://ia10x.adv.br/* https://ia10x.adv.br/:splat 301!
http://www.ia10x.adv.br/* https://ia10x.adv.br/:splat 301!
```

### 4. Verificar Configurações de HSTS no Vercel

No dashboard do Vercel, verifique se há configurações de HSTS (HTTP Strict Transport Security) que possam estar causando redirecionamentos forçados:

1. Vá para "Settings" > "Security" no projeto no Vercel
2. Desative temporariamente HSTS se estiver habilitado

### 5. Atualizar Configuração do `vercel.json`

Modifique o arquivo `vercel.json` para incluir configurações explícitas de redirecionamento:

```json
{
  "buildCommand": "bundle exec jekyll build --trace || mkdir -p _site && cp -R assets _site/",
  "outputDirectory": "_site",
  "framework": "jekyll",
  "installCommand": "bundle install",
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        {
          "key": "X-Content-Type-Options",
          "value": "nosniff"
        },
        {
          "key": "X-Frame-Options",
          "value": "DENY"
        },
        {
          "key": "X-XSS-Protection",
          "value": "1; mode=block"
        },
        {
          "key": "Referrer-Policy",
          "value": "strict-origin-when-cross-origin"
        },
        {
          "key": "Permissions-Policy",
          "value": "camera=(), microphone=(), geolocation=(), interest-cohort=()"
        }
      ]
    }
  ],
  "trailingSlash": false
}
```

### 6. Verificar se há Workers no CloudFlare

Verifique e desative temporariamente qualquer CloudFlare Worker que possa estar interferindo com redirecionamentos ou manipulação de URLs.

## Diagnóstico Adicional

Se os problemas persistirem, analise os cabeçalhos de redirecionamento usando:

```bash
# Instalar o curl se necessário
curl -I https://ia10x.adv.br
```

Procure por cabeçalhos como `Location:` para identificar para onde o site está sendo redirecionado.

## Configuração Ideal

Para um site Jekyll hospedado no Vercel com DNS no CloudFlare, a configuração ideal é:

1. CloudFlare: SSL em modo "Full"
2. CloudFlare: "Always Use HTTPS" ativado
3. CloudFlare: Uma Page Rule para redirecionamento www para non-www (ou vice-versa)
4. Vercel: Nenhuma regra de redirecionamento adicional
5. Jekyll: URL configurada corretamente no _config.yml