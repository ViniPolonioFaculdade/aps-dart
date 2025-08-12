# Calculadora Científica Flutter

Uma calculadora científica moderna desenvolvida em Flutter com funcionalidades avançadas de cálculo.

## ✨ Melhorias Implementadas

### 🔧 Correções Críticas
- **Precisão Matemática Melhorada**: Corrigida a conversão radiano/grau usando π ao invés de 3.14
- **Validação de Entrada**: Prevenção de operadores duplos e sequências inválidas
- **Tratamento de Erros**: Melhor manipulação de erros e feedback ao usuário
- **Função de Arredondamento**: Simplificada e corrigida para maior precisão

### 🧮 Novas Funcionalidades
- **Funções Logarítmicas**: Adicionadas funções `log` (logaritmo base 10) e `ln` (logaritmo natural)
- **Memória**: Implementadas funções de memória (MC, MR, M+, M-)
- **Formatação Inteligente**: Resultados formatados automaticamente para melhor legibilidade
- **Indicador de Memória**: Indicador visual quando há valores armazenados na memória

### 🎨 Melhorias de Interface
- **Design Moderno**: Botões com bordas arredondadas e sombras
- **Feedback Visual**: Melhor resposta ao toque com animações suaves
- **Exibição Responsiva**: Display scrollável horizontalmente para expressões longas
- **Cores Aprimoradas**: Esquema de cores mais profissional e acessível

### 🧪 Testes
- **Testes Unitários**: Cobertura abrangente para todas as operações matemáticas
- **Validação de Precisão**: Testes específicos para verificar a precisão das funções trigonométricas

## 📱 Funcionalidades

### Operações Básicas
- ➕ Adição
- ➖ Subtração  
- ✖️ Multiplicação
- ➗ Divisão
- 🔢 Porcentagem

### Funções Científicas
- 📐 Trigonométricas: sin, cos, tan
- 📊 Logarítmicas: log (base 10), ln (natural)
- 🔺 Potenciação: x², xʸ
- √ Raiz quadrada

### Funcionalidades Avançadas
- 🧠 Memória: MC, MR, M+, M-
- 🔢 Múltiplos tipos de parênteses: (), [], {}
- ↩️ Backspace e clear (AC)
- 🎯 Validação de entrada automática

## 🚀 Como Usar

### Operações Básicas
1. Digite números usando o teclado numérico
2. Selecione operadores (+, -, ×, ÷)
3. Pressione `=` para calcular

### Funções Científicas
1. Pressione a função desejada (sin, cos, tan, log, ln)
2. Digite o valor entre parênteses
3. Pressione `=` para calcular

### Memória
- **MC**: Limpa a memória
- **MR**: Recupera valor da memória
- **M+**: Adiciona à memória
- **M-**: Subtrai da memória

## 🛠️ Tecnologias

- **Flutter**: Framework de desenvolvimento
- **Dart**: Linguagem de programação
- **Material Design**: Sistema de design

## 📋 Exemplos de Uso

```
Operações básicas:
2 + 3 = 5
10 × 5 = 50
15 ÷ 3 = 5

Funções científicas:
sin(30) = 0.5
cos(60) = 0.5
log(100) = 2
ln(2.718) ≈ 1

Expressões complexas:
(2 + 3) × 4 = 20
sin(30) + cos(60) = 1
2^3 + log(100) = 10
```

## 🧪 Executar Testes

```bash
flutter test
```

## 📦 Instalação

1. Clone o repositório
2. Execute `flutter pub get`
3. Execute `flutter run`

## 🐛 Problemas Conhecidos Resolvidos

- ✅ Conversão imprecisa de radianos para graus
- ✅ Falta de validação de entrada
- ✅ Operadores duplos causando erros
- ✅ Função de arredondamento incorreta
- ✅ Interface sem feedback visual adequado

## 🔮 Futuras Melhorias

- Histórico de cálculos
- Mais funções científicas (factorial, hiperbólicas)
- Modo noturno
- Personalização de temas
- Exportação de resultados