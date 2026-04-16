**Sistema de Ponto de Venda (PDV) Desktop** leve, rápido e 100% funcional offline para pequenos e médios varejistas.

Desenvolvido com **Electron + React + SQLite** no desktop e licenciamento por assinatura seguro via nuvem.

---

## ✨ Sobre o Projeto

O **Gestão Camaleão PDV** é uma solução completa de frente de caixa pensada para quem precisa de velocidade no atendimento, controle de estoque simples e relatórios úteis — tudo funcionando mesmo sem internet após a ativação.

### Principais Destaques

- Interface limpa e rápida com suporte a atalhos de teclado
- Leitura de código de barras (scanner ou digitação)
- Controle automático de estoque com alerta de baixo estoque
- Finalização de venda com Dinheiro, Débito, Crédito e PIX
- Geração de cupom não-fiscal para impressoras térmicas (58mm/80mm)
- Dashboards e relatórios locais (faturamento diário, top produtos, mix de pagamentos)
- Sistema robusto de licenciamento por assinatura com vínculo de hardware (HWID)
- Funciona 100% offline após ativação

---

## 🏗️ Estrutura do Projeto

O repositório é um **monorepo** organizado da seguinte forma:

### 1. `gc-desktop-app/` – Aplicação Desktop (Electron)

```bash
gc-desktop-app/
├── src/
│   ├── main/                  # Backend Node.js do Electron
│   │   ├── database/          # Conexão, migrações e queries do SQLite
│   │   ├── security/          # Validação de HWID e chave de licença
│   │   └── main.js            # Processo principal do Electron
│   ├── renderer/              # Frontend React
│   │   ├── components/        # PDV, Estoque, Dashboard, Relatórios
│   │   ├── hooks/             # Gerenciamento de estado (carrinho, vendas, etc.)
│   │   └── index.html
│   └── shared/                # Tipagens TypeScript e constantes compartilhadas
├── assets/                    # Ícones, logos e sons de bipe
├── sqlite.db                  # Banco de dados local (gerado na primeira execução)
├── forge.config.js            # Configuração do Electron Forge para gerar .exe
└── package.json


2. gc-landing-page/ – Site Institucional e Checkout
Bashgc-landing-page/
├── public/                    # Imagens, logotipos e instalador .exe
├── src/
│   ├── components/            # Navbar, Cards de planos, Depoimentos, Footer
│   ├── pages/                 # Home, Preços, Suporte, Termos de Uso, Política de Privacidade
│   ├── services/              # Integração com Mercado Pago (checkout e webhook)
│   └── package.json


3. gc-licensing-api/ – API de Licenciamento (Node.js + Express)
Bashgc-licensing-api/
├── src/
│   ├── controllers/           # Lógica de geração, validação e renovação de licenças
│   ├── models/                # Schemas MongoDB (License, User, Payment)
│   ├── routes/                # Endpoints da API (/validate, /webhook, /renew, etc.)
│   ├── services/              # Envio de e-mail, integração com pagamento e HWID
│   └── app.js                 # Configuração e inicialização do Express
├── .env                       # Variáveis de ambiente (MongoDB URI, chaves secretas, Mercado Pago)
└── package.json

📊 Fluxo Operacional Completo

Compra e Ativação → Cliente acessa o site, escolhe plano (Mensal/Trimestral/Anual), paga via PIX ou cartão.
Processamento → API gera chave única + salva no MongoDB Atlas.
Entrega → Cliente recebe e-mail com chave de licença e link para download do .exe.
Instalação → Executa o software, insere a chave → valida HWID e ativa.
Uso Diário → PDV, estoque e relatórios funcionam totalmente offline.
Renovação → Ao expirar, o sistema bloqueia e direciona para nova compra no site.

CamadaTecnologiaDesktop AppElectron + React + Tailwind CSSBanco de Dados LocalSQLite via better-sqlite3API de LicenciamentoNode.js + Express + MongoDB AtlasPagamentosMercado Pago (PIX, Cartão, Boleto)EmpacotamentoElectron ForgeDeploy do SiteVercelDeploy da APIRender / RailwayTema VisualTons de verde e cinza escuro (Camaleão)

🚀 Como Rodar em Desenvolvimento
Pré-requisitos

Node.js 18 ou superior
Git
Conta MongoDB Atlas (para a API)