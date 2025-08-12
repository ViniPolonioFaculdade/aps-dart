# Changelog - Melhorias da Calculadora

## [1.1.0] - 2024-08-12

### 🔧 Correções Críticas
- **Precisão Matemática**: Substituída a constante `180/3.14` por `180/π` para conversões radiano/grau mais precisas
- **Função de Arredondamento**: Corrigida a lógica da função `arrendondar()` que estava produzindo resultados incorretos
- **Tratamento de NaN/Infinito**: Adicionado tratamento para valores NaN e infinitos na função de arredondamento

### ✨ Novas Funcionalidades
- **Funções Logarítmicas**: 
  - `log()` - Logaritmo base 10
  - `ln()` - Logaritmo natural (base e)
- **Sistema de Memória**:
  - `MC` - Memory Clear (limpar memória)
  - `MR` - Memory Recall (recuperar da memória)
  - `M+` - Memory Add (adicionar à memória)
  - `M-` - Memory Subtract (subtrair da memória)
- **Validação de Entrada**: Sistema que previne operadores duplos (++, --, ××, etc.)
- **Formatação Inteligente de Resultados**:
  - Números inteiros exibidos sem casas decimais
  - Notação científica para números muito grandes/pequenos
  - Símbolos ∞ e -∞ para infinito
  - Remoção automática de zeros desnecessários

### 🎨 Melhorias de Interface
- **Design dos Botões**:
  - Bordas arredondadas
  - Sombras sutis
  - Melhor feedback de toque
  - Cores mais contrastantes
- **Display Aprimorado**:
  - Scroll horizontal para expressões longas
  - Indicador visual de memória ativa
  - Melhor contraste e legibilidade
  - Espaçamento otimizado
- **Layout Geral**:
  - Título atualizado para "Calculadora Científica"
  - Cores de fundo mais suaves
  - Separadores visuais entre seções
  - Espaçamento entre botões aumentado

### 🧪 Testes Adicionados
- Testes unitários para operações básicas
- Testes de precisão para funções trigonométricas
- Testes para novas funções logarítmicas
- Testes de validação de entrada
- Testes da função de arredondamento corrigida
- Testes de conversão radiano/grau

### 📝 Documentação
- README abrangente com exemplos de uso
- Changelog detalhado das modificações
- Comentários no código para melhor manutenibilidade

### 🔧 Melhorias Técnicas
- Código mais organizado e legível
- Melhor tratamento de erros
- Validação preventiva de entrada
- Otimização de performance no display
- Consistência entre versão CLI e Flutter

### 🐛 Bugs Corrigidos
- Operadores duplos não causam mais crashes
- Divisão por zero tratada adequadamente
- Funções trigonométricas com precisão melhorada
- Memory leak na atualização da interface eliminado
- Parsing de strings com funções logarítmicas corrigido

---

## [1.0.0] - Versão Original
- Operações básicas (+, -, ×, ÷)
- Funções trigonométricas (sin, cos, tan)
- Suporte a parênteses
- Interface Flutter básica
- Versão linha de comando